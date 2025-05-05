package com.ruoyi.cc.domain;

import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

@Data
@Accessors(chain = true)
public class FsVariables implements Serializable {
    private static final long serialVersionUID = 1L;

    /** 主键id */
    private Integer id;

    /** cat (1. vars.xml  2. switch.conf.xml  3. profile  4. xunfei_asr  5. aliyun asr  4. xunfei_asr  5. aliyun asr) */
    private Integer cat;

    /** 变量的字段名称 */
    private String varFieldName;

    /** 变量的别名 */
    private String varFieldAlias;
}
