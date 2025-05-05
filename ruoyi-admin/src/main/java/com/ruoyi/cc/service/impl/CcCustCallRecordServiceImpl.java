package com.ruoyi.cc.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.cc.mapper.CcCustCallRecordMapper;
import com.ruoyi.cc.domain.CcCustCallRecord;
import com.ruoyi.cc.service.ICcCustCallRecordService;
import com.ruoyi.common.core.text.Convert;

/**
 * 沟通记录Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-01-03
 */
@Service
public class CcCustCallRecordServiceImpl implements ICcCustCallRecordService 
{
    @Autowired
    private CcCustCallRecordMapper ccCustCallRecordMapper;

    /**
     * 查询沟通记录
     * 
     * @param id 沟通记录主键
     * @return 沟通记录
     */
    @Override
    public CcCustCallRecord selectCcCustCallRecordById(Long id)
    {
        return ccCustCallRecordMapper.selectCcCustCallRecordById(id);
    }

    /**
     * 查询沟通记录列表
     * 
     * @param ccCustCallRecord 沟通记录
     * @return 沟通记录
     */
    @Override
    public List<CcCustCallRecord> selectCcCustCallRecordList(CcCustCallRecord ccCustCallRecord)
    {
        return ccCustCallRecordMapper.selectCcCustCallRecordList(ccCustCallRecord);
    }

    /**
     * 新增沟通记录
     * 
     * @param ccCustCallRecord 沟通记录
     * @return 结果
     */
    @Override
    public int insertCcCustCallRecord(CcCustCallRecord ccCustCallRecord)
    {
        ccCustCallRecord.setCreateTime(DateUtils.getNowDate());
        return ccCustCallRecordMapper.insertCcCustCallRecord(ccCustCallRecord);
    }

    /**
     * 修改沟通记录
     * 
     * @param ccCustCallRecord 沟通记录
     * @return 结果
     */
    @Override
    public int updateCcCustCallRecord(CcCustCallRecord ccCustCallRecord)
    {
        return ccCustCallRecordMapper.updateCcCustCallRecord(ccCustCallRecord);
    }

    /**
     * 批量删除沟通记录
     * 
     * @param ids 需要删除的沟通记录主键
     * @return 结果
     */
    @Override
    public int deleteCcCustCallRecordByIds(String ids)
    {
        return ccCustCallRecordMapper.deleteCcCustCallRecordByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除沟通记录信息
     * 
     * @param id 沟通记录主键
     * @return 结果
     */
    @Override
    public int deleteCcCustCallRecordById(Long id)
    {
        return ccCustCallRecordMapper.deleteCcCustCallRecordById(id);
    }
}
