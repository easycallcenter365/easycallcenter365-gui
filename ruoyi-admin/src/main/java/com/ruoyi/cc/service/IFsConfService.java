package com.ruoyi.cc.service;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.ruoyi.cc.model.FsConfProfile;

import java.util.List;

/**
 * freeswitch配置文件控制service层
 */
public interface IFsConfService {

    /**
     * 设置switch.conf.xml文件的参数值
     */
    void setSwitchConf(JSONArray params);

    /**
     * 重启fs服务
     */
    void restartFs();

    /**
     * 获取switch.conf.xml文件的参数值
     * @return
     */
    JSONObject getSwitchConf();

    /**
     * 从autoload_configs/modules.conf.xml中获取asr引擎
     * @return
     */
    String getAsrengine();

    /**
     * 保存ASR引擎到autoload_configs/modules.conf.xml
     * @param params
     */
    String setAsrengine(String asrengine);

    /**
     * 设置vars.xml文件的参数值
     */
    void setVarsConf(JSONArray params);

    /**
     * 获取vars.xml文件的参数值
     * @return
     */
    JSONObject getVarsConf();

    /**
     * 获取ASR配置文件参数
     * @param asrFileName
     * @return
     */
    JSONObject getAsrConf(String asrFileName);

    /**
     * 保存ASR配置文件参数
     * @param params
     * @param asrFileName
     */
    String setAsrConf(JSONArray params, String asrFileName);

    /**
     * 获取证书内容
     * @return
     */
    String getCertWssPen();

    /**
     * 保存证书内容
     * @param certValue
     */
    void setCertWssPen(String certValue);

    /**
     * 获取日志内容
     * @param uuid
     * @param fsLogFiles
     * @return
     */
    String getLogs(String uuid, String fsLogFiles, String logType);

    /**
     * 获取profile列表
     * @return
     */
    List<FsConfProfile> selectProfileList();

    /**
     * 保存profile配置
     * @param profileName
     * @param params
     */
    String setProfileConf(String profileName, String profileType, JSONArray params);

    /**
     * 获取profile配置
     * @return
     */
    JSONObject getProfileConf(String profileName, String profileType);

    /**
     * 注册模式网关xml文件配置
     * @param orginProfileName 修改前profileName
     * @param profileName
     * @param gwName
     * @param params
     */
    void setGwRegisterConf(String orginProfileName, String profileName, String gwName, JSONObject params);

    /**
     * 对接模式网关xml配置
     * @param orginProfileName 修改前profileName
     * @param profileName
     * @param gwName
     * @param params
     */
    void setGwUnRegisterConf(String orginProfileName, String profileName, String gwName, JSONObject params);
}
