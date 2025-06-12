package com.ruoyi.aicall.domain;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

import java.io.Serializable;
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
    private Long rate;

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

//    /** 号码缓存池大小; 标记为删除，代码已经不在引用该字段。 */
//    @Excel(name = "号码缓存池大小; 标记为删除，代码已经不在引用该字段。")
//    private Long phonenumBuffer;
//
//    /** 一批数据外呼后等待时间。标记为删除，代码已经不在引用该字段。 */
//    @Excel(name = "一批数据外呼后等待时间。标记为删除，代码已经不在引用该字段。")
//    private Long batchcallWaitTime;

    /** 使用哪条线路外呼 */
    @Excel(name = "使用哪条线路外呼")
    private Long gatewayId;

    /** 音色 */
    @Excel(name = "音色")
    private String voiceCode;

    /** 音源 */
    @Excel(name = "音源")
    private String voiceSource;

    /** 请求参数 */
    @JsonInclude(JsonInclude.Include.NON_EMPTY)
    private Map<String, Object> params;

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

}
