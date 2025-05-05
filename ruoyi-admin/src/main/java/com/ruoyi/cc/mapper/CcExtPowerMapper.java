package com.ruoyi.cc.mapper;

import java.util.List;
import com.ruoyi.cc.domain.CcExtPower;

/**
 * 该定义了分机权限。可以管理哪些业务组的分机，比如监听、语音指导、im消息等。Mapper接口
 * 
 * @author ruoyi
 * @date 2024-12-22
 */
public interface CcExtPowerMapper 
{
    /**
     * 查询该定义了分机权限。可以管理哪些业务组的分机，比如监听、语音指导、im消息等。
     * 
     * @param powerId 该定义了分机权限。可以管理哪些业务组的分机，比如监听、语音指导、im消息等。主键
     * @return 该定义了分机权限。可以管理哪些业务组的分机，比如监听、语音指导、im消息等。
     */
    public CcExtPower selectCcExtPowerByPowerId(Long powerId);

    /**
     * 查询该定义了分机权限。可以管理哪些业务组的分机，比如监听、语音指导、im消息等。列表
     * 
     * @param ccExtPower 该定义了分机权限。可以管理哪些业务组的分机，比如监听、语音指导、im消息等。
     * @return 该定义了分机权限。可以管理哪些业务组的分机，比如监听、语音指导、im消息等。集合
     */
    public List<CcExtPower> selectCcExtPowerList(CcExtPower ccExtPower);

    /**
     * 新增该定义了分机权限。可以管理哪些业务组的分机，比如监听、语音指导、im消息等。
     * 
     * @param ccExtPower 该定义了分机权限。可以管理哪些业务组的分机，比如监听、语音指导、im消息等。
     * @return 结果
     */
    public int insertCcExtPower(CcExtPower ccExtPower);

    /**
     * 修改该定义了分机权限。可以管理哪些业务组的分机，比如监听、语音指导、im消息等。
     * 
     * @param ccExtPower 该定义了分机权限。可以管理哪些业务组的分机，比如监听、语音指导、im消息等。
     * @return 结果
     */
    public int updateCcExtPower(CcExtPower ccExtPower);

    /**
     * 删除该定义了分机权限。可以管理哪些业务组的分机，比如监听、语音指导、im消息等。
     * 
     * @param powerId 该定义了分机权限。可以管理哪些业务组的分机，比如监听、语音指导、im消息等。主键
     * @return 结果
     */
    public int deleteCcExtPowerByPowerId(Long powerId);

    /**
     * 批量删除该定义了分机权限。可以管理哪些业务组的分机，比如监听、语音指导、im消息等。
     * 
     * @param powerIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteCcExtPowerByPowerIds(String[] powerIds);
}
