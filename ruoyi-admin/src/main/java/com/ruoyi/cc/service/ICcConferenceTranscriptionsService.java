package com.ruoyi.cc.service;

import java.util.List;
import com.ruoyi.cc.domain.CcConferenceTranscriptions;

/**
 * 【请填写功能名称】Service接口
 * 
 * @author ruoyi
 * @date 2024-12-22
 */
public interface ICcConferenceTranscriptionsService 
{
    /**
     * 查询【请填写功能名称】
     * 
     * @param id 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    public CcConferenceTranscriptions selectCcConferenceTranscriptionsById(Long id);

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param ccConferenceTranscriptions 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<CcConferenceTranscriptions> selectCcConferenceTranscriptionsList(CcConferenceTranscriptions ccConferenceTranscriptions);

    /**
     * 新增【请填写功能名称】
     * 
     * @param ccConferenceTranscriptions 【请填写功能名称】
     * @return 结果
     */
    public int insertCcConferenceTranscriptions(CcConferenceTranscriptions ccConferenceTranscriptions);

    /**
     * 修改【请填写功能名称】
     * 
     * @param ccConferenceTranscriptions 【请填写功能名称】
     * @return 结果
     */
    public int updateCcConferenceTranscriptions(CcConferenceTranscriptions ccConferenceTranscriptions);

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param ids 需要删除的【请填写功能名称】主键集合
     * @return 结果
     */
    public int deleteCcConferenceTranscriptionsByIds(String ids);

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param id 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteCcConferenceTranscriptionsById(Long id);
}
