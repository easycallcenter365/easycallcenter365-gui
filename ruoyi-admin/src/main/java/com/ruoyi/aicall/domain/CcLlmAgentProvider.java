package com.ruoyi.aicall.domain;

import lombok.Data;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

import java.io.Serializable;

/**
 * 大模型实现类列表对象 cc_llm_agent_provider
 * 
 * @author ruoyi
 * @date 2025-06-16
 */
@Data
public class CcLlmAgentProvider implements Serializable {
    private static final long serialVersionUID = 1L;

    /** 主键id */
    private Integer id;

    /** 实现类 */
    @Excel(name = "实现类")
    private String providerClassName;

    /** 备注 */
    @Excel(name = "备注")
    private String note;

}
