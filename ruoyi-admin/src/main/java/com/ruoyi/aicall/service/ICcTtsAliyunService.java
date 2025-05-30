package com.ruoyi.aicall.service;

import java.util.List;
import com.ruoyi.aicall.domain.CcTtsAliyun;

/**
 * 阿里云音色列Service接口
 * 
 * @author ruoyi
 * @date 2025-05-29
 */
public interface ICcTtsAliyunService 
{
    /**
     * 查询阿里云音色列
     * 
     * @param id 阿里云音色列主键
     * @return 阿里云音色列
     */
    public CcTtsAliyun selectCcTtsAliyunById(Integer id);

    /**
     * 查询阿里云音色列列表
     * 
     * @param ccTtsAliyun 阿里云音色列
     * @return 阿里云音色列集合
     */
    public List<CcTtsAliyun> selectCcTtsAliyunList(CcTtsAliyun ccTtsAliyun);

    /**
     * 新增阿里云音色列
     * 
     * @param ccTtsAliyun 阿里云音色列
     * @return 结果
     */
    public int insertCcTtsAliyun(CcTtsAliyun ccTtsAliyun);

    /**
     * 修改阿里云音色列
     * 
     * @param ccTtsAliyun 阿里云音色列
     * @return 结果
     */
    public int updateCcTtsAliyun(CcTtsAliyun ccTtsAliyun);

    /**
     * 批量删除阿里云音色列
     * 
     * @param ids 需要删除的阿里云音色列主键集合
     * @return 结果
     */
    public int deleteCcTtsAliyunByIds(String ids);

    /**
     * 删除阿里云音色列信息
     * 
     * @param id 阿里云音色列主键
     * @return 结果
     */
    public int deleteCcTtsAliyunById(Integer id);
}
