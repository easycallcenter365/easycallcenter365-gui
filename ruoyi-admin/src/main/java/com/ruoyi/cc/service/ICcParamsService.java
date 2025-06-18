package com.ruoyi.cc.service;

import com.ruoyi.cc.domain.CcParams;

import java.util.List;

/**
 * callcenter参数配置Service接口
 * 
 * @author ruoyi
 * @date 2025-04-21
 */
public interface ICcParamsService 
{
    /**
     * 查询callcenter参数配置
     * 
     * @param id callcenter参数配置主键
     * @return callcenter参数配置
     */
    public CcParams selectCcParamsById(Long id);

    /**
     * 查询callcenter参数配置列表
     * 
     * @param ccParams callcenter参数配置
     * @return callcenter参数配置集合
     */
    public List<CcParams> selectCcParamsList(CcParams ccParams);

    /**
     * 新增callcenter参数配置
     * 
     * @param ccParams callcenter参数配置
     * @return 结果
     */
    public int insertCcParams(CcParams ccParams);

    /**
     * 修改callcenter参数配置
     * 
     * @param ccParams callcenter参数配置
     * @return 结果
     */
    public int updateCcParams(CcParams ccParams);

    /**
     * 批量删除callcenter参数配置
     * 
     * @param ids 需要删除的callcenter参数配置主键集合
     * @return 结果
     */
    public int deleteCcParamsByIds(String ids);

    /**
     * 删除callcenter参数配置信息
     * 
     * @param id callcenter参数配置主键
     * @return 结果
     */
    public int deleteCcParamsById(Long id);

    /**
     * 根据参数编号获取参数值
     * @param paramCode
     * @return
     */
    String getParamValueByCode(String paramCode, String defaultValue);

    /**
     * 更新参数值
     * @param paramCode
     * @param paramValue
     */
    void updateParamsValue(String paramCode, String paramValue);

    /**
     *
     * @return
     */
    String reloadParams();
}
