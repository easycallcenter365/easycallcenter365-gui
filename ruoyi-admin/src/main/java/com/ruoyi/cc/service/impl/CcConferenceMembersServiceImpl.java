package com.ruoyi.cc.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.cc.mapper.CcConferenceMembersMapper;
import com.ruoyi.cc.domain.CcConferenceMembers;
import com.ruoyi.cc.service.ICcConferenceMembersService;
import com.ruoyi.common.core.text.Convert;

/**
 * 【请填写功能名称】Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-12-22
 */
@Service
public class CcConferenceMembersServiceImpl implements ICcConferenceMembersService 
{
    @Autowired
    private CcConferenceMembersMapper ccConferenceMembersMapper;

    /**
     * 查询【请填写功能名称】
     * 
     * @param id 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    @Override
    public CcConferenceMembers selectCcConferenceMembersById(String id)
    {
        return ccConferenceMembersMapper.selectCcConferenceMembersById(id);
    }

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param ccConferenceMembers 【请填写功能名称】
     * @return 【请填写功能名称】
     */
    @Override
    public List<CcConferenceMembers> selectCcConferenceMembersList(CcConferenceMembers ccConferenceMembers)
    {
        return ccConferenceMembersMapper.selectCcConferenceMembersList(ccConferenceMembers);
    }

    /**
     * 新增【请填写功能名称】
     * 
     * @param ccConferenceMembers 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int insertCcConferenceMembers(CcConferenceMembers ccConferenceMembers)
    {
        return ccConferenceMembersMapper.insertCcConferenceMembers(ccConferenceMembers);
    }

    /**
     * 修改【请填写功能名称】
     * 
     * @param ccConferenceMembers 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int updateCcConferenceMembers(CcConferenceMembers ccConferenceMembers)
    {
        return ccConferenceMembersMapper.updateCcConferenceMembers(ccConferenceMembers);
    }

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param ids 需要删除的【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteCcConferenceMembersByIds(String ids)
    {
        return ccConferenceMembersMapper.deleteCcConferenceMembersByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param id 【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteCcConferenceMembersById(String id)
    {
        return ccConferenceMembersMapper.deleteCcConferenceMembersById(id);
    }
}
