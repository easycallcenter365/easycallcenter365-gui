package com.ruoyi.aicall.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.aicall.mapper.CcInboundLlmAccountMapper;
import com.ruoyi.aicall.domain.CcInboundLlmAccount;
import com.ruoyi.aicall.service.ICcInboundLlmAccountService;
import com.ruoyi.common.core.text.Convert;

/**
 * 呼入大模型配置Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-06-23
 */
@Service
public class CcInboundLlmAccountServiceImpl implements ICcInboundLlmAccountService 
{
    @Autowired
    private CcInboundLlmAccountMapper ccInboundLlmAccountMapper;

    /**
     * 查询呼入大模型配置
     * 
     * @param id 呼入大模型配置主键
     * @return 呼入大模型配置
     */
    @Override
    public CcInboundLlmAccount selectCcInboundLlmAccountById(Integer id)
    {
        return ccInboundLlmAccountMapper.selectCcInboundLlmAccountById(id);
    }

    /**
     * 查询呼入大模型配置列表
     * 
     * @param ccInboundLlmAccount 呼入大模型配置
     * @return 呼入大模型配置
     */
    @Override
    public List<CcInboundLlmAccount> selectCcInboundLlmAccountList(CcInboundLlmAccount ccInboundLlmAccount)
    {
        return ccInboundLlmAccountMapper.selectCcInboundLlmAccountList(ccInboundLlmAccount);
    }

    /**
     * 新增呼入大模型配置
     * 
     * @param ccInboundLlmAccount 呼入大模型配置
     * @return 结果
     */
    @Override
    public int insertCcInboundLlmAccount(CcInboundLlmAccount ccInboundLlmAccount)
    {
        return ccInboundLlmAccountMapper.insertCcInboundLlmAccount(ccInboundLlmAccount);
    }

    /**
     * 修改呼入大模型配置
     * 
     * @param ccInboundLlmAccount 呼入大模型配置
     * @return 结果
     */
    @Override
    public int updateCcInboundLlmAccount(CcInboundLlmAccount ccInboundLlmAccount)
    {
        return ccInboundLlmAccountMapper.updateCcInboundLlmAccount(ccInboundLlmAccount);
    }

    /**
     * 批量删除呼入大模型配置
     * 
     * @param ids 需要删除的呼入大模型配置主键
     * @return 结果
     */
    @Override
    public int deleteCcInboundLlmAccountByIds(String ids)
    {
        return ccInboundLlmAccountMapper.deleteCcInboundLlmAccountByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除呼入大模型配置信息
     * 
     * @param id 呼入大模型配置主键
     * @return 结果
     */
    @Override
    public int deleteCcInboundLlmAccountById(Integer id)
    {
        return ccInboundLlmAccountMapper.deleteCcInboundLlmAccountById(id);
    }

    @Override
    public List<CcInboundLlmAccount> selectCcInboundLlmAccountByCallee(String callee) {
        return ccInboundLlmAccountMapper.selectCcInboundLlmAccountByCallee(callee);
    }
}
