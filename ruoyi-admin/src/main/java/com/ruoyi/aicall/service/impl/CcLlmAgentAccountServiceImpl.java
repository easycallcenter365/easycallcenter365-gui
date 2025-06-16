package com.ruoyi.aicall.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.aicall.mapper.CcLlmAgentAccountMapper;
import com.ruoyi.aicall.domain.CcLlmAgentAccount;
import com.ruoyi.aicall.service.ICcLlmAgentAccountService;
import com.ruoyi.common.core.text.Convert;

/**
 * 机器人参数配置Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-06-16
 */
@Service
public class CcLlmAgentAccountServiceImpl implements ICcLlmAgentAccountService 
{
    @Autowired
    private CcLlmAgentAccountMapper ccLlmAgentAccountMapper;

    /**
     * 查询机器人参数配置
     * 
     * @param id 机器人参数配置主键
     * @return 机器人参数配置
     */
    @Override
    public CcLlmAgentAccount selectCcLlmAgentAccountById(Integer id)
    {
        return ccLlmAgentAccountMapper.selectCcLlmAgentAccountById(id);
    }

    /**
     * 查询机器人参数配置列表
     * 
     * @param ccLlmAgentAccount 机器人参数配置
     * @return 机器人参数配置
     */
    @Override
    public List<CcLlmAgentAccount> selectCcLlmAgentAccountList(CcLlmAgentAccount ccLlmAgentAccount)
    {
        return ccLlmAgentAccountMapper.selectCcLlmAgentAccountList(ccLlmAgentAccount);
    }

    /**
     * 新增机器人参数配置
     * 
     * @param ccLlmAgentAccount 机器人参数配置
     * @return 结果
     */
    @Override
    public int insertCcLlmAgentAccount(CcLlmAgentAccount ccLlmAgentAccount)
    {
        return ccLlmAgentAccountMapper.insertCcLlmAgentAccount(ccLlmAgentAccount);
    }

    /**
     * 修改机器人参数配置
     * 
     * @param ccLlmAgentAccount 机器人参数配置
     * @return 结果
     */
    @Override
    public int updateCcLlmAgentAccount(CcLlmAgentAccount ccLlmAgentAccount)
    {
        return ccLlmAgentAccountMapper.updateCcLlmAgentAccount(ccLlmAgentAccount);
    }

    /**
     * 批量删除机器人参数配置
     * 
     * @param ids 需要删除的机器人参数配置主键
     * @return 结果
     */
    @Override
    public int deleteCcLlmAgentAccountByIds(String ids)
    {
        return ccLlmAgentAccountMapper.deleteCcLlmAgentAccountByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除机器人参数配置信息
     * 
     * @param id 机器人参数配置主键
     * @return 结果
     */
    @Override
    public int deleteCcLlmAgentAccountById(Integer id)
    {
        return ccLlmAgentAccountMapper.deleteCcLlmAgentAccountById(id);
    }
}
