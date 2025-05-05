package com.ruoyi.cc.service;

import java.util.List;
import com.ruoyi.cc.domain.SysDivisionData;

/**
 * 行政区划3级Service接口
 * 
 * @author ruoyi
 * @date 2025-01-12
 */
public interface ISysDivisionDataService 
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
     * 批量删除行政区划3级
     * 
     * @param ids 需要删除的行政区划3级主键集合
     * @return 结果
     */
    public int deleteSysDivisionDataByIds(String ids);

    /**
     * 删除行政区划3级信息
     * 
     * @param id 行政区划3级主键
     * @return 结果
     */
    public int deleteSysDivisionDataById(String id);

    SysDivisionData getByExtId(String extId);

    List<SysDivisionData> selectListByPId(String pid);
}
