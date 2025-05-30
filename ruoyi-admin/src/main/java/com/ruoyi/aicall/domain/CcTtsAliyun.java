package com.ruoyi.aicall.domain;

import lombok.Data;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

import java.io.Serializable;

/**
 * 阿里云音色列对象 cc_tts_aliyun
 * 
 * @author ruoyi
 * @date 2025-05-29
 */
@Data
public class CcTtsAliyun implements Serializable {
    private static final long serialVersionUID = 1L;

    /** 主键id */
    private Integer id;

    /** tts发音人名称 */
    @Excel(name = "tts发音人名称")
    private String voiceName;

    /** tts发音人代码 */
    @Excel(name = "tts发音人代码")
    private String voiceCode;

    /** 是否启用 */
    @Excel(name = "是否启用")
    private Integer voiceEnabled;

}
