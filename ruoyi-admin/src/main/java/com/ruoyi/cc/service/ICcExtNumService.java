package com.ruoyi.cc.service;

import java.util.List;
import com.ruoyi.cc.domain.CcExtNum;

/**
 * 【请填写功能名称】Service接口
 * 
 * @author ruoyi
 * @date 2024-12-22
 */
public interface ICcExtNumService 
{
    /**
     * 查询【请填写功能名称】
     * 
     * @param extId 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    public CcExtNum selectCcExtNumByExtId(Long extId);

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param ccExtNum 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<CcExtNum> selectCcExtNumList(CcExtNum ccExtNum);

    /**
     * 新增【请填写功能名称】
     * 
     * @param ccExtNum 【请填写功能名称】
     * @return 结果
     */
    public int insertCcExtNum(CcExtNum ccExtNum);

    /**
     * 修改【请填写功能名称】
     * 
     * @param ccExtNum 【请填写功能名称】
     * @return 结果
     */
    public int updateCcExtNum(CcExtNum ccExtNum);

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param extIds 需要删除的【请填写功能名称】主键集合
     * @return 结果
     */
    public int deleteCcExtNumByExtIds(String extIds);

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param extId 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteCcExtNumByExtId(Long extId);

    /**
     * 根据分机号查询
     * @param extNum
     * @return
     */
    CcExtNum selectCcExtNumByExtNum(Long extNum);

    /**
     * 根据工号查询分机号
     * @param userCode
     * @return
     */
    CcExtNum selectCcExtNumByUserCode(String userCode);

    /**
     * 生成loginToken
     * @param extnum
     * @param opnum
     * @param groupId
     * @param skillLevel
     * @param projectId
     * @return
     */
    String createToken(String extnum, String opnum, String groupId, String skillLevel, String projectId);
}
