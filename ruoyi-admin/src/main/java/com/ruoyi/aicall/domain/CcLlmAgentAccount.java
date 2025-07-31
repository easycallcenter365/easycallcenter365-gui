package com.ruoyi.aicall.domain;

import lombok.Data;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

import java.io.Serializable;

/**
 * 机器人参数配置对象 cc_llm_agent_account
 * 
 * @author ruoyi
 * @date 2025-06-16
 */
@Data
public class CcLlmAgentAccount implements Serializable {
    private static final long serialVersionUID = 1L;

    /** 主键id */
    private Integer id;

    /** 机器人名称 */
    @Excel(name = "机器人名称")
    private String name;

    /** 机器人配置信息 */
    @Excel(name = "机器人配置信息")
    private String accountJson;

    /** Entity class for storing account config info. */
    @Excel(name = "Entity class for storing account config info.")
    private String accountEntity;

    /** 实现类 */
    @Excel(name = "实现类")
    private String providerClassName;

    /** 是否打断（1：是，0：否） */
    @Excel(name = "是否打断（1：是，0：否）")
    private Integer interruptFlag;

    /** 打断关键词列表 */
    @Excel(name = "打断关键词列表")
    private String interruptKeywords;

    /** 打断忽略关键字列表 */
    @Excel(name = "打断忽略关键字列表")
    private String interruptIgnoreKeywords;

    /** 客户意向提示词 */
    @Excel(name = "客户意向提示词")
    private String intentionTips;

}
