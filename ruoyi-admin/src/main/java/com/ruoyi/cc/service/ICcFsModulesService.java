package com.ruoyi.cc.service;

import java.util.List;
import com.ruoyi.cc.domain.CcFsModules;

/**
 * 【请填写功能名称】Service接口
 * 
 * @author ruoyi
 * @date 2024-12-22
 */
public interface ICcFsModulesService 
{
    /**
     * 查询【请填写功能名称】
     * 
     * @param id 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    public CcFsModules selectCcFsModulesById(Long id);

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param ccFsModules 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<CcFsModules> selectCcFsModulesList(CcFsModules ccFsModules);

    /**
     * 新增【请填写功能名称】
     * 
     * @param ccFsModules 【请填写功能名称】
     * @return 结果
     */
    public int insertCcFsModules(CcFsModules ccFsModules);

    /**
     * 修改【请填写功能名称】
     * 
     * @param ccFsModules 【请填写功能名称】
     * @return 结果
     */
    public int updateCcFsModules(CcFsModules ccFsModules);

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param ids 需要删除的【请填写功能名称】主键集合
     * @return 结果
     */
    public int deleteCcFsModulesByIds(String ids);

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param id 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteCcFsModulesById(Long id);
}
