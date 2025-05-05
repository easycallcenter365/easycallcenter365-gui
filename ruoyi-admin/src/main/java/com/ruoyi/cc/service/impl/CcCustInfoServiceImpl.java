package com.ruoyi.cc.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.cc.mapper.CcCustInfoMapper;
import com.ruoyi.cc.domain.CcCustInfo;
import com.ruoyi.cc.service.ICcCustInfoService;
import com.ruoyi.common.core.text.Convert;

/**
 * 客户信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-01-03
 */
@Service
public class CcCustInfoServiceImpl implements ICcCustInfoService 
{
    @Autowired
    private CcCustInfoMapper ccCustInfoMapper;

    /**
     * 查询客户信息
     * 
     * @param id 客户信息主键
     * @return 客户信息
     */
    @Override
    public CcCustInfo selectCcCustInfoById(Long id)
    {
        return ccCustInfoMapper.selectCcCustInfoById(id);
    }

    /**
     * 查询客户信息列表
     * 
     * @param ccCustInfo 客户信息
     * @return 客户信息
     */
    @Override
    public List<CcCustInfo> selectCcCustInfoList(CcCustInfo ccCustInfo)
    {
        return ccCustInfoMapper.selectCcCustInfoList(ccCustInfo);
    }

    /**
     * 新增客户信息
     * 
     * @param ccCustInfo 客户信息
     * @return 结果
     */
    @Override
    public int insertCcCustInfo(CcCustInfo ccCustInfo)
    {
        ccCustInfo.setCreateTime(DateUtils.getNowDate());
        return ccCustInfoMapper.insertCcCustInfo(ccCustInfo);
    }

    /**
     * 修改客户信息
     * 
     * @param ccCustInfo 客户信息
     * @return 结果
     */
    @Override
    public int updateCcCustInfo(CcCustInfo ccCustInfo)
    {
        ccCustInfo.setUpdateTime(DateUtils.getNowDate());
        return ccCustInfoMapper.updateCcCustInfo(ccCustInfo);
    }

    /**
     * 批量删除客户信息
     * 
     * @param ids 需要删除的客户信息主键
     * @return 结果
     */
    @Override
    public int deleteCcCustInfoByIds(String ids)
    {
        return ccCustInfoMapper.deleteCcCustInfoByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除客户信息信息
     * 
     * @param id 客户信息主键
     * @return 结果
     */
    @Override
    public int deleteCcCustInfoById(Long id)
    {
        return ccCustInfoMapper.deleteCcCustInfoById(id);
    }

    @Override
    public CcCustInfo selectCcCustInfoByPhoneNum(String phoneNum) {
        List<CcCustInfo> list = selectCcCustInfoList(new CcCustInfo().setPhoneNum(phoneNum));
        if (list.size() > 0) {
            return list.get(0);
        }
        return null;
    }
}
