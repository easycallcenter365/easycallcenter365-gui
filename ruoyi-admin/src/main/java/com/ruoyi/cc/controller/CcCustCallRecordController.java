package com.ruoyi.cc.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.alibaba.fastjson.JSONObject;
import com.ruoyi.cc.domain.CcCustInfo;
import com.ruoyi.cc.domain.SysDivisionData;
import com.ruoyi.cc.service.ICcCustInfoService;
import com.ruoyi.cc.service.ISysDivisionDataService;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.utils.ShiroUtils;
import com.ruoyi.common.utils.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.cc.domain.CcCustCallRecord;
import com.ruoyi.cc.service.ICcCustCallRecordService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 沟通记录Controller
 * 
 * @author ruoyi
 * @date 2025-01-03
 */
@Controller
@RequestMapping("/cc/custcallrecord")
public class CcCustCallRecordController extends BaseController
{
    private String prefix = "cc/custcallrecord";

    @Autowired
    private ICcCustCallRecordService ccCustCallRecordService;
    @Autowired
    private ICcCustInfoService ccCustInfoService;
    @Autowired
    private ISysDivisionDataService sysDivisionDataService;

    @RequiresPermissions("cc:custcallrecord:view")
    @GetMapping()
    public String custcallrecord()
    {
        return prefix + "/custcallrecord";
    }

    /**
     * 新增沟通记录
     */
    @GetMapping("/add")
    public String add(@RequestParam("phoneNum") String phoneNum, @RequestParam("callType") Integer callType, @RequestParam("uuid") String uuid, ModelMap mmap)
    {
        CcCustInfo ccCustInfo = ccCustInfoService.selectCcCustInfoByPhoneNum(phoneNum);
        if (null == ccCustInfo) {
            ccCustInfo = new CcCustInfo();
            ccCustInfo.setCallRecordList(new ArrayList<>());
        } else {
            ccCustInfo.setCallRecordList(ccCustCallRecordService.selectCcCustCallRecordList(new CcCustCallRecord().setCustId(ccCustInfo.getId())));
        }
        ccCustInfo.setPhoneNum(phoneNum);
        mmap.put("ccCustInfo", ccCustInfo);
        mmap.put("callType", callType);
        mmap.put("uuid", uuid);
        // 省下拉框
        List<SysDivisionData> provinces = sysDivisionDataService.selectListByPId("0");
        mmap.put("provinces", provinces);
        // 市下拉框
        if (StringUtils.isNotEmpty(ccCustInfo.getProvinceCode())) {
            SysDivisionData provinceData = sysDivisionDataService.getByExtId(ccCustInfo.getProvinceCode());
            List<SysDivisionData> citys = sysDivisionDataService.selectListByPId(provinceData.getId());
            mmap.put("citys", citys);
        }
        // 区县下拉框
        if (StringUtils.isNotEmpty(ccCustInfo.getCityCode())) {
            SysDivisionData cityData = sysDivisionDataService.getByExtId(ccCustInfo.getCityCode());
            List<SysDivisionData> countys = sysDivisionDataService.selectListByPId(cityData.getId());
            mmap.put("countys", countys);
        }
        return prefix + "/add";
    }

    /**
     * 新增保存沟通记录
     */
    @RequiresPermissions("cc:custcallrecord:add")
    @Log(title = "沟通记录", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(CcCustInfo ccCustInfo)
    {
        // 获取当前的用户
        SysUser currentUser = ShiroUtils.getSysUser();
        if (null == ccCustInfo.getId()) {
            ccCustInfoService.insertCcCustInfo(ccCustInfo);
        } else {
            ccCustInfoService.updateCcCustInfo(ccCustInfo);
        }
        CcCustInfo custInfoBak = ccCustInfoService.selectCcCustInfoByPhoneNum(ccCustInfo.getPhoneNum());
        CcCustCallRecord callRecord = JSONObject.parseObject(ccCustInfo.getCallRecord(), CcCustCallRecord.class);
        callRecord.setCustId(custInfoBak.getId());
        callRecord.setUserId(currentUser.getLoginName());
        callRecord.setUserRealName(currentUser.getUserName());
        callRecord.setCreateTime(new Date());
        return toAjax(ccCustCallRecordService.insertCcCustCallRecord(callRecord));
    }

}
