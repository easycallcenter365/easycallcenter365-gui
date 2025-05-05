package com.ruoyi.cc.service;

import java.util.List;
import com.ruoyi.cc.domain.CcConferenceMembers;

/**
 * 【请填写功能名称】Service接口
 * 
 * @author ruoyi
 * @date 2024-12-22
 */
public interface ICcConferenceMembersService 
{
    /**
     * 查询【请填写功能名称】
     * 
     * @param id 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    public CcConferenceMembers selectCcConferenceMembersById(String id);

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param ccConferenceMembers 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<CcConferenceMembers> selectCcConferenceMembersList(CcConferenceMembers ccConferenceMembers);

    /**
     * 新增【请填写功能名称】
     * 
     * @param ccConferenceMembers 【请填写功能名称】
     * @return 结果
     */
    public int insertCcConferenceMembers(CcConferenceMembers ccConferenceMembers);

    /**
     * 修改【请填写功能名称】
     * 
     * @param ccConferenceMembers 【请填写功能名称】
     * @return 结果
     */
    public int updateCcConferenceMembers(CcConferenceMembers ccConferenceMembers);

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param ids 需要删除的【请填写功能名称】主键集合
     * @return 结果
     */
    public int deleteCcConferenceMembersByIds(String ids);

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param id 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteCcConferenceMembersById(String id);
}
