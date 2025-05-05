package com.ruoyi.cc.service;

import java.util.List;
import com.ruoyi.cc.domain.CcOutboundCdr;

/**
 * 外呼记录Service接口
 * 
 * @author ruoyi
 * @date 2024-12-22
 */
public interface ICcOutboundCdrService 
{
    /**
     * 查询外呼记录
     * 
     * @param id 外呼记录主键
     * @return 外呼记录
     */
    public CcOutboundCdr selectCcOutboundCdrById(String id);

    /**
     * 查询外呼记录列表
     * 
     * @param ccOutboundCdr 外呼记录
     * @return 外呼记录集合
     */
    public List<CcOutboundCdr> selectCcOutboundCdrList(CcOutboundCdr ccOutboundCdr);

    /**
     * 新增外呼记录
     * 
     * @param ccOutboundCdr 外呼记录
     * @return 结果
     */
    public int insertCcOutboundCdr(CcOutboundCdr ccOutboundCdr);

    /**
     * 修改外呼记录
     * 
     * @param ccOutboundCdr 外呼记录
     * @return 结果
     */
    public int updateCcOutboundCdr(CcOutboundCdr ccOutboundCdr);

    /**
     * 批量删除外呼记录
     * 
     * @param ids 需要删除的外呼记录主键集合
     * @return 结果
     */
    public int deleteCcOutboundCdrByIds(String ids);

    /**
     * 删除外呼记录信息
     * 
     * @param id 外呼记录主键
     * @return 结果
     */
    public int deleteCcOutboundCdrById(String id);
}
