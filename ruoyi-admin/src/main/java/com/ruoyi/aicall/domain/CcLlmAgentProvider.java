package com.ruoyi.aicall.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 大模型实现类列表对象 cc_llm_agent_provider
 * 
 * @author ruoyi
 * @date 2025-06-16
 */
public class CcLlmAgentProvider extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键id */
    private Integer id;

    /** 实现类 */
    @Excel(name = "实现类")
    private String providerClassName;

    /** 备注 */
    @Excel(name = "备注")
    private String note;

    public void setId(Integer id) 
    {
        this.id = id;
    }

    public Integer getId() 
    {
        return id;
    }

    public void setProviderClassName(String providerClassName) 
    {
        this.providerClassName = providerClassName;
    }

    public String getProviderClassName() 
    {
        return providerClassName;
    }

    public void setNote(String note) 
    {
        this.note = note;
    }

    public String getNote() 
    {
        return note;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("providerClassName", getProviderClassName())
            .append("note", getNote())
            .toString();
    }
}
