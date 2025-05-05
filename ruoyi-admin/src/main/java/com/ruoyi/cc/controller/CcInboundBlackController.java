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
//import com.ruoyi.cc.domain.CcInboundBlack;
//import com.ruoyi.cc.service.ICcInboundBlackService;
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
//@RequestMapping("/cc/black")
//public class CcInboundBlackController extends BaseController
//{
//    private String prefix = "system/black";
//
//    @Autowired
//    private ICcInboundBlackService ccInboundBlackService;
//
//    @RequiresPermissions("system:black:view")
//    @GetMapping()
//    public String black()
//    {
//        return prefix + "/black";
//    }
//
//    /**
//     * 查询【请填写功能名称】列表
//     */
//    @RequiresPermissions("system:black:list")
//    @PostMapping("/list")
//    @ResponseBody
//    public TableDataInfo list(CcInboundBlack ccInboundBlack)
//    {
//        startPage();
//        List<CcInboundBlack> list = ccInboundBlackService.selectCcInboundBlackList(ccInboundBlack);
//        return getDataTable(list);
//    }
//
//    /**
//     * 导出【请填写功能名称】列表
//     */
//    @RequiresPermissions("system:black:export")
//    @Log(title = "【请填写功能名称】", businessType = BusinessType.EXPORT)
//    @PostMapping("/export")
//    @ResponseBody
//    public AjaxResult export(CcInboundBlack ccInboundBlack)
//    {
//        List<CcInboundBlack> list = ccInboundBlackService.selectCcInboundBlackList(ccInboundBlack);
//        ExcelUtil<CcInboundBlack> util = new ExcelUtil<CcInboundBlack>(CcInboundBlack.class);
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
//    @RequiresPermissions("system:black:add")
//    @Log(title = "【请填写功能名称】", businessType = BusinessType.INSERT)
//    @PostMapping("/add")
//    @ResponseBody
//    public AjaxResult addSave(CcInboundBlack ccInboundBlack)
//    {
//        return toAjax(ccInboundBlackService.insertCcInboundBlack(ccInboundBlack));
//    }
//
//    /**
//     * 修改【请填写功能名称】
//     */
//    @RequiresPermissions("system:black:edit")
//    @GetMapping("/edit/{id}")
//    public String edit(@PathVariable("id") Long id, ModelMap mmap)
//    {
//        CcInboundBlack ccInboundBlack = ccInboundBlackService.selectCcInboundBlackById(id);
//        mmap.put("ccInboundBlack", ccInboundBlack);
//        return prefix + "/edit";
//    }
//
//    /**
//     * 修改保存【请填写功能名称】
//     */
//    @RequiresPermissions("system:black:edit")
//    @Log(title = "【请填写功能名称】", businessType = BusinessType.UPDATE)
//    @PostMapping("/edit")
//    @ResponseBody
//    public AjaxResult editSave(CcInboundBlack ccInboundBlack)
//    {
//        return toAjax(ccInboundBlackService.updateCcInboundBlack(ccInboundBlack));
//    }
//
//    /**
//     * 删除【请填写功能名称】
//     */
//    @RequiresPermissions("system:black:remove")
//    @Log(title = "【请填写功能名称】", businessType = BusinessType.DELETE)
//    @PostMapping( "/remove")
//    @ResponseBody
//    public AjaxResult remove(String ids)
//    {
//        return toAjax(ccInboundBlackService.deleteCcInboundBlackByIds(ids));
//    }
//}
