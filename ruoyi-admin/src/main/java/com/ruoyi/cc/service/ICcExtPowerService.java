package com.ruoyi.cc.service;

import java.util.List;
import com.ruoyi.cc.domain.CcExtPower;

/**
 * 该定义了分机权限。可以管理哪些业务组的分机，比如监听、语音指导、im消息等。Service接口
 * 
 * @author ruoyi
 * @date 2024-12-22
 */
public interface ICcExtPowerService 
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
     * 批量删除该定义了分机权限。可以管理哪些业务组的分机，比如监听、语音指导、im消息等。
     * 
     * @param powerIds 需要删除的该定义了分机权限。可以管理哪些业务组的分机，比如监听、语音指导、im消息等。主键集合
     * @return 结果
     */
    public int deleteCcExtPowerByPowerIds(String powerIds);

    /**
     * 删除该定义了分机权限。可以管理哪些业务组的分机，比如监听、语音指导、im消息等。信息
     * 
     * @param powerId 该定义了分机权限。可以管理哪些业务组的分机，比如监听、语音指导、im消息等。主键
     * @return 结果
     */
    public int deleteCcExtPowerByPowerId(Long powerId);

    /**
     * 根据分机号查询权限配置
     * @param extNum
     * @return
     */
    CcExtPower selectCcExtPowerByExtNum(String extNum);
}
