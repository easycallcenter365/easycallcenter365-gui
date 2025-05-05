package com.ruoyi.cc.domain;

import lombok.Data;
import lombok.experimental.Accessors;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

import java.io.Serializable;

/**
 * 该定义了分机权限。可以管理哪些业务组的分机，比如监听、语音指导、im消息等。对象 cc_ext_power
 * 
 * @author ruoyi
 * @date 2024-12-22
 */
@Data
@Accessors(chain = true)
public class CcExtPower implements Serializable {
    private static final long serialVersionUID = 1L;

    /** id */
    private Long powerId;

    /** 分机号 */
    private String extNum;

    /** 业务组id; 如果为0，则可以监控全部通话; 多个以逗号,分隔 */
    private String groupId;

    /**业务组名称，用逗号隔开**/
    private String groupName;

    /** 业务组id */
    private Long[] groupIds;
}
