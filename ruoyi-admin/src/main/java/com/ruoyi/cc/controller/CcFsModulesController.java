//package com.ruoyi.cc.controller;
//
//import java.util.List;
//import org.apache.shiro.authz.annotation.RequiresPermissions;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.ModelMap;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.ResponseBody;
//import com.ruoyi.common.annotation.Log;
//import com.ruoyi.common.enums.BusinessType;
//import com.ruoyi.cc.domain.CcFsModules;
//import com.ruoyi.cc.service.ICcFsModulesService;
//import com.ruoyi.common.core.controller.BaseController;
//import com.ruoyi.common.core.domain.AjaxResult;
//import com.ruoyi.common.utils.poi.ExcelUtil;
//import com.ruoyi.common.core.page.TableDataInfo;
//
///**
// * 【请填写功能名称】Controller
// *
// * @author ruoyi
// * @date 2024-12-22
// */
//@Controller
//@RequestMapping("/cc/modules")
//public class CcFsModulesController extends BaseController
//{
//    private String prefix = "system/modules";
//
//    @Autowired
//    private ICcFsModulesService ccFsModulesService;
//
//    @RequiresPermissions("system:modules:view")
//    @GetMapping()
//    public String modules()
//    {
//        return prefix + "/modules";
//    }
//
//    /**
//     * 查询【请填写功能名称】列表
//     */
//    @RequiresPermissions("system:modules:list")
//    @PostMapping("/list")
//    @ResponseBody
//    public TableDataInfo list(CcFsModules ccFsModules)
//    {
//        startPage();
//        List<CcFsModules> list = ccFsModulesService.selectCcFsModulesList(ccFsModules);
//        return getDataTable(list);
//    }
//
//    /**
//     * 导出【请填写功能名称】列表
//     */
//    @RequiresPermissions("system:modules:export")
//    @Log(title = "【请填写功能名称】", businessType = BusinessType.EXPORT)
//    @PostMapping("/export")
//    @ResponseBody
//    public AjaxResult export(CcFsModules ccFsModules)
//    {
//        List<CcFsModules> list = ccFsModulesService.selectCcFsModulesList(ccFsModules);
//        ExcelUtil<CcFsModules> util = new ExcelUtil<CcFsModules>(CcFsModules.class);
//        return util.exportExcel(list, "【请填写功能名称】数据");
//    }
//
//    /**
//     * 新增【请填写功能名称】
//     */
//    @GetMapping("/add")
//    public String add()
//    {
//        return prefix + "/add";
//    }
//
//    /**
//     * 新增保存【请填写功能名称】
//     */
//    @RequiresPermissions("system:modules:add")
//    @Log(title = "【请填写功能名称】", businessType = BusinessType.INSERT)
//    @PostMapping("/add")
//    @ResponseBody
//    public AjaxResult addSave(CcFsModules ccFsModules)
//    {
//        return toAjax(ccFsModulesService.insertCcFsModules(ccFsModules));
//    }
//
//    /**
//     * 修改【请填写功能名称】
//     */
//    @RequiresPermissions("system:modules:edit")
//    @GetMapping("/edit/{id}")
//    public String edit(@PathVariable("id") Long id, ModelMap mmap)
//    {
//        CcFsModules ccFsModules = ccFsModulesService.selectCcFsModulesById(id);
//        mmap.put("ccFsModules", ccFsModules);
//        return prefix + "/edit";
//    }
//
//    /**
//     * 修改保存【请填写功能名称】
//     */
//    @RequiresPermissions("system:modules:edit")
//    @Log(title = "【请填写功能名称】", businessType = BusinessType.UPDATE)
//    @PostMapping("/edit")
//    @ResponseBody
//    public AjaxResult editSave(CcFsModules ccFsModules)
//    {
//        return toAjax(ccFsModulesService.updateCcFsModules(ccFsModules));
//    }
//
//    /**
//     * 删除【请填写功能名称】
//     */
//    @RequiresPermissions("system:modules:remove")
//    @Log(title = "【请填写功能名称】", businessType = BusinessType.DELETE)
//    @PostMapping( "/remove")
//    @ResponseBody
//    public AjaxResult remove(String ids)
//    {
//        return toAjax(ccFsModulesService.deleteCcFsModulesByIds(ids));
//    }
//}
