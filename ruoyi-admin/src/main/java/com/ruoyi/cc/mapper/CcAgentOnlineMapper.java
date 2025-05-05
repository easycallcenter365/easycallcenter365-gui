package com.ruoyi.cc.mapper;

import java.util.List;
import com.ruoyi.cc.domain.CcAgentOnline;

/**
 * 在线坐席Mapper接口
 * 
 * @author ruoyi
 * @date 2024-12-22
 */
public interface CcAgentOnlineMapper 
{
    /**
     * 查询在线坐席
     * 
     * @param id 在线坐席主键
     * @return 在线坐席
     */
    public CcAgentOnline selectCcAgentOnlineById(String id);

    /**
     * 查询在线坐席列表
     * 
     * @param ccAgentOnline 在线坐席
     * @return 在线坐席集合
     */
    public List<CcAgentOnline> selectCcAgentOnlineList(CcAgentOnline ccAgentOnline);

    /**
     * 新增在线坐席
     * 
     * @param ccAgentOnline 在线坐席
     * @return 结果
     */
    public int insertCcAgentOnline(CcAgentOnline ccAgentOnline);

    /**
     * 修改在线坐席
     * 
     * @param ccAgentOnline 在线坐席
     * @return 结果
     */
    public int updateCcAgentOnline(CcAgentOnline ccAgentOnline);

    /**
     * 删除在线坐席
     * 
     * @param id 在线坐席主键
     * @return 结果
     */
    public int deleteCcAgentOnlineById(String id);

    /**
     * 批量删除在线坐席
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteCcAgentOnlineByIds(String[] ids);
}
