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
import com.ruoyi.aicall.domain.CcLlmAgentProvider;
import com.ruoyi.aicall.service.ICcLlmAgentProviderService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 大模型实现类列表Controller
 * 
 * @author ruoyi
 * @date 2025-06-16
 */
@Controller
@RequestMapping("/aicall/provider")
public class CcLlmAgentProviderController extends BaseController
{
    private String prefix = "aicall/provider";

    @Autowired
    private ICcLlmAgentProviderService ccLlmAgentProviderService;

    @RequiresPermissions("aicall:provider:view")
    @GetMapping()
    public String provider()
    {
        return prefix + "/provider";
    }

    /**
     * 查询大模型实现类列表列表
     */
    @RequiresPermissions("aicall:provider:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(CcLlmAgentProvider ccLlmAgentProvider)
    {
        startPage();
        List<CcLlmAgentProvider> list = ccLlmAgentProviderService.selectCcLlmAgentProviderList(ccLlmAgentProvider);
        return getDataTable(list);
    }

    /**
     * 导出大模型实现类列表列表
     */
    @RequiresPermissions("aicall:provider:export")
    @Log(title = "大模型实现类列表", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(CcLlmAgentProvider ccLlmAgentProvider)
    {
        List<CcLlmAgentProvider> list = ccLlmAgentProviderService.selectCcLlmAgentProviderList(ccLlmAgentProvider);
        ExcelUtil<CcLlmAgentProvider> util = new ExcelUtil<CcLlmAgentProvider>(CcLlmAgentProvider.class);
        return util.exportExcel(list, "大模型实现类列表数据");
    }

    /**
     * 新增大模型实现类列表
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存大模型实现类列表
     */
    @RequiresPermissions("aicall:provider:add")
    @Log(title = "大模型实现类列表", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(CcLlmAgentProvider ccLlmAgentProvider)
    {
        return toAjax(ccLlmAgentProviderService.insertCcLlmAgentProvider(ccLlmAgentProvider));
    }

    /**
     * 修改大模型实现类列表
     */
    @RequiresPermissions("aicall:provider:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Integer id, ModelMap mmap)
    {
        CcLlmAgentProvider ccLlmAgentProvider = ccLlmAgentProviderService.selectCcLlmAgentProviderById(id);
        mmap.put("ccLlmAgentProvider", ccLlmAgentProvider);
        return prefix + "/edit";
    }

    /**
     * 修改保存大模型实现类列表
     */
    @RequiresPermissions("aicall:provider:edit")
    @Log(title = "大模型实现类列表", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(CcLlmAgentProvider ccLlmAgentProvider)
    {
        return toAjax(ccLlmAgentProviderService.updateCcLlmAgentProvider(ccLlmAgentProvider));
    }

    /**
     * 删除大模型实现类列表
     */
    @RequiresPermissions("aicall:provider:remove")
    @Log(title = "大模型实现类列表", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(ccLlmAgentProviderService.deleteCcLlmAgentProviderByIds(ids));
    }
}
