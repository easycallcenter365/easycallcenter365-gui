package com.ruoyi.cc.domain;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;
import lombok.experimental.Accessors;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

import java.io.Serializable;
import java.util.Date;
import java.util.Map;

/**
 * CcInboundCdr对象 cc_inbound_cdr
 * 
 * @author ruoyi
 * @date 2024-12-22
 */
@Data
@Accessors(chain = true)
public class CcInboundCdr implements Serializable {
    private static final long serialVersionUID = 1L;

    /** id */
    private String id;

    /** 主叫号码 */
    private String caller;

    /** 被叫号码 */
    private String callee;

    /** 呼入时间 */
    private Long inboundTime;

    /** 请求转接的坐席组 */
    private String groupId;

    /** 电话被接听时间 */
    private Long answeredTime;

    /** 接听电话的分机号码 */
    private String extnum;

    /** 接听电话的员工工号 */
    private String opnum;

    /** 挂机时间 */
    private Long hangupTime;

    /** 服务时长 */
    private Long answeredTimeLen;

    /** 通话总时长 */
    private Long timeLen;

    /** 通话uuid */
    private String uuid;

    /** 录音文件名 */
    private String wavFile;

    /** 录音文件url访问地址 */
    private String wavFileUrl;

    /** AI客服对话内容 */
    private String chatContent;

    /** 请求参数 */
    @JsonInclude(JsonInclude.Include.NON_EMPTY)
    private Map<String, Object> params;

    /** Business Group Name */
    private String groupName;
}
