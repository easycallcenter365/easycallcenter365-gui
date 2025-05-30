package com.ruoyi.aicall.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.aicall.mapper.CcTtsAliyunMapper;
import com.ruoyi.aicall.domain.CcTtsAliyun;
import com.ruoyi.aicall.service.ICcTtsAliyunService;
import com.ruoyi.common.core.text.Convert;

/**
 * 阿里云音色列Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-05-29
 */
@Service
public class CcTtsAliyunServiceImpl implements ICcTtsAliyunService 
{
    @Autowired
    private CcTtsAliyunMapper ccTtsAliyunMapper;

    /**
     * 查询阿里云音色列
     * 
     * @param id 阿里云音色列主键
     * @return 阿里云音色列
     */
    @Override
    public CcTtsAliyun selectCcTtsAliyunById(Integer id)
    {
        return ccTtsAliyunMapper.selectCcTtsAliyunById(id);
    }

    /**
     * 查询阿里云音色列列表
     * 
     * @param ccTtsAliyun 阿里云音色列
     * @return 阿里云音色列
     */
    @Override
    public List<CcTtsAliyun> selectCcTtsAliyunList(CcTtsAliyun ccTtsAliyun)
    {
        return ccTtsAliyunMapper.selectCcTtsAliyunList(ccTtsAliyun);
    }

    /**
     * 新增阿里云音色列
     * 
     * @param ccTtsAliyun 阿里云音色列
     * @return 结果
     */
    @Override
    public int insertCcTtsAliyun(CcTtsAliyun ccTtsAliyun)
    {
        return ccTtsAliyunMapper.insertCcTtsAliyun(ccTtsAliyun);
    }

    /**
     * 修改阿里云音色列
     * 
     * @param ccTtsAliyun 阿里云音色列
     * @return 结果
     */
    @Override
    public int updateCcTtsAliyun(CcTtsAliyun ccTtsAliyun)
    {
        return ccTtsAliyunMapper.updateCcTtsAliyun(ccTtsAliyun);
    }

    /**
     * 批量删除阿里云音色列
     * 
     * @param ids 需要删除的阿里云音色列主键
     * @return 结果
     */
    @Override
    public int deleteCcTtsAliyunByIds(String ids)
    {
        return ccTtsAliyunMapper.deleteCcTtsAliyunByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除阿里云音色列信息
     * 
     * @param id 阿里云音色列主键
     * @return 结果
     */
    @Override
    public int deleteCcTtsAliyunById(Integer id)
    {
        return ccTtsAliyunMapper.deleteCcTtsAliyunById(id);
    }
}
