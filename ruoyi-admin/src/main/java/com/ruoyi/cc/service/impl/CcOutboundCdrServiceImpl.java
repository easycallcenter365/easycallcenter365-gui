package com.ruoyi.cc.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.cc.mapper.CcOutboundCdrMapper;
import com.ruoyi.cc.domain.CcOutboundCdr;
import com.ruoyi.cc.service.ICcOutboundCdrService;
import com.ruoyi.common.core.text.Convert;

/**
 * 外呼记录Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-12-22
 */
@Service
public class CcOutboundCdrServiceImpl implements ICcOutboundCdrService 
{
    @Autowired
    private CcOutboundCdrMapper ccOutboundCdrMapper;

    /**
     * 查询外呼记录
     * 
     * @param id 外呼记录主键
     * @return 外呼记录
     */
    @Override
    public CcOutboundCdr selectCcOutboundCdrById(String id)
    {
        return ccOutboundCdrMapper.selectCcOutboundCdrById(id);
    }

    /**
     * 查询外呼记录列表
     * 
     * @param ccOutboundCdr 外呼记录
     * @return 外呼记录
     */
    @Override
    public List<CcOutboundCdr> selectCcOutboundCdrList(CcOutboundCdr ccOutboundCdr)
    {
        return ccOutboundCdrMapper.selectCcOutboundCdrList(ccOutboundCdr);
    }

    /**
     * 新增外呼记录
     * 
     * @param ccOutboundCdr 外呼记录
     * @return 结果
     */
    @Override
    public int insertCcOutboundCdr(CcOutboundCdr ccOutboundCdr)
    {
        return ccOutboundCdrMapper.insertCcOutboundCdr(ccOutboundCdr);
    }

    /**
     * 修改外呼记录
     * 
     * @param ccOutboundCdr 外呼记录
     * @return 结果
     */
    @Override
    public int updateCcOutboundCdr(CcOutboundCdr ccOutboundCdr)
    {
        return ccOutboundCdrMapper.updateCcOutboundCdr(ccOutboundCdr);
    }

    /**
     * 批量删除外呼记录
     * 
     * @param ids 需要删除的外呼记录主键
     * @return 结果
     */
    @Override
    public int deleteCcOutboundCdrByIds(String ids)
    {
        return ccOutboundCdrMapper.deleteCcOutboundCdrByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除外呼记录信息
     * 
     * @param id 外呼记录主键
     * @return 结果
     */
    @Override
    public int deleteCcOutboundCdrById(String id)
    {
        return ccOutboundCdrMapper.deleteCcOutboundCdrById(id);
    }
}
