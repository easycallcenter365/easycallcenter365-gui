package com.ruoyi.cc.mapper;

import java.util.List;
import com.ruoyi.cc.domain.CcFsModulesCat;

/**
 * FsModulesCatMapper接口
 * 
 * @author ruoyi
 * @date 2024-12-22
 */
public interface CcFsModulesCatMapper 
{
    /**
     * 查询FsModulesCat
     * 
     * @param id FsModulesCat主键
     * @return FsModulesCat
     */
    public CcFsModulesCat selectCcFsModulesCatById(Long id);

    /**
     * 查询FsModulesCat列表
     * 
     * @param ccFsModulesCat FsModulesCat
     * @return FsModulesCat集合
     */
    public List<CcFsModulesCat> selectCcFsModulesCatList(CcFsModulesCat ccFsModulesCat);

    /**
     * 新增FsModulesCat
     * 
     * @param ccFsModulesCat FsModulesCat
     * @return 结果
     */
    public int insertCcFsModulesCat(CcFsModulesCat ccFsModulesCat);

    /**
     * 修改FsModulesCat
     * 
     * @param ccFsModulesCat FsModulesCat
     * @return 结果
     */
    public int updateCcFsModulesCat(CcFsModulesCat ccFsModulesCat);

    /**
     * 删除FsModulesCat
     * 
     * @param id FsModulesCat主键
     * @return 结果
     */
    public int deleteCcFsModulesCatById(Long id);

    /**
     * 批量删除FsModulesCat
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteCcFsModulesCatByIds(String[] ids);
}
