package com.ruoyi.cc.service.impl;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.ruoyi.cc.service.ICcParamsService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import com.ruoyi.cc.mapper.CcExtNumMapper;
import com.ruoyi.cc.domain.CcExtNum;
import com.ruoyi.cc.service.ICcExtNumService;
import com.ruoyi.common.core.text.Convert;
import org.springframework.util.CollectionUtils;

/**
 * 【请填写功能名称】Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-12-22
 */
@Service
@Slf4j
public class CcExtNumServiceImpl implements ICcExtNumService 
{
    @Autowired
    private CcExtNumMapper ccExtNumMapper;
    @Autowired
    private ICcParamsService ccParamsService;
    private String authTokenSecret;

    /**
     * 查询【请填写功能名称】
     * 
     * @param extId 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    @Override
    public CcExtNum selectCcExtNumByExtId(Long extId)
    {
        return ccExtNumMapper.selectCcExtNumByExtId(extId);
    }

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param ccExtNum 【请填写功能名称】
     * @return 【请填写功能名称】
     */
    @Override
    public List<CcExtNum> selectCcExtNumList(CcExtNum ccExtNum)
    {
        return ccExtNumMapper.selectCcExtNumList(ccExtNum);
    }

    /**
     * 新增【请填写功能名称】
     * 
     * @param ccExtNum 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int insertCcExtNum(CcExtNum ccExtNum)
    {
        return ccExtNumMapper.insertCcExtNum(ccExtNum);
    }

    /**
     * 修改【请填写功能名称】
     * 
     * @param ccExtNum 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int updateCcExtNum(CcExtNum ccExtNum)
    {
        return ccExtNumMapper.updateCcExtNum(ccExtNum);
    }

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param extIds 需要删除的【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteCcExtNumByExtIds(String extIds)
    {
        return ccExtNumMapper.deleteCcExtNumByExtIds(Convert.toStrArray(extIds));
    }

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param extId 【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteCcExtNumByExtId(Long extId)
    {
        return ccExtNumMapper.deleteCcExtNumByExtId(extId);
    }

    @Override
    public CcExtNum selectCcExtNumByExtNum(Long extNum) {
        List<CcExtNum> list = selectCcExtNumList(new CcExtNum().setExtNum(extNum));
        if (list.size() > 0) {
            return list.get(0);
        }
        return null;
    }

    @Override
    public CcExtNum selectCcExtNumByUserCode(String userCode) {
        List<CcExtNum> list = selectCcExtNumList(new CcExtNum().setUserCode(userCode));
        if (list.size() > 0) {
            return list.get(0);
        }
        return null;
    }



    @Override
    public String createToken(String extnum, String opnum, String groupId, String skillLevel, String projectId)  {
        try {
            authTokenSecret = ccParamsService.getParamValueByCode(
                    "ws-server-auth-token-secret", "123456");
            //登录成功后生成JWT
            //JWT的header部分,该map可以是空的,因为有默认值{"alg":HS256,"typ":"JWT"}
            Map<String, Object> map = new HashMap<>();
            Calendar instance = Calendar.getInstance();
            instance.add(Calendar.HOUR, 24);
            String token = JWT.create()
                    //添加头部
                    .withHeader(map)
                    //添加payload
                    .withClaim("extnum", extnum)
                    .withClaim("opnum", opnum)
                    .withClaim("groupId", groupId)
                    .withClaim("skillLevel", skillLevel)
                    .withClaim("projectId", projectId)
                    //设置过期时间
                    .withExpiresAt(instance.getTime())
                    //设置签名 密钥
                    .sign(Algorithm.HMAC256(authTokenSecret));
            return token;

        } catch (Exception err) {
            log.error("error:" + err.getMessage());
        }
        return null;
    }
}
