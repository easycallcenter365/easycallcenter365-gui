package com.ruoyi.cc.controller;

import java.util.List;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.cc.domain.SysDivisionData;
import com.ruoyi.cc.service.ISysDivisionDataService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 行政区划3级Controller
 * 
 * @author ruoyi
 * @date 2025-01-12
 */
@Controller
@RequestMapping("/cc/divisiondata")
public class SysDivisionDataController extends BaseController
{
    private String prefix = "cc/divisiondata";

    @Autowired
    private ISysDivisionDataService sysDivisionDataService;

    @RequiresPermissions("cc:divisiondata:view")
    @GetMapping()
    public String data()
    {
        return prefix + "/data";
    }

    /**
     * 查询行政区划3级列表
     */
    @RequiresPermissions("cc:divisiondata:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(SysDivisionData sysDivisionData)
    {
        startPage();
        List<SysDivisionData> list = sysDivisionDataService.selectSysDivisionDataList(sysDivisionData);
        return getDataTable(list);
    }

    /**
     * 导出行政区划3级列表
     */
    @RequiresPermissions("cc:divisiondata:export")
    @Log(title = "行政区划3级", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(SysDivisionData sysDivisionData)
    {
        List<SysDivisionData> list = sysDivisionDataService.selectSysDivisionDataList(sysDivisionData);
        ExcelUtil<SysDivisionData> util = new ExcelUtil<SysDivisionData>(SysDivisionData.class);
        return util.exportExcel(list, "行政区划3级数据");
    }

    /**
     * 新增行政区划3级
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存行政区划3级
     */
    @RequiresPermissions("cc:divisiondata:add")
    @Log(title = "行政区划3级", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(SysDivisionData sysDivisionData)
    {
        return toAjax(sysDivisionDataService.insertSysDivisionData(sysDivisionData));
    }

    /**
     * 修改行政区划3级
     */
    @RequiresPermissions("cc:divisiondata:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") String id, ModelMap mmap)
    {
        SysDivisionData sysDivisionData = sysDivisionDataService.selectSysDivisionDataById(id);
        mmap.put("sysDivisionData", sysDivisionData);
        return prefix + "/edit";
    }

    /**
     * 修改保存行政区划3级
     */
    @RequiresPermissions("cc:divisiondata:edit")
    @Log(title = "行政区划3级", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(SysDivisionData sysDivisionData)
    {
        return toAjax(sysDivisionDataService.updateSysDivisionData(sysDivisionData));
    }

    /**
     * 删除行政区划3级
     */
    @RequiresPermissions("cc:divisiondata:remove")
    @Log(title = "行政区划3级", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(sysDivisionDataService.deleteSysDivisionDataByIds(ids));
    }


    /**
     * 查询行政区划3级列表
     */
    @GetMapping("/getCitysByProvinceCode")
    @ResponseBody
    public AjaxResult getCitysByProvinceCode(@RequestParam String provinceCode)
    {
        SysDivisionData provinceData = sysDivisionDataService.getByExtId(provinceCode);
        List<SysDivisionData> list = sysDivisionDataService.selectListByPId(provinceData.getId());
        return AjaxResult.success(list);
    }


    /**
     * 查询行政区划3级列表
     */
    @GetMapping("/getCountysByCityCode")
    @ResponseBody
    public AjaxResult getCountysByCityCode(@RequestParam String cityCode)
    {
        SysDivisionData cityData = sysDivisionDataService.getByExtId(cityCode);
        List<SysDivisionData> list = sysDivisionDataService.selectListByPId(cityData.getId());
        return AjaxResult.success(list);
    }
}
