package com.ruoyi.cc.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.cc.mapper.CcBizGroupMapper;
import com.ruoyi.cc.domain.CcBizGroup;
import com.ruoyi.cc.service.ICcBizGroupService;
import com.ruoyi.common.core.text.Convert;

/**
 * 业务分组Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-12-22
 */
@Service
public class CcBizGroupServiceImpl implements ICcBizGroupService 
{
    @Autowired
    private CcBizGroupMapper ccBizGroupMapper;

    /**
     * 查询业务分组
     * 
     * @param groupId 业务分组主键
     * @return 业务分组
     */
    @Override
    public CcBizGroup selectCcBizGroupByGroupId(String groupId)
    {
        return ccBizGroupMapper.selectCcBizGroupByGroupId(groupId);
    }

    /**
     * 查询业务分组列表
     * 
     * @param ccBizGroup 业务分组
     * @return 业务分组
     */
    @Override
    public List<CcBizGroup> selectCcBizGroupList(CcBizGroup ccBizGroup)
    {
        return ccBizGroupMapper.selectCcBizGroupList(ccBizGroup);
    }

    /**
     * 新增业务分组
     * 
     * @param ccBizGroup 业务分组
     * @return 结果
     */
    @Override
    public int insertCcBizGroup(CcBizGroup ccBizGroup)
    {
        return ccBizGroupMapper.insertCcBizGroup(ccBizGroup);
    }

    /**
     * 修改业务分组
     * 
     * @param ccBizGroup 业务分组
     * @return 结果
     */
    @Override
    public int updateCcBizGroup(CcBizGroup ccBizGroup)
    {
        return ccBizGroupMapper.updateCcBizGroup(ccBizGroup);
    }

    /**
     * 批量删除业务分组
     * 
     * @param groupIds 需要删除的业务分组主键
     * @return 结果
     */
    @Override
    public int deleteCcBizGroupByGroupIds(String groupIds)
    {
        return ccBizGroupMapper.deleteCcBizGroupByGroupIds(Convert.toStrArray(groupIds));
    }

    /**
     * 删除业务分组信息
     * 
     * @param groupId 业务分组主键
     * @return 结果
     */
    @Override
    public int deleteCcBizGroupByGroupId(String groupId)
    {
        return ccBizGroupMapper.deleteCcBizGroupByGroupId(groupId);
    }
}
