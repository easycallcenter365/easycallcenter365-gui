package com.ruoyi.cc.mapper;

import java.util.List;
import com.ruoyi.cc.domain.CcInboundCdr;

/**
 * 呼入话单Mapper接口
 * 
 * @author ruoyi
 * @date 2024-12-22
 */
public interface CcInboundCdrMapper 
{
    /**
     * 查询呼入话单
     * 
     * @param id 呼入话单主键
     * @return 呼入话单
     */
    public CcInboundCdr selectCcInboundCdrById(String id);

    /**
     * 查询呼入话单列表
     * 
     * @param ccInboundCdr 呼入话单
     * @return 呼入话单集合
     */
    public List<CcInboundCdr> selectCcInboundCdrList(CcInboundCdr ccInboundCdr);

    /**
     * 新增呼入话单
     * 
     * @param ccInboundCdr 呼入话单
     * @return 结果
     */
    public int insertCcInboundCdr(CcInboundCdr ccInboundCdr);

    /**
     * 修改呼入话单
     * 
     * @param ccInboundCdr 呼入话单
     * @return 结果
     */
    public int updateCcInboundCdr(CcInboundCdr ccInboundCdr);

    /**
     * 删除呼入话单
     * 
     * @param id 呼入话单主键
     * @return 结果
     */
    public int deleteCcInboundCdrById(String id);

    /**
     * 批量删除呼入话单
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteCcInboundCdrByIds(String[] ids);
}
