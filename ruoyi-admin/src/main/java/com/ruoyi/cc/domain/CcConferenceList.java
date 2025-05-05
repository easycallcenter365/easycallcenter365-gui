package com.ruoyi.cc.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * CcConferenceList对象 cc_conference_list
 * 
 * @author ruoyi
 * @date 2024-12-22
 */
public class CcConferenceList extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long id;

    /** 主持人手机号 */
    private String moderator;

    /** 会议主持人的员工id */
    private String userId;

    /** 会议开始时间 */
    private Long startTime;

    /** 会议结束时间 */
    private Long endTime;

    /** 会议时长; 秒数 */
    private Long timeLen;

    /** 会议进入密码 */
    private String confPassword;

    /** 会议的最大参会人数 */
    private Long maxConcurrency;

    /**  */
    private String recordPath;

    /**  */
    private String roomNo;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }

    public void setModerator(String moderator) 
    {
        this.moderator = moderator;
    }

    public String getModerator() 
    {
        return moderator;
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

    public void setConfPassword(String confPassword) 
    {
        this.confPassword = confPassword;
    }

    public String getConfPassword() 
    {
        return confPassword;
    }

    public void setMaxConcurrency(Long maxConcurrency) 
    {
        this.maxConcurrency = maxConcurrency;
    }

    public Long getMaxConcurrency() 
    {
        return maxConcurrency;
    }

    public void setRecordPath(String recordPath) 
    {
        this.recordPath = recordPath;
    }

    public String getRecordPath() 
    {
        return recordPath;
    }

    public void setRoomNo(String roomNo) 
    {
        this.roomNo = roomNo;
    }

    public String getRoomNo() 
    {
        return roomNo;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("moderator", getModerator())
            .append("userId", getUserId())
            .append("startTime", getStartTime())
            .append("endTime", getEndTime())
            .append("timeLen", getTimeLen())
            .append("confPassword", getConfPassword())
            .append("maxConcurrency", getMaxConcurrency())
            .append("recordPath", getRecordPath())
            .append("roomNo", getRoomNo())
            .toString();
    }
}
