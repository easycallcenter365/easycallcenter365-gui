package com.ruoyi.cc.mapper;

import java.util.List;
import com.ruoyi.cc.domain.CcConferenceTranscriptions;

/**
 * ConferenceTranscriptionsMapper接口
 * 
 * @author ruoyi
 * @date 2024-12-22
 */
public interface CcConferenceTranscriptionsMapper 
{
    /**
     * 查询ConferenceTranscriptions
     * 
     * @param id ConferenceTranscriptions主键
     * @return ConferenceTranscriptions
     */
    public CcConferenceTranscriptions selectCcConferenceTranscriptionsById(Long id);

    /**
     * 查询ConferenceTranscriptions列表
     * 
     * @param ccConferenceTranscriptions ConferenceTranscriptions
     * @return ConferenceTranscriptions集合
     */
    public List<CcConferenceTranscriptions> selectCcConferenceTranscriptionsList(CcConferenceTranscriptions ccConferenceTranscriptions);

    /**
     * 新增ConferenceTranscriptions
     * 
     * @param ccConferenceTranscriptions ConferenceTranscriptions
     * @return 结果
     */
    public int insertCcConferenceTranscriptions(CcConferenceTranscriptions ccConferenceTranscriptions);

    /**
     * 修改ConferenceTranscriptions
     * 
     * @param ccConferenceTranscriptions ConferenceTranscriptions
     * @return 结果
     */
    public int updateCcConferenceTranscriptions(CcConferenceTranscriptions ccConferenceTranscriptions);

    /**
     * 删除ConferenceTranscriptions
     * 
     * @param id ConferenceTranscriptions主键
     * @return 结果
     */
    public int deleteCcConferenceTranscriptionsById(Long id);

    /**
     * 批量删除ConferenceTranscriptions
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteCcConferenceTranscriptionsByIds(String[] ids);
}
