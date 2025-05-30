package com.ruoyi.aicall.model;

import lombok.Data;

@Data
public class CallTaskStatModel {

    private Long batchId;

    /** 总名单量 */
    private Integer phoneCount = 0;

    /** 已拨打名单量 */
    private Integer callCount = 0;

    /** 接通名单量 */
    private Integer connectCount = 0;
}
