package com.ruoyi.cc.mapper;

import java.util.List;
import com.ruoyi.cc.domain.CcBizGroup;

/**
 * 业务分组Mapper接口
 * 
 * @author ruoyi
 * @date 2024-12-22
 */
public interface CcBizGroupMapper 
{
    /**
     * 查询业务分组
     * 
     * @param groupId 业务分组主键
     * @return 业务分组
     */
    public CcBizGroup selectCcBizGroupByGroupId(String groupId);

    /**
     * 查询业务分组列表
     * 
     * @param ccBizGroup 业务分组
     * @return 业务分组集合
     */
    public List<CcBizGroup> selectCcBizGroupList(CcBizGroup ccBizGroup);

    /**
     * 新增业务分组
     * 
     * @param ccBizGroup 业务分组
     * @return 结果
     */
    public int insertCcBizGroup(CcBizGroup ccBizGroup);

    /**
     * 修改业务分组
     * 
     * @param ccBizGroup 业务分组
     * @return 结果
     */
    public int updateCcBizGroup(CcBizGroup ccBizGroup);

    /**
     * 删除业务分组
     * 
     * @param groupId 业务分组主键
     * @return 结果
     */
    public int deleteCcBizGroupByGroupId(String groupId);

    /**
     * 批量删除业务分组
     * 
     * @param groupIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteCcBizGroupByGroupIds(String[] groupIds);
}
