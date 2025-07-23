package com.ruoyi.aicall.service.impl;

import java.util.List;
import java.util.Map;

import com.ruoyi.aicall.model.CallTaskStatModel;
import com.ruoyi.common.utils.DateUtils;
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

        Map<String, Object> params = ccCallPhone.getParams();
        if (null != params.get("calloutTimeStart")
                && !"".equals(params.get("calloutTimeStart"))) {
            params.put("calloutTimeStart", DateUtils.dateTime("yyyy-MM-dd HH:mm:ss", (String)params.get("calloutTimeStart")).getTime());
        }
        if (null != params.get("calloutTimeEnd")
                && !"".equals(params.get("calloutTimeEnd"))) {
            params.put("calloutTimeEnd", DateUtils.dateTime("yyyy-MM-dd HH:mm:ss", (String)params.get("calloutTimeEnd")).getTime());
        }
        if (null != params.get("callEndTimeStart")
                && !"".equals(params.get("callEndTimeStart"))) {
            params.put("callEndTimeStart", DateUtils.dateTime("yyyy-MM-dd HH:mm:ss", (String)params.get("callEndTimeStart")).getTime());
        }
        if (null != params.get("callEndTimeEnd")
                && !"".equals(params.get("callEndTimeEnd"))) {
            params.put("callEndTimeEnd", DateUtils.dateTime("yyyy-MM-dd HH:mm:ss", (String)params.get("callEndTimeEnd")).getTime());
        }
        if (null != params.get("connectedTimeStart")
                && !"".equals(params.get("connectedTimeStart"))) {
            params.put("connectedTimeStart", DateUtils.dateTime("yyyy-MM-dd HH:mm:ss", (String)params.get("connectedTimeStart")).getTime());
        }
        if (null != params.get("connectedTimeEnd")
                && !"".equals(params.get("connectedTimeEnd"))) {
            params.put("connectedTimeEnd", DateUtils.dateTime("yyyy-MM-dd HH:mm:ss", (String)params.get("connectedTimeEnd")).getTime());
        }
        if (null != params.get("timeLenStart")
                && !"".equals(params.get("timeLenStart"))) {
            params.put("timeLenStart", Double.valueOf((String)params.get("timeLenStart")) * 60 * 1000L);
        }
        if (null != params.get("timeLenEnd")
                && !"".equals(params.get("timeLenEnd"))) {
            params.put("timeLenEnd", Double.valueOf((String)params.get("timeLenEnd")) * 60 * 1000L);
        }
        if (null != params.get("answeredTimeStart")
                && !"".equals(params.get("answeredTimeStart"))) {
            params.put("answeredTimeStart", DateUtils.dateTime("yyyy-MM-dd HH:mm:ss", (String)params.get("answeredTimeStart")).getTime());
        }
        if (null != params.get("answeredTimeEnd")
                && !"".equals(params.get("answeredTimeEnd"))) {
            params.put("answeredTimeEnd", DateUtils.dateTime("yyyy-MM-dd HH:mm:ss", (String)params.get("answeredTimeEnd")).getTime());
        }
        ccCallPhone.setParams(params);
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
