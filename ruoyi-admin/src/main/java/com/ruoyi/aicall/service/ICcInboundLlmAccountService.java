package com.ruoyi.aicall.service;

import java.util.List;
import com.ruoyi.aicall.domain.CcInboundLlmAccount;

/**
 * 呼入大模型配置Service接口
 * 
 * @author ruoyi
 * @date 2025-06-23
 */
public interface ICcInboundLlmAccountService 
{
    /**
     * 查询呼入大模型配置
     * 
     * @param id 呼入大模型配置主键
     * @return 呼入大模型配置
     */
    public CcInboundLlmAccount selectCcInboundLlmAccountById(Integer id);

    /**
     * 查询呼入大模型配置列表
     * 
     * @param ccInboundLlmAccount 呼入大模型配置
     * @return 呼入大模型配置集合
     */
    public List<CcInboundLlmAccount> selectCcInboundLlmAccountList(CcInboundLlmAccount ccInboundLlmAccount);

    /**
     * 新增呼入大模型配置
     * 
     * @param ccInboundLlmAccount 呼入大模型配置
     * @return 结果
     */
    public int insertCcInboundLlmAccount(CcInboundLlmAccount ccInboundLlmAccount);

    /**
     * 修改呼入大模型配置
     * 
     * @param ccInboundLlmAccount 呼入大模型配置
     * @return 结果
     */
    public int updateCcInboundLlmAccount(CcInboundLlmAccount ccInboundLlmAccount);

    /**
     * 批量删除呼入大模型配置
     * 
     * @param ids 需要删除的呼入大模型配置主键集合
     * @return 结果
     */
    public int deleteCcInboundLlmAccountByIds(String ids);

    /**
     * 删除呼入大模型配置信息
     * 
     * @param id 呼入大模型配置主键
     * @return 结果
     */
    public int deleteCcInboundLlmAccountById(Integer id);
}
