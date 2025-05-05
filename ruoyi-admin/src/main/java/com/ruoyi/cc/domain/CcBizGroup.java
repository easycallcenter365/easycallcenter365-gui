package com.ruoyi.cc.domain;

import lombok.Data;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

import java.io.Serializable;
import java.util.Date;

/**
 * 业务组对象 cc_biz_group
 * 
 * @author ruoyi
 * @date 2024-12-22
 */
@Data
public class CcBizGroup implements Serializable {
    private static final long serialVersionUID = 1L;

    /** 业务组编号 */
    private Long groupId;

    /** 业务组名称 */
    private String bizGroupName;

    /** 排序 */
    private Integer sortNo;

    /** 备注 */
    private String notes;

    /** 备创建时间 */
    private Date createTime;

    /** 是否选中 */
    private boolean flag = false;

}
