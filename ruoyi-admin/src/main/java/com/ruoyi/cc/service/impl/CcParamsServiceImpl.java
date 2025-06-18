package com.ruoyi.cc.service.impl;

import java.util.List;

import com.ruoyi.cc.domain.CcParams;
import com.ruoyi.cc.mapper.CcParamsMapper;
import com.ruoyi.cc.service.ICcParamsService;
import com.ruoyi.common.utils.CommonUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.http.HttpUtils;
import com.sun.org.apache.xpath.internal.operations.Bool;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
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


    @Value("${sysconfig.hide-secret}")
    private String sysConfigHideSecret;


    /**
     * 查询callcenter参数配置
     * 
     * @param id callcenter参数配置主键
     * @return callcenter参数配置
     */
    @Override
    public CcParams selectCcParamsById(Long id)
    {
        CcParams params =  ccParamsMapper.selectCcParamsById(id);
        boolean hideSecret = Boolean.parseBoolean(sysConfigHideSecret);
        if(params.getHideValue() == 1 && hideSecret){
            String hideString = params.getParamValue();
            params.setParamValue(CommonUtils.maskStringUtil(hideString));
        }
        return params;
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
        List<CcParams> origList = ccParamsMapper.selectCcParamsList(ccParams);
        boolean hideSecret = Boolean.parseBoolean(sysConfigHideSecret);
        if(hideSecret) {
            for (CcParams params : origList) {
                if (params.getHideValue() == 1) {
                    String hideString = params.getParamValue();
                    params.setParamValue(CommonUtils.maskStringUtil(hideString));
                }
            }
        }
        return origList;
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

        boolean hideSecret = Boolean.parseBoolean(sysConfigHideSecret);
        boolean containsMaskStr =  ccParams.getParamValue().contains("**");
        if(!hideSecret || !containsMaskStr) {
            return ccParamsMapper.updateCcParams(ccParams);
        }
        return 1;
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
        List<CcParams> list = ccParamsMapper.selectCcParamsList(new CcParams().setParamCode(paramCode));
        if (list.size() > 0) {
            return list.get(0).getParamValue();
        }
        return defaultValue;
    }

    @Override
    public void updateParamsValue(String paramCode, String paramValue) {
        ccParamsMapper.updateParamsValue(paramCode, paramValue);
    }

    @Override
    public String reloadParams() {
        // Access the 'reloadParams' webapi interface to make the parameters take effect;
        String serverPort = getParamValueByCode("call-center-server-port", "");
        if(!StringUtils.isEmpty(serverPort)){
            String reloadParamsUrl = String.format("http://127.0.0.1:%s/call-center/reloadParams", serverPort);
            String response = HttpUtils.sendGet(reloadParamsUrl);
            return response;
        }
        return "";
    }
}
