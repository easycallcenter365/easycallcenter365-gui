package com.ruoyi.cc.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.cc.mapper.CcInboundBlackMapper;
import com.ruoyi.cc.domain.CcInboundBlack;
import com.ruoyi.cc.service.ICcInboundBlackService;
import com.ruoyi.common.core.text.Convert;

/**
 * 【请填写功能名称】Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-12-22
 */
@Service
public class CcInboundBlackServiceImpl implements ICcInboundBlackService 
{
    @Autowired
    private CcInboundBlackMapper ccInboundBlackMapper;

    /**
     * 查询【请填写功能名称】
     * 
     * @param id 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    @Override
    public CcInboundBlack selectCcInboundBlackById(Long id)
    {
        return ccInboundBlackMapper.selectCcInboundBlackById(id);
    }

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param ccInboundBlack 【请填写功能名称】
     * @return 【请填写功能名称】
     */
    @Override
    public List<CcInboundBlack> selectCcInboundBlackList(CcInboundBlack ccInboundBlack)
    {
        return ccInboundBlackMapper.selectCcInboundBlackList(ccInboundBlack);
    }

    /**
     * 新增【请填写功能名称】
     * 
     * @param ccInboundBlack 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int insertCcInboundBlack(CcInboundBlack ccInboundBlack)
    {
        return ccInboundBlackMapper.insertCcInboundBlack(ccInboundBlack);
    }

    /**
     * 修改【请填写功能名称】
     * 
     * @param ccInboundBlack 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int updateCcInboundBlack(CcInboundBlack ccInboundBlack)
    {
        return ccInboundBlackMapper.updateCcInboundBlack(ccInboundBlack);
    }

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param ids 需要删除的【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteCcInboundBlackByIds(String ids)
    {
        return ccInboundBlackMapper.deleteCcInboundBlackByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param id 【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteCcInboundBlackById(Long id)
    {
        return ccInboundBlackMapper.deleteCcInboundBlackById(id);
    }
}
