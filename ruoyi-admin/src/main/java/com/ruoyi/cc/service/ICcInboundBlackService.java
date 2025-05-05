package com.ruoyi.cc.service;

import java.util.List;
import com.ruoyi.cc.domain.CcInboundBlack;

/**
 * 【请填写功能名称】Service接口
 * 
 * @author ruoyi
 * @date 2024-12-22
 */
public interface ICcInboundBlackService 
{
    /**
     * 查询【请填写功能名称】
     * 
     * @param id 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    public CcInboundBlack selectCcInboundBlackById(Long id);

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param ccInboundBlack 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<CcInboundBlack> selectCcInboundBlackList(CcInboundBlack ccInboundBlack);

    /**
     * 新增【请填写功能名称】
     * 
     * @param ccInboundBlack 【请填写功能名称】
     * @return 结果
     */
    public int insertCcInboundBlack(CcInboundBlack ccInboundBlack);

    /**
     * 修改【请填写功能名称】
     * 
     * @param ccInboundBlack 【请填写功能名称】
     * @return 结果
     */
    public int updateCcInboundBlack(CcInboundBlack ccInboundBlack);

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param ids 需要删除的【请填写功能名称】主键集合
     * @return 结果
     */
    public int deleteCcInboundBlackByIds(String ids);

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param id 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteCcInboundBlackById(Long id);
}
