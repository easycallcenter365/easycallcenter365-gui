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
//import com.ruoyi.cc.domain.CcAgentOnline;
//import com.ruoyi.cc.service.ICcAgentOnlineService;
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
//@RequestMapping("/cc/online")
//public class CcAgentOnlineController extends BaseController
//{
//    private String prefix = "system/online";
//
//    @Autowired
//    private ICcAgentOnlineService ccAgentOnlineService;
//
//    @RequiresPermissions("system:online:view")
//    @GetMapping()
//    public String online()
//    {
//        return prefix + "/online";
//    }
//
//    /**
//     * 查询【请填写功能名称】列表
//     */
//    @RequiresPermissions("system:online:list")
//    @PostMapping("/list")
//    @ResponseBody
//    public TableDataInfo list(CcAgentOnline ccAgentOnline)
//    {
//        startPage();
//        List<CcAgentOnline> list = ccAgentOnlineService.selectCcAgentOnlineList(ccAgentOnline);
//        return getDataTable(list);
//    }
//
//    /**
//     * 导出【请填写功能名称】列表
//     */
//    @RequiresPermissions("system:online:export")
//    @Log(title = "【请填写功能名称】", businessType = BusinessType.EXPORT)
//    @PostMapping("/export")
//    @ResponseBody
//    public AjaxResult export(CcAgentOnline ccAgentOnline)
//    {
//        List<CcAgentOnline> list = ccAgentOnlineService.selectCcAgentOnlineList(ccAgentOnline);
//        ExcelUtil<CcAgentOnline> util = new ExcelUtil<CcAgentOnline>(CcAgentOnline.class);
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
//    @RequiresPermissions("system:online:add")
//    @Log(title = "【请填写功能名称】", businessType = BusinessType.INSERT)
//    @PostMapping("/add")
//    @ResponseBody
//    public AjaxResult addSave(CcAgentOnline ccAgentOnline)
//    {
//        return toAjax(ccAgentOnlineService.insertCcAgentOnline(ccAgentOnline));
//    }
//
//    /**
//     * 修改【请填写功能名称】
//     */
//    @RequiresPermissions("system:online:edit")
//    @GetMapping("/edit/{id}")
//    public String edit(@PathVariable("id") String id, ModelMap mmap)
//    {
//        CcAgentOnline ccAgentOnline = ccAgentOnlineService.selectCcAgentOnlineById(id);
//        mmap.put("ccAgentOnline", ccAgentOnline);
//        return prefix + "/edit";
//    }
//
//    /**
//     * 修改保存【请填写功能名称】
//     */
//    @RequiresPermissions("system:online:edit")
//    @Log(title = "【请填写功能名称】", businessType = BusinessType.UPDATE)
//    @PostMapping("/edit")
//    @ResponseBody
//    public AjaxResult editSave(CcAgentOnline ccAgentOnline)
//    {
//        return toAjax(ccAgentOnlineService.updateCcAgentOnline(ccAgentOnline));
//    }
//
//    /**
//     * 删除【请填写功能名称】
//     */
//    @RequiresPermissions("system:online:remove")
//    @Log(title = "【请填写功能名称】", businessType = BusinessType.DELETE)
//    @PostMapping( "/remove")
//    @ResponseBody
//    public AjaxResult remove(String ids)
//    {
//        return toAjax(ccAgentOnlineService.deleteCcAgentOnlineByIds(ids));
//    }
//}
