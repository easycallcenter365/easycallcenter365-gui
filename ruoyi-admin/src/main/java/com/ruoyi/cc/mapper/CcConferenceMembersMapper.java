package com.ruoyi.cc.mapper;

import java.util.List;
import com.ruoyi.cc.domain.CcConferenceMembers;

/**
 * ConferenceMembersMapper接口
 * 
 * @author ruoyi
 * @date 2024-12-22
 */
public interface CcConferenceMembersMapper 
{
    /**
     * 查询ConferenceMembers
     * 
     * @param id ConferenceMembers主键
     * @return ConferenceMembers
     */
    public CcConferenceMembers selectCcConferenceMembersById(String id);

    /**
     * 查询ConferenceMembers列表
     * 
     * @param ccConferenceMembers ConferenceMembers
     * @return ConferenceMembers集合
     */
    public List<CcConferenceMembers> selectCcConferenceMembersList(CcConferenceMembers ccConferenceMembers);

    /**
     * 新增ConferenceMembers
     * 
     * @param ccConferenceMembers ConferenceMembers
     * @return 结果
     */
    public int insertCcConferenceMembers(CcConferenceMembers ccConferenceMembers);

    /**
     * 修改ConferenceMembers
     * 
     * @param ccConferenceMembers ConferenceMembers
     * @return 结果
     */
    public int updateCcConferenceMembers(CcConferenceMembers ccConferenceMembers);

    /**
     * 删除ConferenceMembers
     * 
     * @param id ConferenceMembers主键
     * @return 结果
     */
    public int deleteCcConferenceMembersById(String id);

    /**
     * 批量删除ConferenceMembers
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteCcConferenceMembersByIds(String[] ids);
}
