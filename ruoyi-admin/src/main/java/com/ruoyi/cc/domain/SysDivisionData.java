package com.ruoyi.cc.domain;

import lombok.Data;
import lombok.experimental.Accessors;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

import java.io.Serializable;

/**
 * 行政区划3级对象 sys_division_data
 * 
 * @author ruoyi
 * @date 2025-01-12
 */
@Data
@Accessors(chain = true)
public class SysDivisionData implements Serializable {
    private static final long serialVersionUID = 1L;

    /** 主键id */
    private String id;

    /** 父级id */
    @Excel(name = "父级id")
    private String pid;

    /** 级别（0:省级, 1:市级 ,2:县级） */
    @Excel(name = "级别", readConverterExp = "0=:省级,,1=:市级,,=2:县级")
    private Long deep;

    /** 名称 */
    @Excel(name = "名称")
    private String name;

    /** 拼音前缀 */
    @Excel(name = "拼音前缀")
    private String pinyinPrefix;

    /** 拼音 */
    @Excel(name = "拼音")
    private String pinyin;

    /** 行政编号 */
    @Excel(name = "行政编号")
    private String extId;

    /** 行政名称 */
    @Excel(name = "行政名称")
    private String extName;

}
