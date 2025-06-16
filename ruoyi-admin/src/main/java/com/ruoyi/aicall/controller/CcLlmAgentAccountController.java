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
import com.ruoyi.aicall.domain.CcLlmAgentAccount;
import com.ruoyi.aicall.service.ICcLlmAgentAccountService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 机器人参数配置Controller
 * 
 * @author ruoyi
 * @date 2025-06-16
 */
@Controller
@RequestMapping("/aicall/account")
public class CcLlmAgentAccountController extends BaseController
{
    private String prefix = "aicall/account";

    @Autowired
    private ICcLlmAgentAccountService ccLlmAgentAccountService;

    @RequiresPermissions("aicall:account:view")
    @GetMapping()
    public String account()
    {
        return prefix + "/account";
    }

    /**
     * 查询机器人参数配置列表
     */
    @RequiresPermissions("aicall:account:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(CcLlmAgentAccount ccLlmAgentAccount)
    {
        startPage();
        List<CcLlmAgentAccount> list = ccLlmAgentAccountService.selectCcLlmAgentAccountList(ccLlmAgentAccount);
        return getDataTable(list);
    }

    /**
     * 导出机器人参数配置列表
     */
    @RequiresPermissions("aicall:account:export")
    @Log(title = "机器人参数配置", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(CcLlmAgentAccount ccLlmAgentAccount)
    {
        List<CcLlmAgentAccount> list = ccLlmAgentAccountService.selectCcLlmAgentAccountList(ccLlmAgentAccount);
        ExcelUtil<CcLlmAgentAccount> util = new ExcelUtil<CcLlmAgentAccount>(CcLlmAgentAccount.class);
        return util.exportExcel(list, "机器人参数配置数据");
    }

    /**
     * 新增机器人参数配置
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存机器人参数配置
     */
    @RequiresPermissions("aicall:account:add")
    @Log(title = "机器人参数配置", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(CcLlmAgentAccount ccLlmAgentAccount)
    {
        return toAjax(ccLlmAgentAccountService.insertCcLlmAgentAccount(ccLlmAgentAccount));
    }

    /**
     * 修改机器人参数配置
     */
    @RequiresPermissions("aicall:account:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Integer id, ModelMap mmap)
    {
        CcLlmAgentAccount ccLlmAgentAccount = ccLlmAgentAccountService.selectCcLlmAgentAccountById(id);
        mmap.put("ccLlmAgentAccount", ccLlmAgentAccount);
        return prefix + "/edit";
    }

    /**
     * 修改保存机器人参数配置
     */
    @RequiresPermissions("aicall:account:edit")
    @Log(title = "机器人参数配置", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(CcLlmAgentAccount ccLlmAgentAccount)
    {
        return toAjax(ccLlmAgentAccountService.updateCcLlmAgentAccount(ccLlmAgentAccount));
    }

    /**
     * 删除机器人参数配置
     */
    @RequiresPermissions("aicall:account:remove")
    @Log(title = "机器人参数配置", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(ccLlmAgentAccountService.deleteCcLlmAgentAccountByIds(ids));
    }
}
