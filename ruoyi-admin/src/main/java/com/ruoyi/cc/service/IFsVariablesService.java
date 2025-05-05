package com.ruoyi.cc.service;

import com.alibaba.fastjson.JSONObject;


/**
 * freeswitch配置文件可配置的参数
 */
public interface IFsVariablesService {

    JSONObject getFsVariablesByCat(Integer cat);
}
