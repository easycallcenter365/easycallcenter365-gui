package com.ruoyi.aicall.model;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.ruoyi.common.annotation.Excel;
import lombok.Data;

import java.io.Serializable;
import java.util.Map;

/**
 * 外呼号码对象 cc_call_phone
 * 
 * @author ruoyi
 * @date 2025-05-29
 */
@Data
public class CallPhoneExportVo implements Serializable {
    private static final long serialVersionUID = 1L;

    @Excel(name = "任务名称")
    private String batchName;

    @Excel(name = "通话uuid")
    private String uuid;

    @Excel(name = "外呼号码")
    private String telephone;

    @Excel(name = "外呼状态")
    private String callstatusName;

    @Excel(name = "客户意向")
    private String intent;

    @Excel(name = "外呼时间")
    private String calloutTimeStr;

    @Excel(name = "接通时间")
    private String answeredTimeStr;

    @Excel(name = "挂机时间")
    private String callEndTimeStr;

    @Excel(name = "通话时长")
    private String timeLenSec;

}
