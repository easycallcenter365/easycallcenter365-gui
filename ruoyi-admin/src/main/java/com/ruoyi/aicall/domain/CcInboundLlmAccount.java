package com.ruoyi.aicall.domain;

import lombok.Data;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

import java.io.Serializable;

/**
 * 呼入大模型配置对象 cc_inbound_llm_account
 * 
 * @author ruoyi
 * @date 2025-06-23
 */
@Data
public class CcInboundLlmAccount implements Serializable {
    private static final long serialVersionUID = 1L;

    /** 主键id */
    private Integer id;

    /** 大模型底座id */
    @Excel(name = "大模型底座id")
    private Integer llmAccountId;

    /** 被叫号码 */
    @Excel(name = "被叫号码")
    private String callee;

    /** TTS voice code for the robot */
    @Excel(name = "TTS voice code for the robot")
    private String voiceCode;

    /** tts provider */
    @Excel(name = "tts provider")
    private String voiceSource;


    /************  以下不是表结构字段 ************/
    /** 大模型底座名称 */
    private String llmAccountName;

    /** TTS voice for the robot */
    private String voiceName;

}
