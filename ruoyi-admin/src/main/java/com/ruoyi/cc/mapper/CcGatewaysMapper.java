package com.ruoyi.cc.mapper;

import java.util.List;
import com.ruoyi.cc.domain.CcGateways;

/**
 * 线路配置Mapper接口
 * 
 * @author ruoyi
 * @date 2024-12-22
 */
public interface CcGatewaysMapper 
{
    /**
     * 查询线路配置
     * 
     * @param id 线路配置主键
     * @return 线路配置
     */
    public CcGateways selectCcGatewaysById(Long id);

    /**
     * 查询线路配置列表
     * 
     * @param ccGateways 线路配置
     * @return 线路配置集合
     */
    public List<CcGateways> selectCcGatewaysList(CcGateways ccGateways);

    /**
     * 新增线路配置
     * 
     * @param ccGateways 线路配置
     * @return 结果
     */
    public int insertCcGateways(CcGateways ccGateways);

    /**
     * 修改线路配置
     * 
     * @param ccGateways 线路配置
     * @return 结果
     */
    public int updateCcGateways(CcGateways ccGateways);

    /**
     * 删除线路配置
     * 
     * @param id 线路配置主键
     * @return 结果
     */
    public int deleteCcGatewaysById(Long id);

    /**
     * 批量删除线路配置
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteCcGatewaysByIds(String[] ids);
}
