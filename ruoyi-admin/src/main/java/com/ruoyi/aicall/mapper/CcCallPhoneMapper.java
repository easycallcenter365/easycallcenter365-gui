package com.ruoyi.aicall.mapper;

import com.ruoyi.aicall.domain.CcCallPhone;
import com.ruoyi.aicall.model.CallTaskStatModel;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 外呼号码Mapper接口
 * 
 * @author ruoyi
 * @date 2025-05-29
 */
public interface CcCallPhoneMapper 
{
    /**
     * 查询外呼号码
     * 
     * @param id 外呼号码主键
     * @return 外呼号码
     */
    public CcCallPhone selectCcCallPhoneById(String id);

    /**
     * 查询外呼号码列表
     * 
     * @param ccCallPhone 外呼号码
     * @return 外呼号码集合
     */
    public List<CcCallPhone> selectCcCallPhoneList(CcCallPhone ccCallPhone);

    /**
     * 新增外呼号码
     * 
     * @param ccCallPhone 外呼号码
     * @return 结果
     */
    public int insertCcCallPhone(CcCallPhone ccCallPhone);

    /**
     * 修改外呼号码
     * 
     * @param ccCallPhone 外呼号码
     * @return 结果
     */
    public int updateCcCallPhone(CcCallPhone ccCallPhone);

    /**
     * 删除外呼号码
     * 
     * @param id 外呼号码主键
     * @return 结果
     */
    public int deleteCcCallPhoneById(String id);

    /**
     * 批量删除外呼号码
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteCcCallPhoneByIds(String[] ids);

    /**
     * 根据batchId统计外呼数据
     * @param batchId
     * @return
     */
    CallTaskStatModel statByBatchId(Long batchId);

    /**
     * 批量入库
     * @param phoneList
     */
    void batchInsertCcCallPhone(List<CcCallPhone> phoneList);

    /**
     * 获取所有的已挂机未跑批客户意向的通话记录
     * @return
     */
    List<CcCallPhone> getCustIntentionList();

    int updateIntentionByIds(@Param("intention") String intention, @Param("phoneIds") List<String> phoneIds);
}
