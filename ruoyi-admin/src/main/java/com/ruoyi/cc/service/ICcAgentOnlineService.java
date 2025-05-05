package com.ruoyi.cc.service;

import java.util.List;
import com.ruoyi.cc.domain.CcAgentOnline;

/**
 * 【请填写功能名称】Service接口
 * 
 * @author ruoyi
 * @date 2024-12-22
 */
public interface ICcAgentOnlineService 
{
    /**
     * 查询【请填写功能名称】
     * 
     * @param id 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    public CcAgentOnline selectCcAgentOnlineById(String id);

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param ccAgentOnline 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<CcAgentOnline> selectCcAgentOnlineList(CcAgentOnline ccAgentOnline);

    /**
     * 新增【请填写功能名称】
     * 
     * @param ccAgentOnline 【请填写功能名称】
     * @return 结果
     */
    public int insertCcAgentOnline(CcAgentOnline ccAgentOnline);

    /**
     * 修改【请填写功能名称】
     * 
     * @param ccAgentOnline 【请填写功能名称】
     * @return 结果
     */
    public int updateCcAgentOnline(CcAgentOnline ccAgentOnline);

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param ids 需要删除的【请填写功能名称】主键集合
     * @return 结果
     */
    public int deleteCcAgentOnlineByIds(String ids);

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param id 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteCcAgentOnlineById(String id);
}
