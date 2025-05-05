package com.ruoyi.cc.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.cc.mapper.CcFsModulesCatMapper;
import com.ruoyi.cc.domain.CcFsModulesCat;
import com.ruoyi.cc.service.ICcFsModulesCatService;
import com.ruoyi.common.core.text.Convert;

/**
 * 【请填写功能名称】Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-12-22
 */
@Service
public class CcFsModulesCatServiceImpl implements ICcFsModulesCatService 
{
    @Autowired
    private CcFsModulesCatMapper ccFsModulesCatMapper;

    /**
     * 查询【请填写功能名称】
     * 
     * @param id 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    @Override
    public CcFsModulesCat selectCcFsModulesCatById(Long id)
    {
        return ccFsModulesCatMapper.selectCcFsModulesCatById(id);
    }

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param ccFsModulesCat 【请填写功能名称】
     * @return 【请填写功能名称】
     */
    @Override
    public List<CcFsModulesCat> selectCcFsModulesCatList(CcFsModulesCat ccFsModulesCat)
    {
        return ccFsModulesCatMapper.selectCcFsModulesCatList(ccFsModulesCat);
    }

    /**
     * 新增【请填写功能名称】
     * 
     * @param ccFsModulesCat 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int insertCcFsModulesCat(CcFsModulesCat ccFsModulesCat)
    {
        return ccFsModulesCatMapper.insertCcFsModulesCat(ccFsModulesCat);
    }

    /**
     * 修改【请填写功能名称】
     * 
     * @param ccFsModulesCat 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int updateCcFsModulesCat(CcFsModulesCat ccFsModulesCat)
    {
        return ccFsModulesCatMapper.updateCcFsModulesCat(ccFsModulesCat);
    }

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param ids 需要删除的【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteCcFsModulesCatByIds(String ids)
    {
        return ccFsModulesCatMapper.deleteCcFsModulesCatByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param id 【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteCcFsModulesCatById(Long id)
    {
        return ccFsModulesCatMapper.deleteCcFsModulesCatById(id);
    }
}
