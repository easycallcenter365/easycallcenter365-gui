package com.ruoyi.cc.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.cc.mapper.CcExtPowerMapper;
import com.ruoyi.cc.domain.CcExtPower;
import com.ruoyi.cc.service.ICcExtPowerService;
import com.ruoyi.common.core.text.Convert;

/**
 * 该定义了分机权限。可以管理哪些业务组的分机，比如监听、语音指导、im消息等。Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-12-22
 */
@Service
public class CcExtPowerServiceImpl implements ICcExtPowerService 
{
    @Autowired
    private CcExtPowerMapper ccExtPowerMapper;

    /**
     * 查询该定义了分机权限。可以管理哪些业务组的分机，比如监听、语音指导、im消息等。
     * 
     * @param powerId 该定义了分机权限。可以管理哪些业务组的分机，比如监听、语音指导、im消息等。主键
     * @return 该定义了分机权限。可以管理哪些业务组的分机，比如监听、语音指导、im消息等。
     */
    @Override
    public CcExtPower selectCcExtPowerByPowerId(Long powerId)
    {
        return ccExtPowerMapper.selectCcExtPowerByPowerId(powerId);
    }

    /**
     * 查询该定义了分机权限。可以管理哪些业务组的分机，比如监听、语音指导、im消息等。列表
     * 
     * @param ccExtPower 该定义了分机权限。可以管理哪些业务组的分机，比如监听、语音指导、im消息等。
     * @return 该定义了分机权限。可以管理哪些业务组的分机，比如监听、语音指导、im消息等。
     */
    @Override
    public List<CcExtPower> selectCcExtPowerList(CcExtPower ccExtPower)
    {
        return ccExtPowerMapper.selectCcExtPowerList(ccExtPower);
    }

    /**
     * 新增该定义了分机权限。可以管理哪些业务组的分机，比如监听、语音指导、im消息等。
     * 
     * @param ccExtPower 该定义了分机权限。可以管理哪些业务组的分机，比如监听、语音指导、im消息等。
     * @return 结果
     */
    @Override
    public int insertCcExtPower(CcExtPower ccExtPower)
    {
        return ccExtPowerMapper.insertCcExtPower(ccExtPower);
    }

    /**
     * 修改该定义了分机权限。可以管理哪些业务组的分机，比如监听、语音指导、im消息等。
     * 
     * @param ccExtPower 该定义了分机权限。可以管理哪些业务组的分机，比如监听、语音指导、im消息等。
     * @return 结果
     */
    @Override
    public int updateCcExtPower(CcExtPower ccExtPower)
    {
        return ccExtPowerMapper.updateCcExtPower(ccExtPower);
    }

    /**
     * 批量删除该定义了分机权限。可以管理哪些业务组的分机，比如监听、语音指导、im消息等。
     * 
     * @param powerIds 需要删除的该定义了分机权限。可以管理哪些业务组的分机，比如监听、语音指导、im消息等。主键
     * @return 结果
     */
    @Override
    public int deleteCcExtPowerByPowerIds(String powerIds)
    {
        return ccExtPowerMapper.deleteCcExtPowerByPowerIds(Convert.toStrArray(powerIds));
    }

    /**
     * 删除该定义了分机权限。可以管理哪些业务组的分机，比如监听、语音指导、im消息等。信息
     * 
     * @param powerId 该定义了分机权限。可以管理哪些业务组的分机，比如监听、语音指导、im消息等。主键
     * @return 结果
     */
    @Override
    public int deleteCcExtPowerByPowerId(Long powerId)
    {
        return ccExtPowerMapper.deleteCcExtPowerByPowerId(powerId);
    }

    @Override
    public CcExtPower selectCcExtPowerByExtNum(String extNum) {
        List<CcExtPower> list = selectCcExtPowerList(new CcExtPower().setExtNum(extNum));
        if (list.size() > 0) {
            return list.get(0);
        }
        return null;
    }
}
