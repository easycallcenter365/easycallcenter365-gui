package com.ruoyi.cc.domain;

import lombok.Data;
import lombok.experimental.Accessors;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

import java.io.Serializable;
import java.util.Date;

/**
 * 线路配置对象 cc_gateways
 * 
 * @author ruoyi
 * @date 2024-12-22
 */
@Data
@Accessors(chain = true)
public class CcGateways implements Serializable {
    private static final long serialVersionUID = 1L;

    /** id */
    private Long id;

    /** 网关名称 */
    private String gwName;

    /** profile名称 */
    private String profileName;

    /** 外呼的主叫号码 */
    private String caller;

    /** 被叫前缀; */
    private String calleePrefix;

    /** 网关地址; ip地址:端口 */
    private String gwAddr;

    /** 外呼语音编码 */
    private String codec;

    /** 网关名称描述; */
    private String gwDesc;

    /** 网关最大并发数; 仅用作手工选择参考，不用于程序判断： */
    private Long maxConcurrency;

    /** 注册模式下；认证用户名 */
    private String authUsername;

    /** 注册模式下；认证密码 */
    private String authPassword;

    /** 使用优先级; 数字1-9； 数字越小，越优先被使用 */
    private Long priority;

    /** 更新时间 */
    private Long updateTime;

    /** 是否需要认证注册； 0 对接模式； 1注册模式 */
    private Long register;

    /** 自定义属性 */
    private String configs;

}
