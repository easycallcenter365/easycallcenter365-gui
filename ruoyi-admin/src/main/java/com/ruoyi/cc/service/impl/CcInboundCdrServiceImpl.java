package com.ruoyi.cc.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.cc.mapper.CcInboundCdrMapper;
import com.ruoyi.cc.domain.CcInboundCdr;
import com.ruoyi.cc.service.ICcInboundCdrService;
import com.ruoyi.common.core.text.Convert;

/**
 * 呼入记录Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-12-22
 */
@Service
public class CcInboundCdrServiceImpl implements ICcInboundCdrService 
{
    @Autowired
    private CcInboundCdrMapper ccInboundCdrMapper;

    /**
     * 查询呼入记录
     * 
     * @param id 呼入记录主键
     * @return 呼入记录
     */
    @Override
    public CcInboundCdr selectCcInboundCdrById(String id)
    {
        return ccInboundCdrMapper.selectCcInboundCdrById(id);
    }

    /**
     * 查询呼入记录列表
     * 
     * @param ccInboundCdr 呼入记录
     * @return 呼入记录
     */
    @Override
    public List<CcInboundCdr> selectCcInboundCdrList(CcInboundCdr ccInboundCdr)
    {
        return ccInboundCdrMapper.selectCcInboundCdrList(ccInboundCdr);
    }

    /**
     * 新增呼入记录
     * 
     * @param ccInboundCdr 呼入记录
     * @return 结果
     */
    @Override
    public int insertCcInboundCdr(CcInboundCdr ccInboundCdr)
    {
        return ccInboundCdrMapper.insertCcInboundCdr(ccInboundCdr);
    }

    /**
     * 修改呼入记录
     * 
     * @param ccInboundCdr 呼入记录
     * @return 结果
     */
    @Override
    public int updateCcInboundCdr(CcInboundCdr ccInboundCdr)
    {
        return ccInboundCdrMapper.updateCcInboundCdr(ccInboundCdr);
    }

    /**
     * 批量删除呼入记录
     * 
     * @param ids 需要删除的呼入记录主键
     * @return 结果
     */
    @Override
    public int deleteCcInboundCdrByIds(String ids)
    {
        return ccInboundCdrMapper.deleteCcInboundCdrByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除呼入记录信息
     * 
     * @param id 呼入记录主键
     * @return 结果
     */
    @Override
    public int deleteCcInboundCdrById(String id)
    {
        return ccInboundCdrMapper.deleteCcInboundCdrById(id);
    }
}
