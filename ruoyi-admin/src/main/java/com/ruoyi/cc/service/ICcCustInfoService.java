package com.ruoyi.cc.service;

import java.util.List;
import com.ruoyi.cc.domain.CcCustInfo;

/**
 * 客户信息Service接口
 * 
 * @author ruoyi
 * @date 2025-01-03
 */
public interface ICcCustInfoService 
{
    /**
     * 查询客户信息
     * 
     * @param id 客户信息主键
     * @return 客户信息
     */
    public CcCustInfo selectCcCustInfoById(Long id);

    /**
     * 查询客户信息列表
     * 
     * @param ccCustInfo 客户信息
     * @return 客户信息集合
     */
    public List<CcCustInfo> selectCcCustInfoList(CcCustInfo ccCustInfo);

    /**
     * 新增客户信息
     * 
     * @param ccCustInfo 客户信息
     * @return 结果
     */
    public int insertCcCustInfo(CcCustInfo ccCustInfo);

    /**
     * 修改客户信息
     * 
     * @param ccCustInfo 客户信息
     * @return 结果
     */
    public int updateCcCustInfo(CcCustInfo ccCustInfo);

    /**
     * 批量删除客户信息
     * 
     * @param ids 需要删除的客户信息主键集合
     * @return 结果
     */
    public int deleteCcCustInfoByIds(String ids);

    /**
     * 删除客户信息信息
     * 
     * @param id 客户信息主键
     * @return 结果
     */
    public int deleteCcCustInfoById(Long id);

    /**
     * 根据手机号查询客户信息
     * @param phoneNum
     * @return
     */
    CcCustInfo selectCcCustInfoByPhoneNum(String phoneNum);
}
