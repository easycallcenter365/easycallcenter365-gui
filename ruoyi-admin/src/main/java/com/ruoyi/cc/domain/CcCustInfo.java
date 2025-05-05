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
import java.util.List;

/**
 * 客户信息对象 cc_cust_info
 * 
 * @author ruoyi
 * @date 2025-01-03
 */
@Data
@Accessors(chain = true)
public class CcCustInfo implements Serializable {
    private static final long serialVersionUID = 1L;

    /** 主键id */
    private Long id;

    /** 姓名 */
    @Excel(name = "姓名")
    private String custName;

    /** 省 */
    @Excel(name = "省")
    private String province;

    /** 市 */
    @Excel(name = "市")
    private String city;

    /** 县 */
    @Excel(name = "县")
    private String county;

    /** 省编号 */
    @Excel(name = "省编号")
    private String provinceCode;

    /** 市编号 */
    @Excel(name = "市编号")
    private String cityCode;

    /** 县编号 */
    @Excel(name = "县编号")
    private String countyCode;

    /** 详细地址 */
    @Excel(name = "详细地址")
    private String address;

    /** 性别（0男，1女） */
    @Excel(name = "性别", readConverterExp = "0=男，1女")
    private Integer gender;

    /** 号码 */
    @Excel(name = "号码")
    private String phoneNum;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date createTime;

    /** 更新时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date updateTime;

    // 我的工作台弹屏保存需要带的内容
    // CcCustCallRecord
    private String callRecord; // 沟通内容

    // 详情带的参数
    private List<CcCustCallRecord> callRecordList;

}
