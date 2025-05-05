package com.ruoyi.cc.service.impl;

import java.util.List;

import com.ruoyi.cc.domain.CcParams;
import com.ruoyi.cc.mapper.CcParamsMapper;
import com.ruoyi.cc.service.ICcParamsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.common.core.text.Convert;

/**
 * callcenter参数配置Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-04-21
 */
@Service
public class CcParamsServiceImpl implements ICcParamsService
{
    @Autowired
    private CcParamsMapper ccParamsMapper;

    /**
     * 查询callcenter参数配置
     * 
     * @param id callcenter参数配置主键
     * @return callcenter参数配置
     */
    @Override
    public CcParams selectCcParamsById(Long id)
    {
        return ccParamsMapper.selectCcParamsById(id);
    }

    /**
     * 查询callcenter参数配置列表
     * 
     * @param ccParams callcenter参数配置
     * @return callcenter参数配置
     */
    @Override
    public List<CcParams> selectCcParamsList(CcParams ccParams)
    {
        return ccParamsMapper.selectCcParamsList(ccParams);
    }

    /**
     * 新增callcenter参数配置
     * 
     * @param ccParams callcenter参数配置
     * @return 结果
     */
    @Override
    public int insertCcParams(CcParams ccParams)
    {
        return ccParamsMapper.insertCcParams(ccParams);
    }

    /**
     * 修改callcenter参数配置
     * 
     * @param ccParams callcenter参数配置
     * @return 结果
     */
    @Override
    public int updateCcParams(CcParams ccParams)
    {
        // 禁止修改参数的 param_code 和 param_type，否则可能引起混乱;
        CcParams ccParamsOld = selectCcParamsById(ccParams.getId());
        ccParams.setParamName(ccParamsOld.getParamName());
        ccParams.setParamCode(ccParamsOld.getParamCode());
        ccParams.setParamType(ccParamsOld.getParamType());

        return ccParamsMapper.updateCcParams(ccParams);
    }

    /**
     * 批量删除callcenter参数配置
     * 
     * @param ids 需要删除的callcenter参数配置主键
     * @return 结果
     */
    @Override
    public int deleteCcParamsByIds(String ids)
    {
        return ccParamsMapper.deleteCcParamsByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除callcenter参数配置信息
     * 
     * @param id callcenter参数配置主键
     * @return 结果
     */
    @Override
    public int deleteCcParamsById(Long id)
    {
        return ccParamsMapper.deleteCcParamsById(id);
    }

    @Override
    public String getParamValueByCode(String paramCode, String defaultValue) {
        List<CcParams> list = selectCcParamsList(new CcParams().setParamCode(paramCode));
        if (list.size() > 0) {
            return list.get(0).getParamValue();
        }
        return defaultValue;
    }
}
