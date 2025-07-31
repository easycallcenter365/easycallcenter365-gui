package com.ruoyi.aicall.domain;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

/**
 * 外呼任务对象 cc_call_task
 * 
 * @author ruoyi
 * @date 2025-05-29
 */
@Data
public class CcCallTask implements Serializable {
    private static final long serialVersionUID = 1L;

    /**  */
    private Long batchId;

    /** 外呼任务的业务组 */
    @Excel(name = "外呼任务的业务组")
    private String groupId;

    /**  */
    @Excel(name = "")
    private String batchName;

    /** 是否启动任务, 1 启动， 0 停止 */
    @Excel(name = "是否启动任务, 1 启动， 0 停止")
    private Integer ifcall;

    /** 外呼速率 */
    @Excel(name = "外呼速率")
    private Double rate;

    /** 当前任务最大可用外线数 */
    @Excel(name = "当前任务最大可用外线数")
    private Long threadNum;

    /** 创建时间 */
    @Excel(name = "创建时间")
    private Long createtime;

    /** 任务是否正在执行; */
    @Excel(name = "任务是否正在执行;")
    private Long executing;

    /** 任务停止时间 */
    @Excel(name = "任务停止时间")
    private Long stopTime;

    /** 任务创建者用户id */
    @Excel(name = "任务创建者用户id")
    private String userid;

    /** 0 Pure manual outbound call; 1 Pure AI outbound calling; 2 Human-machine coupling */
    @Excel(name = "0 Pure manual outbound call; 1 Pure AI outbound calling; 2 Human-machine coupling")
    private Integer taskType;

    /** 使用哪条线路外呼 */
    @Excel(name = "使用哪条线路外呼")
    private Long gatewayId;

    /** 音色 */
    @Excel(name = "音色")
    private String voiceCode;

    /** 音源 */
    @Excel(name = "音源")
    private String voiceSource;

    /** The average ringing duration of the call; seconds */
    @Excel(name = "The average ringing duration of the call; seconds")
    private Double avgRingTimeLen;

    /** The average pure call duration per call; seconds */
    @Excel(name = "The average pure call duration per call; seconds")
    private Double avgCallTalkTimeLen;

    /** The duration of form filling after the call ends; seconds */
    @Excel(name = "The duration of form filling after the call ends; seconds")
    private Double avgCallEndProcessTimeLen;

    /** 外呼节点 */
    @Excel(name = "外呼节点")
    private String callNodeNo;

    /** 大模型底座账号的Id */
    @Excel(name = "大模型底座账号的Id")
    private Integer llmAccountId;

    /** 播放次数 */
    @Excel(name = "播放次数")
    private Integer playTimes;

    /** 请求参数 */
    @JsonInclude(JsonInclude.Include.NON_EMPTY)
    private Map<String, Object> params = new HashMap<>();

    /** 总名单量 */
    private Integer phoneCount;

    /** 未拨打名单量 */
    private Integer noCallCount;

    /** 已拨打名单量 */
    private Integer callCount;

    /** 接通名单量 */
    private Integer connectCount;

    /** 未接通名单量 */
    private Integer noConnectCount;

    /** 实际接通率 */
    private Double realConnectRate;

    /** 预估接通率 (百分数格式)*/
    @Excel(name = "预估接通率")
    private Integer conntectRate;

}
