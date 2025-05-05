package com.ruoyi.cc.service;

import java.util.List;
import com.ruoyi.cc.domain.CcInboundCdr;

/**
 * 呼入记录Service接口
 * 
 * @author ruoyi
 * @date 2024-12-22
 */
public interface ICcInboundCdrService 
{
    /**
     * 查询呼入记录
     * 
     * @param id 呼入记录主键
     * @return 呼入记录
     */
    public CcInboundCdr selectCcInboundCdrById(String id);

    /**
     * 查询呼入记录列表
     * 
     * @param ccInboundCdr 呼入记录
     * @return 呼入记录集合
     */
    public List<CcInboundCdr> selectCcInboundCdrList(CcInboundCdr ccInboundCdr);

    /**
     * 新增呼入记录
     * 
     * @param ccInboundCdr 呼入记录
     * @return 结果
     */
    public int insertCcInboundCdr(CcInboundCdr ccInboundCdr);

    /**
     * 修改呼入记录
     * 
     * @param ccInboundCdr 呼入记录
     * @return 结果
     */
    public int updateCcInboundCdr(CcInboundCdr ccInboundCdr);

    /**
     * 批量删除呼入记录
     * 
     * @param ids 需要删除的呼入记录主键集合
     * @return 结果
     */
    public int deleteCcInboundCdrByIds(String ids);

    /**
     * 删除呼入记录信息
     * 
     * @param id 呼入记录主键
     * @return 结果
     */
    public int deleteCcInboundCdrById(String id);
}
