package com.ruoyi.aicall.controller;

import java.util.List;
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
import com.ruoyi.aicall.domain.CcCallPhone;
import com.ruoyi.aicall.service.ICcCallPhoneService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 外呼号码Controller
 * 
 * @author ruoyi
 * @date 2025-05-29
 */
@Controller
@RequestMapping("/aicall/callPhone")
public class CcCallPhoneController extends BaseController
{
    private String prefix = "aicall/callPhone";

    @Autowired
    private ICcCallPhoneService ccCallPhoneService;

    @RequiresPermissions("aicall:callPhone:view")
    @GetMapping()
    public String callPhone()
    {
        return prefix + "/callPhone";
    }

    /**
     * 查询外呼号码列表
     */
    @RequiresPermissions("aicall:callPhone:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(CcCallPhone ccCallPhone)
    {
        startPage();
        List<CcCallPhone> list = ccCallPhoneService.selectCcCallPhoneList(ccCallPhone);
        TableDataInfo tableDataInfo = getDataTable(list);
        return tableDataInfo;
    }

    /**
     * 导出外呼号码列表
     */
    @RequiresPermissions("aicall:callPhone:export")
    @Log(title = "外呼号码", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(CcCallPhone ccCallPhone)
    {
        List<CcCallPhone> list = ccCallPhoneService.selectCcCallPhoneList(ccCallPhone);
        ExcelUtil<CcCallPhone> util = new ExcelUtil<CcCallPhone>(CcCallPhone.class);
        return util.exportExcel(list, "外呼号码数据");
    }

    /**
     * 新增外呼号码
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存外呼号码
     */
    @RequiresPermissions("aicall:callPhone:add")
    @Log(title = "外呼号码", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(CcCallPhone ccCallPhone)
    {
        return toAjax(ccCallPhoneService.insertCcCallPhone(ccCallPhone));
    }

    /**
     * 修改外呼号码
     */
    @RequiresPermissions("aicall:callPhone:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") String id, ModelMap mmap)
    {
        CcCallPhone ccCallPhone = ccCallPhoneService.selectCcCallPhoneById(id);
        mmap.put("ccCallPhone", ccCallPhone);
        return prefix + "/edit";
    }

    /**
     * 修改保存外呼号码
     */
    @RequiresPermissions("aicall:callPhone:edit")
    @Log(title = "外呼号码", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(CcCallPhone ccCallPhone)
    {
        return toAjax(ccCallPhoneService.updateCcCallPhone(ccCallPhone));
    }

    /**
     * 删除外呼号码
     */
    @RequiresPermissions("aicall:callPhone:remove")
    @Log(title = "外呼号码", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(ccCallPhoneService.deleteCcCallPhoneByIds(ids));
    }
}
