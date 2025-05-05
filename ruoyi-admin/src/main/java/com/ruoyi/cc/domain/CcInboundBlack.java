package com.ruoyi.cc.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * CcInboundBlack对象 cc_inbound_black
 * 
 * @author ruoyi
 * @date 2024-12-22
 */
public class CcInboundBlack extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** id */
    private Long id;

    /** 黑名单主叫号码 */
    private String caller;

    /** 黑名单有效期 */
    private Long expiredTime;

    /** 添加时间 */
    private Long addTime;

    /** 添加人 */
    private String addUser;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }

    public void setCaller(String caller) 
    {
        this.caller = caller;
    }

    public String getCaller() 
    {
        return caller;
    }

    public void setExpiredTime(Long expiredTime) 
    {
        this.expiredTime = expiredTime;
    }

    public Long getExpiredTime() 
    {
        return expiredTime;
    }

    public void setAddTime(Long addTime) 
    {
        this.addTime = addTime;
    }

    public Long getAddTime() 
    {
        return addTime;
    }

    public void setAddUser(String addUser) 
    {
        this.addUser = addUser;
    }

    public String getAddUser() 
    {
        return addUser;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("caller", getCaller())
            .append("expiredTime", getExpiredTime())
            .append("addTime", getAddTime())
            .append("addUser", getAddUser())
            .toString();
    }
}
