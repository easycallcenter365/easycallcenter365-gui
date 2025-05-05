package com.ruoyi.cc.domain;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;
import lombok.experimental.Accessors;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

import java.io.Serializable;
import java.util.Map;

/**
 * 外呼通话监控，每个通话结束时会自动删除记录对象 cc_outbound_cdr
 * 
 * @author ruoyi
 * @date 2024-12-22
 */
@Data
@Accessors(chain = true)
public class CcOutboundCdr implements Serializable {
    private static final long serialVersionUID = 1L;

    /** id */
    private String id;

    /** 主叫号码 */
    private String caller;

    /** 工号 */
    private String opnum;

    /** 被叫号码 */
    private String callee;

    /** 外呼时间 */
    private Long startTime;

    /** 外线接听时间 */
    private Long answeredTime;

    /** 挂机时间 */
    private Long endTime;

    /** 通话uuid */
    private String uuid;

    /** 通话类型; audio or  video */
    private String callType;

    /** 通话时长的秒数 */
    private Long timeLen;

    /** 通话时长; 被叫接通后起计算; 毫秒数 */
    private Long timeLenValid;

    /** 录音文件名称 */
    private String recordFilename;

    /** 挂机原因 */
    private String hangupCause;

    /** 录音文件url访问地址 */
    private String wavFileUrl;

    /** 请求参数 */
    @JsonInclude(JsonInclude.Include.NON_EMPTY)
    private Map<String, Object> params;

}
