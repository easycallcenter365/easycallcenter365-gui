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
import com.ruoyi.aicall.domain.CcTtsAliyun;
import com.ruoyi.aicall.service.ICcTtsAliyunService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 阿里云音色列Controller
 * 
 * @author ruoyi
 * @date 2025-05-29
 */
@Controller
@RequestMapping("/aicall/ttsAliyun")
public class CcTtsAliyunController extends BaseController
{
    private String prefix = "aicall/ttsAliyun";

    @Autowired
    private ICcTtsAliyunService ccTtsAliyunService;

    @RequiresPermissions("aicall:ttsAliyun:view")
    @GetMapping()
    public String ttsAliyun()
    {
        return prefix + "/ttsAliyun";
    }

    /**
     * 查询阿里云音色列列表
     */
    @RequiresPermissions("aicall:ttsAliyun:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(CcTtsAliyun ccTtsAliyun)
    {
        startPage();
        List<CcTtsAliyun> list = ccTtsAliyunService.selectCcTtsAliyunList(ccTtsAliyun);
        return getDataTable(list);
    }

    /**
     * 导出阿里云音色列列表
     */
    @RequiresPermissions("aicall:ttsAliyun:export")
    @Log(title = "阿里云音色列", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(CcTtsAliyun ccTtsAliyun)
    {
        List<CcTtsAliyun> list = ccTtsAliyunService.selectCcTtsAliyunList(ccTtsAliyun);
        ExcelUtil<CcTtsAliyun> util = new ExcelUtil<CcTtsAliyun>(CcTtsAliyun.class);
        return util.exportExcel(list, "阿里云音色列数据");
    }

    /**
     * 新增阿里云音色列
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存阿里云音色列
     */
    @RequiresPermissions("aicall:ttsAliyun:add")
    @Log(title = "阿里云音色列", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(CcTtsAliyun ccTtsAliyun)
    {
        return toAjax(ccTtsAliyunService.insertCcTtsAliyun(ccTtsAliyun));
    }

    /**
     * 修改阿里云音色列
     */
    @RequiresPermissions("aicall:ttsAliyun:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Integer id, ModelMap mmap)
    {
        CcTtsAliyun ccTtsAliyun = ccTtsAliyunService.selectCcTtsAliyunById(id);
        mmap.put("ccTtsAliyun", ccTtsAliyun);
        return prefix + "/edit";
    }

    /**
     * 修改保存阿里云音色列
     */
    @RequiresPermissions("aicall:ttsAliyun:edit")
    @Log(title = "阿里云音色列", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(CcTtsAliyun ccTtsAliyun)
    {
        return toAjax(ccTtsAliyunService.updateCcTtsAliyun(ccTtsAliyun));
    }

    /**
     * 删除阿里云音色列
     */
    @RequiresPermissions("aicall:ttsAliyun:remove")
    @Log(title = "阿里云音色列", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(ccTtsAliyunService.deleteCcTtsAliyunByIds(ids));
    }

    /**
     * 查询阿里云音色列列表
     */
    @GetMapping("/all")
    @ResponseBody
    public AjaxResult all()
    {
        List<CcTtsAliyun> list = ccTtsAliyunService.selectCcTtsAliyunList(new CcTtsAliyun());
        return AjaxResult.success(list);
    }
}
