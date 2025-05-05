package com.ruoyi.cc.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.cc.mapper.CcAgentOnlineMapper;
import com.ruoyi.cc.domain.CcAgentOnline;
import com.ruoyi.cc.service.ICcAgentOnlineService;
import com.ruoyi.common.core.text.Convert;

/**
 * 【请填写功能名称】Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-12-22
 */
@Service
public class CcAgentOnlineServiceImpl implements ICcAgentOnlineService 
{
    @Autowired
    private CcAgentOnlineMapper ccAgentOnlineMapper;

    /**
     * 查询【请填写功能名称】
     * 
     * @param id 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    @Override
    public CcAgentOnline selectCcAgentOnlineById(String id)
    {
        return ccAgentOnlineMapper.selectCcAgentOnlineById(id);
    }

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param ccAgentOnline 【请填写功能名称】
     * @return 【请填写功能名称】
     */
    @Override
    public List<CcAgentOnline> selectCcAgentOnlineList(CcAgentOnline ccAgentOnline)
    {
        return ccAgentOnlineMapper.selectCcAgentOnlineList(ccAgentOnline);
    }

    /**
     * 新增【请填写功能名称】
     * 
     * @param ccAgentOnline 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int insertCcAgentOnline(CcAgentOnline ccAgentOnline)
    {
        return ccAgentOnlineMapper.insertCcAgentOnline(ccAgentOnline);
    }

    /**
     * 修改【请填写功能名称】
     * 
     * @param ccAgentOnline 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int updateCcAgentOnline(CcAgentOnline ccAgentOnline)
    {
        return ccAgentOnlineMapper.updateCcAgentOnline(ccAgentOnline);
    }

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param ids 需要删除的【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteCcAgentOnlineByIds(String ids)
    {
        return ccAgentOnlineMapper.deleteCcAgentOnlineByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param id 【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteCcAgentOnlineById(String id)
    {
        return ccAgentOnlineMapper.deleteCcAgentOnlineById(id);
    }
}
