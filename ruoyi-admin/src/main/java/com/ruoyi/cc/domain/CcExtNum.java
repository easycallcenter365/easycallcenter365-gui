package com.ruoyi.cc.domain;

import lombok.Data;
import lombok.experimental.Accessors;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

import java.io.Serializable;

/**
 * 分机号对象 cc_ext_num
 * 
 * @author ruoyi
 * @date 2024-12-22
 */
@Data
@Accessors(chain = true)
public class CcExtNum implements Serializable {
    private static final long serialVersionUID = 1L;

    /** 流水编号 */
    private Long extId;

    /** 分机号 */
    private Long extNum;

    /** 分机密码 */
    private String extPass;

    /** 所属员工/绑定关系 */
    private String userCode;

}
