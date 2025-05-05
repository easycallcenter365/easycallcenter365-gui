package com.ruoyi.cc.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.cc.mapper.CcGatewaysMapper;
import com.ruoyi.cc.domain.CcGateways;
import com.ruoyi.cc.service.ICcGatewaysService;
import com.ruoyi.common.core.text.Convert;

/**
 * 线路配置Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-12-22
 */
@Service
public class CcGatewaysServiceImpl implements ICcGatewaysService 
{
    @Autowired
    private CcGatewaysMapper ccGatewaysMapper;

    /**
     * 查询线路配置
     * 
     * @param id 线路配置主键
     * @return 线路配置
     */
    @Override
    public CcGateways selectCcGatewaysById(Long id)
    {
        return ccGatewaysMapper.selectCcGatewaysById(id);
    }

    /**
     * 查询线路配置列表
     * 
     * @param ccGateways 线路配置
     * @return 线路配置
     */
    @Override
    public List<CcGateways> selectCcGatewaysList(CcGateways ccGateways)
    {
        return ccGatewaysMapper.selectCcGatewaysList(ccGateways);
    }

    /**
     * 新增线路配置
     * 
     * @param ccGateways 线路配置
     * @return 结果
     */
    @Override
    public int insertCcGateways(CcGateways ccGateways)
    {
        return ccGatewaysMapper.insertCcGateways(ccGateways);
    }

    /**
     * 修改线路配置
     * 
     * @param ccGateways 线路配置
     * @return 结果
     */
    @Override
    public int updateCcGateways(CcGateways ccGateways)
    {
        return ccGatewaysMapper.updateCcGateways(ccGateways);
    }

    /**
     * 批量删除线路配置
     * 
     * @param ids 需要删除的线路配置主键
     * @return 结果
     */
    @Override
    public int deleteCcGatewaysByIds(String ids)
    {
        return ccGatewaysMapper.deleteCcGatewaysByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除线路配置信息
     * 
     * @param id 线路配置主键
     * @return 结果
     */
    @Override
    public int deleteCcGatewaysById(Long id)
    {
        return ccGatewaysMapper.deleteCcGatewaysById(id);
    }

    @Override
    public CcGateways selectCcGatewaysByGwName(String gwName) {
        List<CcGateways> list = this.selectCcGatewaysList(new CcGateways().setGwName(gwName));
        if (list.size() > 0) {
            return list.get(0);
        }
        return null;
    }
}
