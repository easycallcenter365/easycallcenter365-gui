package com.ruoyi.cc.mapper;

import java.util.List;
import com.ruoyi.cc.domain.CcCustCallRecord;

/**
 * 沟通记录Mapper接口
 * 
 * @author ruoyi
 * @date 2025-01-03
 */
public interface CcCustCallRecordMapper 
{
    /**
     * 查询沟通记录
     * 
     * @param id 沟通记录主键
     * @return 沟通记录
     */
    public CcCustCallRecord selectCcCustCallRecordById(Long id);

    /**
     * 查询沟通记录列表
     * 
     * @param ccCustCallRecord 沟通记录
     * @return 沟通记录集合
     */
    public List<CcCustCallRecord> selectCcCustCallRecordList(CcCustCallRecord ccCustCallRecord);

    /**
     * 新增沟通记录
     * 
     * @param ccCustCallRecord 沟通记录
     * @return 结果
     */
    public int insertCcCustCallRecord(CcCustCallRecord ccCustCallRecord);

    /**
     * 修改沟通记录
     * 
     * @param ccCustCallRecord 沟通记录
     * @return 结果
     */
    public int updateCcCustCallRecord(CcCustCallRecord ccCustCallRecord);

    /**
     * 删除沟通记录
     * 
     * @param id 沟通记录主键
     * @return 结果
     */
    public int deleteCcCustCallRecordById(Long id);

    /**
     * 批量删除沟通记录
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteCcCustCallRecordByIds(String[] ids);
}
