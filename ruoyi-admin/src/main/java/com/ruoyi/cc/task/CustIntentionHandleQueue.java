package com.ruoyi.cc.task;

import com.ruoyi.aicall.domain.CcCallPhone;
import com.ruoyi.aicall.domain.CcCallTask;
import com.ruoyi.aicall.domain.CcLlmAgentAccount;
import com.ruoyi.aicall.service.ICcCallPhoneService;
import com.ruoyi.aicall.service.ICcCallTaskService;
import com.ruoyi.aicall.service.ICcLlmAgentAccountService;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.spring.SpringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.*;

/**
 * 处理客户意向打标的线程
 */
public class CustIntentionHandleQueue {
	private static  final Logger log = LoggerFactory.getLogger(CustIntentionHandleQueue.class);

	private static Object locker  = new Object();

	public static void start(){
		synchronized (locker) {
			new Thread(
					new Runnable() {
						@Override
						public void run() {
							CustIntentionHandleQueue();
						}
					} , "CustIntentionHandleQueue").start();
		}
	}

	private static void CustIntentionHandleQueue(){
		log.info("已经启动客户意向跑批线程!");
		while(true) {
			ICcCallPhoneService ccCallPhoneService = SpringUtils.getBean(ICcCallPhoneService.class);
			ICcLlmAgentAccountService llmAgentAccountService = SpringUtils.getBean(ICcLlmAgentAccountService.class);
			ICcCallTaskService ccCallTaskService = SpringUtils.getBean(ICcCallTaskService.class);

			// 1. 获取所有的已挂机未跑批客户意向的通话记录
			List<CcCallPhone> ccCallPhoneList = ccCallPhoneService.getCustIntentionList();
			log.info("客户意向跑批线程====待跑批通话量：{}", ccCallPhoneList.size());
			if (ccCallPhoneList.size() > 0) {
				Map<Integer, CcLlmAgentAccount> intentionTipsMap = new HashMap<>(); // key:llmAccountId    value:intentionTips
				Map<Long, Integer> llmAccountIdMap = new HashMap<>(); // key:batchId    value:llmAccountId
				Map<String, List<String>> intentionMap = new HashMap<>(); // key:intention    value:phoneIdList
				for (CcCallPhone ccCallPhone: ccCallPhoneList) {
					// 2. 获取对应任务的对应大模型配置的客户意向提示词
					Long batchId = ccCallPhone.getBatchId();
					Integer llmAccountId = llmAccountIdMap.get(batchId);
					if (null == llmAccountId) {
						CcCallTask ccCallTask = ccCallTaskService.selectCcCallTaskByBatchId(batchId);
						if (null != ccCallTask) {
							llmAccountId = ccCallTask.getLlmAccountId();
							llmAccountIdMap.put(batchId, llmAccountId);
						}
					}
					CcLlmAgentAccount ccLlmAgentAccount = intentionTipsMap.get(llmAccountId);
					if (null == ccLlmAgentAccount) {
						ccLlmAgentAccount = llmAgentAccountService.selectCcLlmAgentAccountById(llmAccountId);
						if (null == ccLlmAgentAccount) {
							ccLlmAgentAccount = new CcLlmAgentAccount();
							ccLlmAgentAccount.setIntentionTips("");
						}
						intentionTipsMap.put(llmAccountId, ccLlmAgentAccount);
					}
					String intentionTips = ccLlmAgentAccount.getIntentionTips();

					// 3. 未接通的标记为“未接通”，接通的根据提示词和对话内容调用大模型获取客户意向，如果没有提示词，默认客户意向为-
					String intention = "";
					if (StringUtils.isBlank(ccCallPhone.getDialogue()) || ccCallPhone.getDialogue().equals("[]")) {
						intention = "未接通";
					} else if (StringUtils.isBlank(intentionTips)) {
						intention = "-";
					} else {
						intention = ccCallPhoneService.getIntenetionByDialogue(ccLlmAgentAccount, ccCallPhone.getDialogue());
					}
					List<String> phoneIds = intentionMap.getOrDefault(intention, new ArrayList<>());
					phoneIds.add(ccCallPhone.getId());
					intentionMap.put(intention, phoneIds);
				}
				for (String intention: intentionMap.keySet()) {
					List<String> phoneIds = intentionMap.getOrDefault(intention, new ArrayList<>());
					if (phoneIds.size() > 0) {
						ccCallPhoneService.updateIntentionByIds(intention, phoneIds);
					}
				}

			}
			try {
				Thread.sleep(60*1000L); // 每隔1分钟跑一次
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
	}
}