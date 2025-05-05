package com.ruoyi.cc.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 在线坐席对象 cc_agent_online
 * 
 * @author ruoyi
 * @date 2024-12-22
 */
public class CcAgentOnline extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    private String id;

    private String extnum;

    private String opnum;

    private String groupId;

    private String sessionId;

    private Long agentStatus;

    private Long lastHangupTime;

    private Long loginTime;

    private String clientIp;

    private Long busyLockTime;

    private Long skillLevel;

    public void setId(String id) 
    {
        this.id = id;
    }

    public String getId() 
    {
        return id;
    }

    public void setExtnum(String extnum) 
    {
        this.extnum = extnum;
    }

    public String getExtnum() 
    {
        return extnum;
    }

    public void setOpnum(String opnum) 
    {
        this.opnum = opnum;
    }

    public String getOpnum() 
    {
        return opnum;
    }

    public void setGroupId(String groupId) 
    {
        this.groupId = groupId;
    }

    public String getGroupId() 
    {
        return groupId;
    }

    public void setSessionId(String sessionId) 
    {
        this.sessionId = sessionId;
    }

    public String getSessionId() 
    {
        return sessionId;
    }

    public void setAgentStatus(Long agentStatus) 
    {
        this.agentStatus = agentStatus;
    }

    public Long getAgentStatus() 
    {
        return agentStatus;
    }

    public void setLastHangupTime(Long lastHangupTime) 
    {
        this.lastHangupTime = lastHangupTime;
    }

    public Long getLastHangupTime() 
    {
        return lastHangupTime;
    }

    public void setLoginTime(Long loginTime) 
    {
        this.loginTime = loginTime;
    }

    public Long getLoginTime() 
    {
        return loginTime;
    }

    public void setClientIp(String clientIp) 
    {
        this.clientIp = clientIp;
    }

    public String getClientIp() 
    {
        return clientIp;
    }

    public void setBusyLockTime(Long busyLockTime) 
    {
        this.busyLockTime = busyLockTime;
    }

    public Long getBusyLockTime() 
    {
        return busyLockTime;
    }

    public void setSkillLevel(Long skillLevel) 
    {
        this.skillLevel = skillLevel;
    }

    public Long getSkillLevel() 
    {
        return skillLevel;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("extnum", getExtnum())
            .append("opnum", getOpnum())
            .append("groupId", getGroupId())
            .append("sessionId", getSessionId())
            .append("agentStatus", getAgentStatus())
            .append("lastHangupTime", getLastHangupTime())
            .append("loginTime", getLoginTime())
            .append("clientIp", getClientIp())
            .append("busyLockTime", getBusyLockTime())
            .append("skillLevel", getSkillLevel())
            .toString();
    }
}
