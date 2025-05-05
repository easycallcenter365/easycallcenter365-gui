package com.ruoyi.cc.mapper;

import java.util.List;
import com.ruoyi.cc.domain.SysDivisionData;

/**
 * 行政区划3级Mapper接口
 * 
 * @author ruoyi
 * @date 2025-01-12
 */
public interface SysDivisionDataMapper 
{
    /**
     * 查询行政区划3级
     * 
     * @param id 行政区划3级主键
     * @return 行政区划3级
     */
    public SysDivisionData selectSysDivisionDataById(String id);

    /**
     * 查询行政区划3级列表
     * 
     * @param sysDivisionData 行政区划3级
     * @return 行政区划3级集合
     */
    public List<SysDivisionData> selectSysDivisionDataList(SysDivisionData sysDivisionData);

    /**
     * 新增行政区划3级
     * 
     * @param sysDivisionData 行政区划3级
     * @return 结果
     */
    public int insertSysDivisionData(SysDivisionData sysDivisionData);

    /**
     * 修改行政区划3级
     * 
     * @param sysDivisionData 行政区划3级
     * @return 结果
     */
    public int updateSysDivisionData(SysDivisionData sysDivisionData);

    /**
     * 删除行政区划3级
     * 
     * @param id 行政区划3级主键
     * @return 结果
     */
    public int deleteSysDivisionDataById(String id);

    /**
     * 批量删除行政区划3级
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysDivisionDataByIds(String[] ids);
}
