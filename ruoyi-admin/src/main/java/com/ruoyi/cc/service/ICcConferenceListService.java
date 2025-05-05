package com.ruoyi.cc.service;

import java.util.List;
import com.ruoyi.cc.domain.CcConferenceList;

/**
 * 【请填写功能名称】Service接口
 * 
 * @author ruoyi
 * @date 2024-12-22
 */
public interface ICcConferenceListService 
{
    /**
     * 查询【请填写功能名称】
     * 
     * @param id 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    public CcConferenceList selectCcConferenceListById(Long id);

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param ccConferenceList 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<CcConferenceList> selectCcConferenceListList(CcConferenceList ccConferenceList);

    /**
     * 新增【请填写功能名称】
     * 
     * @param ccConferenceList 【请填写功能名称】
     * @return 结果
     */
    public int insertCcConferenceList(CcConferenceList ccConferenceList);

    /**
     * 修改【请填写功能名称】
     * 
     * @param ccConferenceList 【请填写功能名称】
     * @return 结果
     */
    public int updateCcConferenceList(CcConferenceList ccConferenceList);

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param ids 需要删除的【请填写功能名称】主键集合
     * @return 结果
     */
    public int deleteCcConferenceListByIds(String ids);

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param id 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteCcConferenceListById(Long id);
}
