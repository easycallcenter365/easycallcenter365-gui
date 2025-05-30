package com.ruoyi.aicall.mapper;

import com.ruoyi.aicall.domain.CcCallTask;

import java.util.List;

/**
 * 外呼任务Mapper接口
 * 
 * @author ruoyi
 * @date 2025-05-29
 */
public interface CcCallTaskMapper 
{
    /**
     * 查询外呼任务
     * 
     * @param batchId 外呼任务主键
     * @return 外呼任务
     */
    public CcCallTask selectCcCallTaskByBatchId(Long batchId);

    /**
     * 查询外呼任务列表
     * 
     * @param ccCallTask 外呼任务
     * @return 外呼任务集合
     */
    public List<CcCallTask> selectCcCallTaskList(CcCallTask ccCallTask);

    /**
     * 新增外呼任务
     * 
     * @param ccCallTask 外呼任务
     * @return 结果
     */
    public int insertCcCallTask(CcCallTask ccCallTask);

    /**
     * 修改外呼任务
     * 
     * @param ccCallTask 外呼任务
     * @return 结果
     */
    public int updateCcCallTask(CcCallTask ccCallTask);

    /**
     * 删除外呼任务
     * 
     * @param batchId 外呼任务主键
     * @return 结果
     */
    public int deleteCcCallTaskByBatchId(Long batchId);

    /**
     * 批量删除外呼任务
     * 
     * @param batchIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteCcCallTaskByBatchIds(String[] batchIds);
}
