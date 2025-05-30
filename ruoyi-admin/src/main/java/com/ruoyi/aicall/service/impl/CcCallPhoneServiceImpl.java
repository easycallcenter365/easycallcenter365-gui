package com.ruoyi.aicall.service.impl;

import java.util.List;

import com.ruoyi.aicall.model.CallTaskStatModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.aicall.mapper.CcCallPhoneMapper;
import com.ruoyi.aicall.domain.CcCallPhone;
import com.ruoyi.aicall.service.ICcCallPhoneService;
import com.ruoyi.common.core.text.Convert;

/**
 * 外呼号码Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-05-29
 */
@Service
public class CcCallPhoneServiceImpl implements ICcCallPhoneService 
{
    @Autowired
    private CcCallPhoneMapper ccCallPhoneMapper;

    /**
     * 查询外呼号码
     * 
     * @param id 外呼号码主键
     * @return 外呼号码
     */
    @Override
    public CcCallPhone selectCcCallPhoneById(String id)
    {
        return ccCallPhoneMapper.selectCcCallPhoneById(id);
    }

    /**
     * 查询外呼号码列表
     * 
     * @param ccCallPhone 外呼号码
     * @return 外呼号码
     */
    @Override
    public List<CcCallPhone> selectCcCallPhoneList(CcCallPhone ccCallPhone)
    {
        return ccCallPhoneMapper.selectCcCallPhoneList(ccCallPhone);
    }

    /**
     * 新增外呼号码
     * 
     * @param ccCallPhone 外呼号码
     * @return 结果
     */
    @Override
    public int insertCcCallPhone(CcCallPhone ccCallPhone)
    {
        return ccCallPhoneMapper.insertCcCallPhone(ccCallPhone);
    }

    /**
     * 修改外呼号码
     * 
     * @param ccCallPhone 外呼号码
     * @return 结果
     */
    @Override
    public int updateCcCallPhone(CcCallPhone ccCallPhone)
    {
        return ccCallPhoneMapper.updateCcCallPhone(ccCallPhone);
    }

    /**
     * 批量删除外呼号码
     * 
     * @param ids 需要删除的外呼号码主键
     * @return 结果
     */
    @Override
    public int deleteCcCallPhoneByIds(String ids)
    {
        return ccCallPhoneMapper.deleteCcCallPhoneByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除外呼号码信息
     * 
     * @param id 外呼号码主键
     * @return 结果
     */
    @Override
    public int deleteCcCallPhoneById(String id)
    {
        return ccCallPhoneMapper.deleteCcCallPhoneById(id);
    }

    @Override
    public CallTaskStatModel statByBatchId(Long batchId) {
        CallTaskStatModel callTaskStatModel = ccCallPhoneMapper.statByBatchId(batchId);
        if (null == callTaskStatModel.getPhoneCount()) {
            callTaskStatModel.setPhoneCount(0);
        }
        if (null == callTaskStatModel.getCallCount()) {
            callTaskStatModel.setCallCount(0);
        }
        if (null == callTaskStatModel.getConnectCount()) {
            callTaskStatModel.setConnectCount(0);
        }
        return callTaskStatModel;
    }

    @Override
    public void batchInsertCcCallPhone(List<CcCallPhone> phoneList) {
        ccCallPhoneMapper.batchInsertCcCallPhone(phoneList);
    }
}
