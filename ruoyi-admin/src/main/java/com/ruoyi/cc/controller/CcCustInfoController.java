package com.ruoyi.cc.controller;

import java.util.Date;
import java.util.List;

import com.ruoyi.cc.domain.CcCustCallRecord;
import com.ruoyi.cc.domain.SysDivisionData;
import com.ruoyi.cc.service.ICcCustCallRecordService;
import com.ruoyi.cc.service.ISysDivisionDataService;
import com.ruoyi.common.utils.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.cc.domain.CcCustInfo;
import com.ruoyi.cc.service.ICcCustInfoService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 客户信息Controller
 * 
 * @author ruoyi
 * @date 2025-01-03
 */
@Controller
@RequestMapping("/cc/custinfo")
public class CcCustInfoController extends BaseController
{
    private String prefix = "cc/custinfo";

    @Autowired
    private ICcCustInfoService ccCustInfoService;

    @Autowired
    private ICcCustCallRecordService ccCustCallRecordService;

    @Autowired
    private ISysDivisionDataService sysDivisionDataService;


    @RequiresPermissions("cc:custinfo:view")
    @GetMapping()
    public String info()
    {
        return prefix + "/custinfo";
    }

    /**
     * 查询客户信息列表
     */
    @RequiresPermissions("cc:custinfo:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(CcCustInfo ccCustInfo)
    {
        startPage();
        List<CcCustInfo> list = ccCustInfoService.selectCcCustInfoList(ccCustInfo);
        return getDataTable(list);
    }

    /**
     * 导出客户信息列表
     */
    @RequiresPermissions("cc:custinfo:export")
    @Log(title = "客户信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(CcCustInfo ccCustInfo)
    {
        List<CcCustInfo> list = ccCustInfoService.selectCcCustInfoList(ccCustInfo);
        ExcelUtil<CcCustInfo> util = new ExcelUtil<CcCustInfo>(CcCustInfo.class);
        return util.exportExcel(list, "客户信息数据");
    }

    /**
     * 新增客户信息
     */
    @GetMapping("/add")
    public String add(ModelMap mmap)
    {
        List<SysDivisionData> provinces = sysDivisionDataService.selectListByPId("0");
        mmap.put("provinces", provinces);
        return prefix + "/add";
    }

    /**
     * 新增保存客户信息
     */
    @RequiresPermissions("cc:custinfo:add")
    @Log(title = "客户信息", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(CcCustInfo ccCustInfo)
    {
        ccCustInfo.setCreateTime(new Date());
        ccCustInfo.setUpdateTime(new Date());
        return toAjax(ccCustInfoService.insertCcCustInfo(ccCustInfo));
    }

    /**
     * 修改客户信息
     */
    @RequiresPermissions("cc:custinfo:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        CcCustInfo ccCustInfo = ccCustInfoService.selectCcCustInfoById(id);
        mmap.put("ccCustInfo", ccCustInfo);
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
        return prefix + "/edit";
    }

    /**
     * 查看客户信息详情
     */
    @RequiresPermissions("cc:custinfo:view")
    @GetMapping("/detail/{id}")
    public String detail(@PathVariable("id") Long id, ModelMap mmap)
    {
        CcCustInfo ccCustInfo = ccCustInfoService.selectCcCustInfoById(id);
        ccCustInfo.setCallRecordList(ccCustCallRecordService.selectCcCustCallRecordList(new CcCustCallRecord().setCustId(id)));
        mmap.put("ccCustInfo", ccCustInfo);
        return prefix + "/detail";
    }

    /**
     * 修改保存客户信息
     */
    @RequiresPermissions("cc:custinfo:edit")
    @Log(title = "客户信息", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(CcCustInfo ccCustInfo)
    {
        ccCustInfo.setUpdateTime(new Date());
        return toAjax(ccCustInfoService.updateCcCustInfo(ccCustInfo));
    }

    /**
     * 删除客户信息
     */
    @RequiresPermissions("cc:custinfo:remove")
    @Log(title = "客户信息", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(ccCustInfoService.deleteCcCustInfoByIds(ids));
    }
}
