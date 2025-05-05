package com.ruoyi.cc.controller;

import java.util.List;

import com.ruoyi.cc.domain.CcParams;
import com.ruoyi.cc.service.ICcParamsService;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.http.HttpUtils;
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
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * callcenter参数配置Controller
 * 
 * @author ruoyi
 * @date 2025-04-21
 */
@Controller
@RequestMapping("/system/params")
public class CcParamsController extends BaseController
{
    private String prefix = "system/params";

    @Autowired
    private ICcParamsService ccParamsService;

    @RequiresPermissions("system:params:view")
    @GetMapping()
    public String params()
    {
        return prefix + "/params";
    }

    /**
     * 查询callcenter参数配置列表
     */
    @RequiresPermissions("system:params:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(CcParams ccParams)
    {
        startPage();
        List<CcParams> list = ccParamsService.selectCcParamsList(ccParams);
        return getDataTable(list);
    }

    /**
     * 导出callcenter参数配置列表
     */
    @RequiresPermissions("system:params:export")
    @Log(title = "callcenter参数配置", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(CcParams ccParams)
    {
        List<CcParams> list = ccParamsService.selectCcParamsList(ccParams);
        ExcelUtil<CcParams> util = new ExcelUtil<CcParams>(CcParams.class);
        return util.exportExcel(list, "callcenter参数配置数据");
    }

    /**
     * 新增callcenter参数配置
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存callcenter参数配置
     */
    @RequiresPermissions("system:params:add")
    @Log(title = "callcenter参数配置", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(CcParams ccParams)
    {
        return toAjax(ccParamsService.insertCcParams(ccParams));
    }

    /**
     * 修改callcenter参数配置
     */
    @RequiresPermissions("system:params:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        CcParams ccParams = ccParamsService.selectCcParamsById(id);
        mmap.put("ccParams", ccParams);
        return prefix + "/edit";
    }

    /**
     * 修改保存callcenter参数配置
     */
    @RequiresPermissions("system:params:edit")
    @Log(title = "callcenter参数配置", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(CcParams ccParams)
    {
        AjaxResult result = toAjax(ccParamsService.updateCcParams(ccParams));

        // Access the 'reloadParams' webapi interface to make the parameters take effect;
        String serverPort = ccParamsService.getParamValueByCode(
                "call-center-server-port", "");
        if(!StringUtils.isEmpty(serverPort)){
            String reloadParamsUrl = String.format("http://127.0.0.1:%s/call-center/reloadParams", serverPort);
            String response = HttpUtils.sendGet(reloadParamsUrl);
            if(!response.equalsIgnoreCase("success")){
               return error("参数修改成功, 但是刷新失败, 请手动重启 call-center!");
            }
        }

        return result;
    }

    /**
     * 删除callcenter参数配置
     */
    @RequiresPermissions("system:params:remove")
    @Log(title = "callcenter参数配置", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        //禁止删除参数表的记录，避免引起混乱;
        return  error("Forbidden.");
        //return toAjax(ccParamsService.deleteCcParamsByIds(ids));
    }
}
