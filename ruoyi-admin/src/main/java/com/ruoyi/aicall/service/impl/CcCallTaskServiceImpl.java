package com.ruoyi.aicall.service.impl;

import java.util.List;

import com.ruoyi.aicall.domain.CcCallTask;
import com.ruoyi.aicall.mapper.CcCallTaskMapper;
import com.ruoyi.aicall.service.ICcCallTaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.common.core.text.Convert;

/**
 * 外呼任务Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-05-29
 */
@Service
public class CcCallTaskServiceImpl implements ICcCallTaskService
{
    @Autowired
    private CcCallTaskMapper ccCallTaskMapper;

    /**
     * 查询外呼任务
     * 
     * @param batchId 外呼任务主键
     * @return 外呼任务
     */
    @Override
    public CcCallTask selectCcCallTaskByBatchId(Long batchId)
    {
        return ccCallTaskMapper.selectCcCallTaskByBatchId(batchId);
    }

    /**
     * 查询外呼任务列表
     * 
     * @param ccCallTask 外呼任务
     * @return 外呼任务
     */
    @Override
    public List<CcCallTask> selectCcCallTaskList(CcCallTask ccCallTask)
    {
        return ccCallTaskMapper.selectCcCallTaskList(ccCallTask);
    }

    /**
     * 新增外呼任务
     * 
     * @param ccCallTask 外呼任务
     * @return 结果
     */
    @Override
    public int insertCcCallTask(CcCallTask ccCallTask)
    {
        return ccCallTaskMapper.insertCcCallTask(ccCallTask);
    }

    /**
     * 修改外呼任务
     * 
     * @param ccCallTask 外呼任务
     * @return 结果
     */
    @Override
    public int updateCcCallTask(CcCallTask ccCallTask)
    {
        return ccCallTaskMapper.updateCcCallTask(ccCallTask);
    }

    /**
     * 批量删除外呼任务
     * 
     * @param batchIds 需要删除的外呼任务主键
     * @return 结果
     */
    @Override
    public int deleteCcCallTaskByBatchIds(String batchIds)
    {
        return ccCallTaskMapper.deleteCcCallTaskByBatchIds(Convert.toStrArray(batchIds));
    }

    /**
     * 删除外呼任务信息
     * 
     * @param batchId 外呼任务主键
     * @return 结果
     */
    @Override
    public int deleteCcCallTaskByBatchId(Long batchId)
    {
        return ccCallTaskMapper.deleteCcCallTaskByBatchId(batchId);
    }
}
