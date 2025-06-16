package com.ruoyi.aicall.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.aicall.mapper.CcLlmAgentProviderMapper;
import com.ruoyi.aicall.domain.CcLlmAgentProvider;
import com.ruoyi.aicall.service.ICcLlmAgentProviderService;
import com.ruoyi.common.core.text.Convert;

/**
 * 大模型实现类列表Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-06-16
 */
@Service
public class CcLlmAgentProviderServiceImpl implements ICcLlmAgentProviderService 
{
    @Autowired
    private CcLlmAgentProviderMapper ccLlmAgentProviderMapper;

    /**
     * 查询大模型实现类列表
     * 
     * @param id 大模型实现类列表主键
     * @return 大模型实现类列表
     */
    @Override
    public CcLlmAgentProvider selectCcLlmAgentProviderById(Integer id)
    {
        return ccLlmAgentProviderMapper.selectCcLlmAgentProviderById(id);
    }

    /**
     * 查询大模型实现类列表列表
     * 
     * @param ccLlmAgentProvider 大模型实现类列表
     * @return 大模型实现类列表
     */
    @Override
    public List<CcLlmAgentProvider> selectCcLlmAgentProviderList(CcLlmAgentProvider ccLlmAgentProvider)
    {
        return ccLlmAgentProviderMapper.selectCcLlmAgentProviderList(ccLlmAgentProvider);
    }

    /**
     * 新增大模型实现类列表
     * 
     * @param ccLlmAgentProvider 大模型实现类列表
     * @return 结果
     */
    @Override
    public int insertCcLlmAgentProvider(CcLlmAgentProvider ccLlmAgentProvider)
    {
        return ccLlmAgentProviderMapper.insertCcLlmAgentProvider(ccLlmAgentProvider);
    }

    /**
     * 修改大模型实现类列表
     * 
     * @param ccLlmAgentProvider 大模型实现类列表
     * @return 结果
     */
    @Override
    public int updateCcLlmAgentProvider(CcLlmAgentProvider ccLlmAgentProvider)
    {
        return ccLlmAgentProviderMapper.updateCcLlmAgentProvider(ccLlmAgentProvider);
    }

    /**
     * 批量删除大模型实现类列表
     * 
     * @param ids 需要删除的大模型实现类列表主键
     * @return 结果
     */
    @Override
    public int deleteCcLlmAgentProviderByIds(String ids)
    {
        return ccLlmAgentProviderMapper.deleteCcLlmAgentProviderByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除大模型实现类列表信息
     * 
     * @param id 大模型实现类列表主键
     * @return 结果
     */
    @Override
    public int deleteCcLlmAgentProviderById(Integer id)
    {
        return ccLlmAgentProviderMapper.deleteCcLlmAgentProviderById(id);
    }
}
