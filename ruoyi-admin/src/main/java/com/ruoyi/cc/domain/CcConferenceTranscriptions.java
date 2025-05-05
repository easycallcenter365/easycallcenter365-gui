package com.ruoyi.cc.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 【请填写功能名称】对象 cc_conference_transcriptions
 * 
 * @author ruoyi
 * @date 2024-12-22
 */
public class CcConferenceTranscriptions extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** id */
    private Long id;

    /** 会议Id */
    private Long conferenceId;

    /** 参会者的mobile */
    private String confMemberMobile;

    /** 转写文本 */
    private String asrText;

    /** 讲话开始时间 */
    private Long vadStartTime;

    /** 讲话结束时间 */
    private Long vadEndTime;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }

    public void setConferenceId(Long conferenceId) 
    {
        this.conferenceId = conferenceId;
    }

    public Long getConferenceId() 
    {
        return conferenceId;
    }

    public void setConfMemberMobile(String confMemberMobile) 
    {
        this.confMemberMobile = confMemberMobile;
    }

    public String getConfMemberMobile() 
    {
        return confMemberMobile;
    }

    public void setAsrText(String asrText) 
    {
        this.asrText = asrText;
    }

    public String getAsrText() 
    {
        return asrText;
    }

    public void setVadStartTime(Long vadStartTime) 
    {
        this.vadStartTime = vadStartTime;
    }

    public Long getVadStartTime() 
    {
        return vadStartTime;
    }

    public void setVadEndTime(Long vadEndTime) 
    {
        this.vadEndTime = vadEndTime;
    }

    public Long getVadEndTime() 
    {
        return vadEndTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("conferenceId", getConferenceId())
            .append("confMemberMobile", getConfMemberMobile())
            .append("asrText", getAsrText())
            .append("vadStartTime", getVadStartTime())
            .append("vadEndTime", getVadEndTime())
            .toString();
    }
}
