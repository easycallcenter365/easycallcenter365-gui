package com.ruoyi.cc.utils;

import com.alibaba.fastjson.JSON;
import com.ruoyi.aicall.domain.CcLlmAgentAccount;
import com.ruoyi.aicall.llm.model.AccountBaseEntity;
import com.ruoyi.common.utils.ExceptionUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class LlmAccountParser {

    protected final static Logger logger = LoggerFactory.getLogger(LlmAccountParser.class);

    public static AccountBaseEntity parse(CcLlmAgentAccount accountJSON ){
        if(accountJSON == null)  { return null; }
        try {
            Class<?> clazz = Class.forName("com.ruoyi.aicall.llm.model." + accountJSON.getAccountEntity());
            AccountBaseEntity entity =  (AccountBaseEntity) JSON.parseObject(accountJSON.getAccountJson(), clazz);
            entity.provider = accountJSON.getProviderClassName();
            entity.interruptFlag = accountJSON.getInterruptFlag();
            entity.interruptKeywords = accountJSON.getInterruptKeywords();
            entity.interruptIgnoreKeywords = accountJSON.getInterruptIgnoreKeywords();
            return entity;
        } catch (Throwable e) {
            logger.error("parse llmAccount error for accountId={}, {} {} ", accountJSON.getId(),
                    e.toString(),
                    ExceptionUtil.getExceptionMessage(e)
            );
        }
        return null;
    }

}
