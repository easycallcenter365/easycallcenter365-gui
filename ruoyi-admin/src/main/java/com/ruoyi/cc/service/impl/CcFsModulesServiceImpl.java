package com.ruoyi.cc.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.cc.mapper.CcFsModulesMapper;
import com.ruoyi.cc.domain.CcFsModules;
import com.ruoyi.cc.service.ICcFsModulesService;
import com.ruoyi.common.core.text.Convert;

/**
 * 【请填写功能名称】Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-12-22
 */
@Service
public class CcFsModulesServiceImpl implements ICcFsModulesService 
{
    @Autowired
    private CcFsModulesMapper ccFsModulesMapper;

    /**
     * 查询【请填写功能名称】
     * 
     * @param id 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    @Override
    public CcFsModules selectCcFsModulesById(Long id)
    {
        return ccFsModulesMapper.selectCcFsModulesById(id);
    }

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param ccFsModules 【请填写功能名称】
     * @return 【请填写功能名称】
     */
    @Override
    public List<CcFsModules> selectCcFsModulesList(CcFsModules ccFsModules)
    {
        return ccFsModulesMapper.selectCcFsModulesList(ccFsModules);
    }

    /**
     * 新增【请填写功能名称】
     * 
     * @param ccFsModules 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int insertCcFsModules(CcFsModules ccFsModules)
    {
        return ccFsModulesMapper.insertCcFsModules(ccFsModules);
    }

    /**
     * 修改【请填写功能名称】
     * 
     * @param ccFsModules 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int updateCcFsModules(CcFsModules ccFsModules)
    {
        return ccFsModulesMapper.updateCcFsModules(ccFsModules);
    }

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param ids 需要删除的【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteCcFsModulesByIds(String ids)
    {
        return ccFsModulesMapper.deleteCcFsModulesByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param id 【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteCcFsModulesById(Long id)
    {
        return ccFsModulesMapper.deleteCcFsModulesById(id);
    }
}
