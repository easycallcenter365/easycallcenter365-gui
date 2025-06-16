package com.ruoyi.aicall.mapper;

import java.util.List;
import com.ruoyi.aicall.domain.CcLlmAgentProvider;

/**
 * 大模型实现类列表Mapper接口
 * 
 * @author ruoyi
 * @date 2025-06-16
 */
public interface CcLlmAgentProviderMapper 
{
    /**
     * 查询大模型实现类列表
     * 
     * @param id 大模型实现类列表主键
     * @return 大模型实现类列表
     */
    public CcLlmAgentProvider selectCcLlmAgentProviderById(Integer id);

    /**
     * 查询大模型实现类列表列表
     * 
     * @param ccLlmAgentProvider 大模型实现类列表
     * @return 大模型实现类列表集合
     */
    public List<CcLlmAgentProvider> selectCcLlmAgentProviderList(CcLlmAgentProvider ccLlmAgentProvider);

    /**
     * 新增大模型实现类列表
     * 
     * @param ccLlmAgentProvider 大模型实现类列表
     * @return 结果
     */
    public int insertCcLlmAgentProvider(CcLlmAgentProvider ccLlmAgentProvider);

    /**
     * 修改大模型实现类列表
     * 
     * @param ccLlmAgentProvider 大模型实现类列表
     * @return 结果
     */
    public int updateCcLlmAgentProvider(CcLlmAgentProvider ccLlmAgentProvider);

    /**
     * 删除大模型实现类列表
     * 
     * @param id 大模型实现类列表主键
     * @return 结果
     */
    public int deleteCcLlmAgentProviderById(Integer id);

    /**
     * 批量删除大模型实现类列表
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteCcLlmAgentProviderByIds(String[] ids);
}
