package com.ruoyi.aicall.service;

import com.ruoyi.aicall.domain.CcCallPhone;
import com.ruoyi.aicall.domain.CcLlmAgentAccount;
import com.ruoyi.aicall.model.CallPhoneExportVo;
import com.ruoyi.aicall.model.CallTaskStatModel;

import java.util.List;

/**
 * 外呼号码Service接口
 * 
 * @author ruoyi
 * @date 2025-05-29
 */
public interface ICcCallPhoneService 
{
    /**
     * 查询外呼号码
     * 
     * @param id 外呼号码主键
     * @return 外呼号码
     */
    public CcCallPhone selectCcCallPhoneById(String id);

    /**
     * 查询外呼号码列表
     * 
     * @param ccCallPhone 外呼号码
     * @return 外呼号码集合
     */
    public List<CcCallPhone> selectCcCallPhoneList(CcCallPhone ccCallPhone);

    /**
     * 新增外呼号码
     * 
     * @param ccCallPhone 外呼号码
     * @return 结果
     */
    public int insertCcCallPhone(CcCallPhone ccCallPhone);

    /**
     * 修改外呼号码
     * 
     * @param ccCallPhone 外呼号码
     * @return 结果
     */
    public int updateCcCallPhone(CcCallPhone ccCallPhone);

    /**
     * 批量删除外呼号码
     * 
     * @param ids 需要删除的外呼号码主键集合
     * @return 结果
     */
    public int deleteCcCallPhoneByIds(String ids);

    /**
     * 删除外呼号码信息
     * 
     * @param id 外呼号码主键
     * @return 结果
     */
    public int deleteCcCallPhoneById(String id);

    /**
     * 根据batchId统计外呼数据
     * @param batchId
     * @return
     */
    public CallTaskStatModel statByBatchId(Long batchId);

    /**
     * 批量入库
     * @param phoneList
     */
    public void batchInsertCcCallPhone(List<CcCallPhone> phoneList);

    List<CcCallPhone> getCustIntentionList();

    void updateIntentionByIds(String intention, List<String> phoneIds);

    String getIntenetionByDialogue(CcLlmAgentAccount ccLlmAgentAccount, String dialogue);
}
