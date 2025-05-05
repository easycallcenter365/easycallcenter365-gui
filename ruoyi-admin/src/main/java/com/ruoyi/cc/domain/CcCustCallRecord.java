package com.ruoyi.cc.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.experimental.Accessors;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

import java.io.Serializable;
import java.util.Date;

/**
 * 沟通记录对象 cc_cust_call_record
 * 
 * @author ruoyi
 * @date 2025-01-03
 */
@Data
@Accessors(chain = true)
public class CcCustCallRecord implements Serializable {
    private static final long serialVersionUID = 1L;

    /** 主键id */
    private Long id;

    /** 通话id */
    @Excel(name = "通话id")
    private String uuid;

    /** 1:呼入，2:外呼 */
    @Excel(name = "1:呼入，2:外呼")
    private Integer callType;

    /** 对应客户id */
    @Excel(name = "对应客户id")
    private Long custId;

    /** 沟通内容 */
    @Excel(name = "沟通内容")
    private String notes;

    /** 坐席用户工号 */
    @Excel(name = "坐席用户工号")
    private String userId;

    /** 坐席姓名 */
    @Excel(name = "坐席姓名")
    private String userRealName;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date createTime;


}
