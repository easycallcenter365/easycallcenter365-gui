package com.ruoyi.cc.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.cc.mapper.CcConferenceTranscriptionsMapper;
import com.ruoyi.cc.domain.CcConferenceTranscriptions;
import com.ruoyi.cc.service.ICcConferenceTranscriptionsService;
import com.ruoyi.common.core.text.Convert;

/**
 * 【请填写功能名称】Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-12-22
 */
@Service
public class CcConferenceTranscriptionsServiceImpl implements ICcConferenceTranscriptionsService 
{
    @Autowired
    private CcConferenceTranscriptionsMapper ccConferenceTranscriptionsMapper;

    /**
     * 查询【请填写功能名称】
     * 
     * @param id 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    @Override
    public CcConferenceTranscriptions selectCcConferenceTranscriptionsById(Long id)
    {
        return ccConferenceTranscriptionsMapper.selectCcConferenceTranscriptionsById(id);
    }

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param ccConferenceTranscriptions 【请填写功能名称】
     * @return 【请填写功能名称】
     */
    @Override
    public List<CcConferenceTranscriptions> selectCcConferenceTranscriptionsList(CcConferenceTranscriptions ccConferenceTranscriptions)
    {
        return ccConferenceTranscriptionsMapper.selectCcConferenceTranscriptionsList(ccConferenceTranscriptions);
    }

    /**
     * 新增【请填写功能名称】
     * 
     * @param ccConferenceTranscriptions 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int insertCcConferenceTranscriptions(CcConferenceTranscriptions ccConferenceTranscriptions)
    {
        return ccConferenceTranscriptionsMapper.insertCcConferenceTranscriptions(ccConferenceTranscriptions);
    }

    /**
     * 修改【请填写功能名称】
     * 
     * @param ccConferenceTranscriptions 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int updateCcConferenceTranscriptions(CcConferenceTranscriptions ccConferenceTranscriptions)
    {
        return ccConferenceTranscriptionsMapper.updateCcConferenceTranscriptions(ccConferenceTranscriptions);
    }

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param ids 需要删除的【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteCcConferenceTranscriptionsByIds(String ids)
    {
        return ccConferenceTranscriptionsMapper.deleteCcConferenceTranscriptionsByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param id 【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteCcConferenceTranscriptionsById(Long id)
    {
        return ccConferenceTranscriptionsMapper.deleteCcConferenceTranscriptionsById(id);
    }
}
