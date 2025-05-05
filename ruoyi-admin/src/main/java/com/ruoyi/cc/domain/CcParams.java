package com.ruoyi.cc.domain;

import lombok.Data;
import lombok.experimental.Accessors;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

import java.io.Serializable;

/**
 * callcenter参数配置对象 cc_params
 * 
 * @author ruoyi
 * @date 2025-04-21
 */
@Data
@Accessors(chain = true)
public class CcParams implements Serializable {
    private static final long serialVersionUID = 1L;
    /** 主键id */
    private Long id;

    /** 参数名 */
    @Excel(name = "参数名")
    private String paramName;

    /** 参数编码 */
    @Excel(name = "参数编码")
    private String paramCode;

    /** 参数值 */
    @Excel(name = "参数值")
    private String paramValue;

    /** 参数类型 */
    @Excel(name = "参数类型")
    private String paramType;

}
