package com.ruoyi.cc.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.cc.mapper.SysDivisionDataMapper;
import com.ruoyi.cc.domain.SysDivisionData;
import com.ruoyi.cc.service.ISysDivisionDataService;
import com.ruoyi.common.core.text.Convert;

/**
 * 行政区划3级Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-01-12
 */
@Service
public class SysDivisionDataServiceImpl implements ISysDivisionDataService 
{
    @Autowired
    private SysDivisionDataMapper sysDivisionDataMapper;

    /**
     * 查询行政区划3级
     * 
     * @param id 行政区划3级主键
     * @return 行政区划3级
     */
    @Override
    public SysDivisionData selectSysDivisionDataById(String id)
    {
        return sysDivisionDataMapper.selectSysDivisionDataById(id);
    }

    /**
     * 查询行政区划3级列表
     * 
     * @param sysDivisionData 行政区划3级
     * @return 行政区划3级
     */
    @Override
    public List<SysDivisionData> selectSysDivisionDataList(SysDivisionData sysDivisionData)
    {
        return sysDivisionDataMapper.selectSysDivisionDataList(sysDivisionData);
    }

    /**
     * 新增行政区划3级
     * 
     * @param sysDivisionData 行政区划3级
     * @return 结果
     */
    @Override
    public int insertSysDivisionData(SysDivisionData sysDivisionData)
    {
        return sysDivisionDataMapper.insertSysDivisionData(sysDivisionData);
    }

    /**
     * 修改行政区划3级
     * 
     * @param sysDivisionData 行政区划3级
     * @return 结果
     */
    @Override
    public int updateSysDivisionData(SysDivisionData sysDivisionData)
    {
        return sysDivisionDataMapper.updateSysDivisionData(sysDivisionData);
    }

    /**
     * 批量删除行政区划3级
     * 
     * @param ids 需要删除的行政区划3级主键
     * @return 结果
     */
    @Override
    public int deleteSysDivisionDataByIds(String ids)
    {
        return sysDivisionDataMapper.deleteSysDivisionDataByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除行政区划3级信息
     * 
     * @param id 行政区划3级主键
     * @return 结果
     */
    @Override
    public int deleteSysDivisionDataById(String id)
    {
        return sysDivisionDataMapper.deleteSysDivisionDataById(id);
    }

    @Override
    public SysDivisionData getByExtId(String extId) {
        List<SysDivisionData> list = selectSysDivisionDataList(new SysDivisionData().setExtId(extId));
        if (list.size() > 0) {
            return list.get(0);
        }
        return null;
    }

    @Override
    public List<SysDivisionData> selectListByPId(String pid) {
        return selectSysDivisionDataList(new SysDivisionData().setPid(pid));
    }
}
