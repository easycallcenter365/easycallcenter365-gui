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
 * 外呼号码对象 cc_call_phone
 * 
 * @author ruoyi
 * @date 2025-05-29
 */
@Data
public class CcCallPhone implements Serializable {
    private static final long serialVersionUID = 1L;

    /**  */
    private String id;

    /** 业务组 */
    @Excel(name = "业务组")
    private String groupId;

    /** 任务批次id */
    @Excel(name = "任务批次id")
    private Long batchId;

    /**  */
    @Excel(name = "")
    private String telephone;

    /** 创建时间 */
    @Excel(name = "创建时间")
    private Long createtime;

    /** 0  未拨打; 1   已经进入呼叫队列;  2   正在呼叫（进行中）;  3   未接通（状态： 客户正在通话中;   关机 ；  空号;  无人接听;   停机， ）;  4   已接通（拆分成接通后我方挂断，接通后对方挂断）; 5   呼损（未触发、未弹屏、仅弹屏、己介入）; 6   成功转接座席或者AI（只针对人机耦合）;  7线路故障;   [ 3、4、5  是统计大类， 实际写入到数据表的值是 后面的大数字 ]     31;  客户正在通话中;  32 关机;  33 空号;  34 无人接听; 35 停机。 41 拆分成接通后我方挂断;  42 接通后对方挂断 。 51 未触发（未到达弹屏节点）; 52 未弹屏（到达弹屏节点，没有弹屏出来） ;   53 仅弹屏（仅弹屏给座席但座席未介入通话，包括呼损）;   54 己介入（弹屏给到座席座席介入通话） */
    @Excel(name = "0  未拨打; 1   已经进入呼叫队列;  2   正在呼叫", readConverterExp = "进=行中")
    private Integer callstatus;

    /** 外呼时间 */
    @Excel(name = "外呼时间")
    private Long calloutTime;

    /** 呼叫次数 */
    @Excel(name = "呼叫次数")
    private Integer callcount;

    /** 呼叫结束时间 */
    @Excel(name = "呼叫结束时间")
    private Long callEndTime;

    /** 通话时长; 秒; */
    @Excel(name = "通话时长; 秒;")
    private Long timeLen;

    /** 有效通话时长; 秒 */
    @Excel(name = "有效通话时长; 秒")
    private Long validTimeLen;

    /** 通话唯一标志 */
    @Excel(name = "通话唯一标志")
    private String uuid;

//    /** 机器人接听端的通话唯一标识; */
//    @Excel(name = "机器人接听端的通话唯一标识;")
//    private String uuidRobot;

    /** 通话接通时间 */
    @Excel(name = "通话接通时间")
    private Long connectedTime;

    /** 挂机原因 */
    @Excel(name = "挂机原因")
    private String hangupCause;

//    /** 加入转人工排队的时间; */
//    @Excel(name = "加入转人工排队的时间;")
//    private Long queueTime;

    /** 电话应答时间 */
    @Excel(name = "电话应答时间")
    private Long answeredTime;

    /** 对话内容 */
    @Excel(name = "对话内容")
    private String dialogue;

    /** 全程通话录音文件名 */
    @Excel(name = "全程通话录音文件名")
    private String wavfile;

    /** 录音文件路径前缀 */
    @Excel(name = "录音文件路径前缀")
    private String recordServerUrl;

    /** 业务json数据 */
    @Excel(name = "业务json数据")
    private String bizJson;

//    /** 振铃文件是否写入了磁盘; 0 否 1是 */
//    @Excel(name = "振铃文件是否写入了磁盘; 0 否 1是")
//    private Integer ringingFileFlag;
//
//    /** 振铃文件路径; */
//    @Excel(name = "振铃文件路径;")
//    private String ringingWavFile;
//
//    /** 振铃文件是否已经送asr识别; 0 否 1 是 */
//    @Excel(name = "振铃文件是否已经送asr识别; 0 否 1 是")
//    private Integer ringingFileProcessed;
//
//    /** asr引擎;  0 没有获取到asr通道;  1 阿里; 2 思必驰 3 百度 */
//    @Excel(name = "asr引擎;  0 没有获取到asr通道;  1 阿里; 2 思必驰 3 百度")
//    private Long asrProduct;
//
//    /** 1客户主动挂断; 2机器人主动挂断; */
//    @Excel(name = "1客户主动挂断; 2机器人主动挂断;")
//    private Long whoHangup;

    /** 交互轮次（一问一答算一轮交互） */
    @Excel(name = "交互轮次", readConverterExp = "一=问一答算一轮交互")
    private Long dialogueCount;

//    /** 使用哪条线路外呼 */
//    @Excel(name = "使用哪条线路外呼")
//    private Long gatewayId;
//
//    /** 音色 */
//    @Excel(name = "音色")
//    private String voiceCode;
//
//    /** 音源 */
//    @Excel(name = "音源")
//    private String voiceSource;
//
//    /** 话术录音文件根路径 */
//    @Excel(name = "话术录音文件根路径")
//    private String recordPath;


    /** 人工坐席工号 */
    @Excel(name = "人工坐席工号", readConverterExp = "人工坐席工号")
    private String acdOpnum;

    /** 加入转人工排队的时间;  */
    @Excel(name = "加入转人工排队的时间; ", readConverterExp = "加入转人工排队的时间; ")
    private Long acdQueueTime;

    /** 人工排队等待时长,秒 */
    @Excel(name = "人工排队等待时长,秒", readConverterExp = "人工排队等待时长,秒")
    private Integer acdWaitTime;

    /** 请求参数 */
    @JsonInclude(JsonInclude.Include.NON_EMPTY)
    private Map<String, Object> params;

}
