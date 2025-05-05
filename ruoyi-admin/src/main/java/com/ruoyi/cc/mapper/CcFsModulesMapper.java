package com.ruoyi.cc.mapper;

import java.util.List;
import com.ruoyi.cc.domain.CcFsModules;

/**
 * FsModulesMapper接口
 * 
 * @author ruoyi
 * @date 2024-12-22
 */
public interface CcFsModulesMapper 
{
    /**
     * 查询FsModules
     * 
     * @param id FsModules主键
     * @return FsModules
     */
    public CcFsModules selectCcFsModulesById(Long id);

    /**
     * 查询FsModules列表
     * 
     * @param ccFsModules FsModules
     * @return FsModules集合
     */
    public List<CcFsModules> selectCcFsModulesList(CcFsModules ccFsModules);

    /**
     * 新增FsModules
     * 
     * @param ccFsModules FsModules
     * @return 结果
     */
    public int insertCcFsModules(CcFsModules ccFsModules);

    /**
     * 修改FsModules
     * 
     * @param ccFsModules FsModules
     * @return 结果
     */
    public int updateCcFsModules(CcFsModules ccFsModules);

    /**
     * 删除FsModules
     * 
     * @param id FsModules主键
     * @return 结果
     */
    public int deleteCcFsModulesById(Long id);

    /**
     * 批量删除FsModules
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteCcFsModulesByIds(String[] ids);
}
