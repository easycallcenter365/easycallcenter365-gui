package com.ruoyi.aicall.controller;

import java.util.List;

import com.ruoyi.aicall.domain.CcLlmAgentAccount;
import com.ruoyi.aicall.service.ICcLlmAgentAccountService;
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
import com.ruoyi.aicall.domain.CcInboundLlmAccount;
import com.ruoyi.aicall.service.ICcInboundLlmAccountService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 呼入大模型配置Controller
 * 
 * @author ruoyi
 * @date 2025-06-23
 */
@Controller
@RequestMapping("/aicall/inboundllm")
public class CcInboundLlmAccountController extends BaseController
{
    private String prefix = "aicall/inboundllm";

    @Autowired
    private ICcInboundLlmAccountService ccInboundLlmAccountService;
    @Autowired
    private ICcLlmAgentAccountService llmAgentAccountService;

    @RequiresPermissions("aicall:inboundllm:view")
    @GetMapping()
    public String inboundllm()
    {
        return prefix + "/inboundllm";
    }

    /**
     * 查询呼入大模型配置列表
     */
    @RequiresPermissions("aicall:inboundllm:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(CcInboundLlmAccount ccInboundLlmAccount)
    {
        startPage();
        List<CcInboundLlmAccount> list = ccInboundLlmAccountService.selectCcInboundLlmAccountList(ccInboundLlmAccount);
        TableDataInfo tableDataInfo = getDataTable(list);
        List<CcInboundLlmAccount> records = (List<CcInboundLlmAccount>) tableDataInfo.getRows();
        for (CcInboundLlmAccount data: records) {
            CcLlmAgentAccount llmAgentAccount = llmAgentAccountService.selectCcLlmAgentAccountById(data.getLlmAccountId());
            data.setLlmAccountName(llmAgentAccount.getName());
        }
        tableDataInfo.setRows(records);
        return tableDataInfo;
    }

    /**
     * 导出呼入大模型配置列表
     */
    @RequiresPermissions("aicall:inboundllm:export")
    @Log(title = "呼入大模型配置", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(CcInboundLlmAccount ccInboundLlmAccount)
    {
        List<CcInboundLlmAccount> list = ccInboundLlmAccountService.selectCcInboundLlmAccountList(ccInboundLlmAccount);
        ExcelUtil<CcInboundLlmAccount> util = new ExcelUtil<CcInboundLlmAccount>(CcInboundLlmAccount.class);
        return util.exportExcel(list, "呼入大模型配置数据");
    }

    /**
     * 新增呼入大模型配置
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存呼入大模型配置
     */
    @RequiresPermissions("aicall:inboundllm:add")
    @Log(title = "呼入大模型配置", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(CcInboundLlmAccount ccInboundLlmAccount)
    {
        return toAjax(ccInboundLlmAccountService.insertCcInboundLlmAccount(ccInboundLlmAccount));
    }

    /**
     * 修改呼入大模型配置
     */
    @RequiresPermissions("aicall:inboundllm:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Integer id, ModelMap mmap)
    {
        CcInboundLlmAccount ccInboundLlmAccount = ccInboundLlmAccountService.selectCcInboundLlmAccountById(id);
        mmap.put("ccInboundLlmAccount", ccInboundLlmAccount);
        return prefix + "/edit";
    }

    /**
     * 修改保存呼入大模型配置
     */
    @RequiresPermissions("aicall:inboundllm:edit")
    @Log(title = "呼入大模型配置", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(CcInboundLlmAccount ccInboundLlmAccount)
    {
        return toAjax(ccInboundLlmAccountService.updateCcInboundLlmAccount(ccInboundLlmAccount));
    }

    /**
     * 删除呼入大模型配置
     */
    @RequiresPermissions("aicall:inboundllm:remove")
    @Log(title = "呼入大模型配置", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(ccInboundLlmAccountService.deleteCcInboundLlmAccountByIds(ids));
    }
}
