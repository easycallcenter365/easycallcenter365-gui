package com.ruoyi.cc.mapper;

import java.util.List;
import com.ruoyi.cc.domain.CcInboundBlack;

/**
 * InboundBlackMapper接口
 * 
 * @author ruoyi
 * @date 2024-12-22
 */
public interface CcInboundBlackMapper 
{
    /**
     * 查询InboundBlack
     * 
     * @param id InboundBlack主键
     * @return InboundBlack
     */
    public CcInboundBlack selectCcInboundBlackById(Long id);

    /**
     * 查询InboundBlack列表
     * 
     * @param ccInboundBlack InboundBlack
     * @return InboundBlack集合
     */
    public List<CcInboundBlack> selectCcInboundBlackList(CcInboundBlack ccInboundBlack);

    /**
     * 新增InboundBlack
     * 
     * @param ccInboundBlack InboundBlack
     * @return 结果
     */
    public int insertCcInboundBlack(CcInboundBlack ccInboundBlack);

    /**
     * 修改InboundBlack
     * 
     * @param ccInboundBlack InboundBlack
     * @return 结果
     */
    public int updateCcInboundBlack(CcInboundBlack ccInboundBlack);

    /**
     * 删除InboundBlack
     * 
     * @param id InboundBlack主键
     * @return 结果
     */
    public int deleteCcInboundBlackById(Long id);

    /**
     * 批量删除InboundBlack
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteCcInboundBlackByIds(String[] ids);
}
