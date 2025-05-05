package com.ruoyi.cc.mapper;

import com.ruoyi.cc.domain.FsVariables;

import java.util.List;

/**
 * freeswitch配置文件可配置参数设置
 */
public interface FsVariablesMapper {
    /**
     * 查询可配置参数信息
     *
     */
    public List<FsVariables> getFsVariablesList(FsVariables fsVariables);

}