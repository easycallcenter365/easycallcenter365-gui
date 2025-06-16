package com.ruoyi.aicall.service;

import java.util.List;
import com.ruoyi.aicall.domain.CcLlmAgentAccount;

/**
 * 机器人参数配置Service接口
 * 
 * @author ruoyi
 * @date 2025-06-16
 */
public interface ICcLlmAgentAccountService 
{
    /**
     * 查询机器人参数配置
     * 
     * @param id 机器人参数配置主键
     * @return 机器人参数配置
     */
    public CcLlmAgentAccount selectCcLlmAgentAccountById(Integer id);

    /**
     * 查询机器人参数配置列表
     * 
     * @param ccLlmAgentAccount 机器人参数配置
     * @return 机器人参数配置集合
     */
    public List<CcLlmAgentAccount> selectCcLlmAgentAccountList(CcLlmAgentAccount ccLlmAgentAccount);

    /**
     * 新增机器人参数配置
     * 
     * @param ccLlmAgentAccount 机器人参数配置
     * @return 结果
     */
    public int insertCcLlmAgentAccount(CcLlmAgentAccount ccLlmAgentAccount);

    /**
     * 修改机器人参数配置
     * 
     * @param ccLlmAgentAccount 机器人参数配置
     * @return 结果
     */
    public int updateCcLlmAgentAccount(CcLlmAgentAccount ccLlmAgentAccount);

    /**
     * 批量删除机器人参数配置
     * 
     * @param ids 需要删除的机器人参数配置主键集合
     * @return 结果
     */
    public int deleteCcLlmAgentAccountByIds(String ids);

    /**
     * 删除机器人参数配置信息
     * 
     * @param id 机器人参数配置主键
     * @return 结果
     */
    public int deleteCcLlmAgentAccountById(Integer id);
}
