package com.ruoyi.aicall.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 机器人参数配置对象 cc_llm_agent_account
 * 
 * @author ruoyi
 * @date 2025-06-16
 */
public class CcLlmAgentAccount extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键id */
    private Integer id;

    /** 机器人名称 */
    @Excel(name = "机器人名称")
    private String name;

    /** 机器人配置信息 */
    @Excel(name = "机器人配置信息")
    private String accountJson;

    /** 实现类 */
    @Excel(name = "实现类")
    private String providerClassName;

    public void setId(Integer id) 
    {
        this.id = id;
    }

    public Integer getId() 
    {
        return id;
    }

    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }

    public void setAccountJson(String accountJson) 
    {
        this.accountJson = accountJson;
    }

    public String getAccountJson() 
    {
        return accountJson;
    }

    public void setProviderClassName(String providerClassName) 
    {
        this.providerClassName = providerClassName;
    }

    public String getProviderClassName() 
    {
        return providerClassName;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("name", getName())
            .append("accountJson", getAccountJson())
            .append("providerClassName", getProviderClassName())
            .toString();
    }
}
