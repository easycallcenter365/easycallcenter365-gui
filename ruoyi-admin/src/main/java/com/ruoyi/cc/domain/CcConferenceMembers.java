package com.ruoyi.cc.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * CcConferenceMembers对象 cc_conference_members
 * 
 * @author ruoyi
 * @date 2024-12-22
 */
public class CcConferenceMembers extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 参会者id流水号 */
    private String id;

    /** 会议id */
    private String conferenceId;

    /** 参会者号码 */
    private String phone;

    /** 参会者的员工id */
    private String userId;

    /** 加入会议时间 */
    private Long startTime;

    /** 退出会议时间 */
    private Long endTime;

    /** 通话时长; 秒数 */
    private Long timeLen;

    public void setId(String id) 
    {
        this.id = id;
    }

    public String getId() 
    {
        return id;
    }

    public void setConferenceId(String conferenceId) 
    {
        this.conferenceId = conferenceId;
    }

    public String getConferenceId() 
    {
        return conferenceId;
    }

    public void setPhone(String phone) 
    {
        this.phone = phone;
    }

    public String getPhone() 
    {
        return phone;
    }

    public void setUserId(String userId) 
    {
        this.userId = userId;
    }

    public String getUserId() 
    {
        return userId;
    }

    public void setStartTime(Long startTime) 
    {
        this.startTime = startTime;
    }

    public Long getStartTime() 
    {
        return startTime;
    }

    public void setEndTime(Long endTime) 
    {
        this.endTime = endTime;
    }

    public Long getEndTime() 
    {
        return endTime;
    }

    public void setTimeLen(Long timeLen) 
    {
        this.timeLen = timeLen;
    }

    public Long getTimeLen() 
    {
        return timeLen;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("conferenceId", getConferenceId())
            .append("phone", getPhone())
            .append("userId", getUserId())
            .append("startTime", getStartTime())
            .append("endTime", getEndTime())
            .append("timeLen", getTimeLen())
            .toString();
    }
}
