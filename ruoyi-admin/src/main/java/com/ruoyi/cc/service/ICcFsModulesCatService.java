package com.ruoyi.cc.service;

import java.util.List;
import com.ruoyi.cc.domain.CcFsModulesCat;

/**
 * 【请填写功能名称】Service接口
 * 
 * @author ruoyi
 * @date 2024-12-22
 */
public interface ICcFsModulesCatService 
{
    /**
     * 查询【请填写功能名称】
     * 
     * @param id 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    public CcFsModulesCat selectCcFsModulesCatById(Long id);

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param ccFsModulesCat 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<CcFsModulesCat> selectCcFsModulesCatList(CcFsModulesCat ccFsModulesCat);

    /**
     * 新增【请填写功能名称】
     * 
     * @param ccFsModulesCat 【请填写功能名称】
     * @return 结果
     */
    public int insertCcFsModulesCat(CcFsModulesCat ccFsModulesCat);

    /**
     * 修改【请填写功能名称】
     * 
     * @param ccFsModulesCat 【请填写功能名称】
     * @return 结果
     */
    public int updateCcFsModulesCat(CcFsModulesCat ccFsModulesCat);

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param ids 需要删除的【请填写功能名称】主键集合
     * @return 结果
     */
    public int deleteCcFsModulesCatByIds(String ids);

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param id 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteCcFsModulesCatById(Long id);
}
