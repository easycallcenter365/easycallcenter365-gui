package com.ruoyi.cc.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.cc.mapper.CcConferenceListMapper;
import com.ruoyi.cc.domain.CcConferenceList;
import com.ruoyi.cc.service.ICcConferenceListService;
import com.ruoyi.common.core.text.Convert;

/**
 * 【请填写功能名称】Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-12-22
 */
@Service
public class CcConferenceListServiceImpl implements ICcConferenceListService 
{
    @Autowired
    private CcConferenceListMapper ccConferenceListMapper;

    /**
     * 查询【请填写功能名称】
     * 
     * @param id 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    @Override
    public CcConferenceList selectCcConferenceListById(Long id)
    {
        return ccConferenceListMapper.selectCcConferenceListById(id);
    }

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param ccConferenceList 【请填写功能名称】
     * @return 【请填写功能名称】
     */
    @Override
    public List<CcConferenceList> selectCcConferenceListList(CcConferenceList ccConferenceList)
    {
        return ccConferenceListMapper.selectCcConferenceListList(ccConferenceList);
    }

    /**
     * 新增【请填写功能名称】
     * 
     * @param ccConferenceList 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int insertCcConferenceList(CcConferenceList ccConferenceList)
    {
        return ccConferenceListMapper.insertCcConferenceList(ccConferenceList);
    }

    /**
     * 修改【请填写功能名称】
     * 
     * @param ccConferenceList 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int updateCcConferenceList(CcConferenceList ccConferenceList)
    {
        return ccConferenceListMapper.updateCcConferenceList(ccConferenceList);
    }

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param ids 需要删除的【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteCcConferenceListByIds(String ids)
    {
        return ccConferenceListMapper.deleteCcConferenceListByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param id 【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteCcConferenceListById(Long id)
    {
        return ccConferenceListMapper.deleteCcConferenceListById(id);
    }
}
