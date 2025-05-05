package com.ruoyi.cc.mapper;

import java.util.List;
import com.ruoyi.cc.domain.CcOutboundCdr;

/**
 * 外呼记录Mapper接口
 * 
 * @author ruoyi
 * @date 2024-12-22
 */
public interface CcOutboundCdrMapper 
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
     * 删除外呼记录
     * 
     * @param id 外呼记录主键
     * @return 结果
     */
    public int deleteCcOutboundCdrById(String id);

    /**
     * 批量删除外呼记录
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteCcOutboundCdrByIds(String[] ids);
}
