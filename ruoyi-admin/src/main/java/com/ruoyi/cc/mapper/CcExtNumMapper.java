package com.ruoyi.cc.mapper;

import java.util.List;
import com.ruoyi.cc.domain.CcExtNum;

/**
 * 分机信息Mapper接口
 * 
 * @author ruoyi
 * @date 2024-12-22
 */
public interface CcExtNumMapper 
{
    /**
     * 查询分机信息
     * 
     * @param extId 分机信息主键
     * @return 分机信息
     */
    public CcExtNum selectCcExtNumByExtId(Long extId);

    /**
     * 查询分机信息列表
     * 
     * @param ccExtNum 分机信息
     * @return 分机信息集合
     */
    public List<CcExtNum> selectCcExtNumList(CcExtNum ccExtNum);

    /**
     * 新增分机信息
     * 
     * @param ccExtNum 分机信息
     * @return 结果
     */
    public int insertCcExtNum(CcExtNum ccExtNum);

    /**
     * 修改分机信息
     * 
     * @param ccExtNum 分机信息
     * @return 结果
     */
    public int updateCcExtNum(CcExtNum ccExtNum);

    /**
     * 删除分机信息
     * 
     * @param extId 分机信息主键
     * @return 结果
     */
    public int deleteCcExtNumByExtId(Long extId);

    /**
     * 批量删除分机信息
     * 
     * @param extIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteCcExtNumByExtIds(String[] extIds);
}
