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
//import com.ruoyi.cc.domain.CcConferenceMembers;
//import com.ruoyi.cc.service.ICcConferenceMembersService;
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
//@RequestMapping("/cc/members")
//public class CcConferenceMembersController extends BaseController
//{
//    private String prefix = "system/members";
//
//    @Autowired
//    private ICcConferenceMembersService ccConferenceMembersService;
//
//    @RequiresPermissions("system:members:view")
//    @GetMapping()
//    public String members()
//    {
//        return prefix + "/members";
//    }
//
//    /**
//     * 查询【请填写功能名称】列表
//     */
//    @RequiresPermissions("system:members:list")
//    @PostMapping("/list")
//    @ResponseBody
//    public TableDataInfo list(CcConferenceMembers ccConferenceMembers)
//    {
//        startPage();
//        List<CcConferenceMembers> list = ccConferenceMembersService.selectCcConferenceMembersList(ccConferenceMembers);
//        return getDataTable(list);
//    }
//
//    /**
//     * 导出【请填写功能名称】列表
//     */
//    @RequiresPermissions("system:members:export")
//    @Log(title = "【请填写功能名称】", businessType = BusinessType.EXPORT)
//    @PostMapping("/export")
//    @ResponseBody
//    public AjaxResult export(CcConferenceMembers ccConferenceMembers)
//    {
//        List<CcConferenceMembers> list = ccConferenceMembersService.selectCcConferenceMembersList(ccConferenceMembers);
//        ExcelUtil<CcConferenceMembers> util = new ExcelUtil<CcConferenceMembers>(CcConferenceMembers.class);
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
//    @RequiresPermissions("system:members:add")
//    @Log(title = "【请填写功能名称】", businessType = BusinessType.INSERT)
//    @PostMapping("/add")
//    @ResponseBody
//    public AjaxResult addSave(CcConferenceMembers ccConferenceMembers)
//    {
//        return toAjax(ccConferenceMembersService.insertCcConferenceMembers(ccConferenceMembers));
//    }
//
//    /**
//     * 修改【请填写功能名称】
//     */
//    @RequiresPermissions("system:members:edit")
//    @GetMapping("/edit/{id}")
//    public String edit(@PathVariable("id") String id, ModelMap mmap)
//    {
//        CcConferenceMembers ccConferenceMembers = ccConferenceMembersService.selectCcConferenceMembersById(id);
//        mmap.put("ccConferenceMembers", ccConferenceMembers);
//        return prefix + "/edit";
//    }
//
//    /**
//     * 修改保存【请填写功能名称】
//     */
//    @RequiresPermissions("system:members:edit")
//    @Log(title = "【请填写功能名称】", businessType = BusinessType.UPDATE)
//    @PostMapping("/edit")
//    @ResponseBody
//    public AjaxResult editSave(CcConferenceMembers ccConferenceMembers)
//    {
//        return toAjax(ccConferenceMembersService.updateCcConferenceMembers(ccConferenceMembers));
//    }
//
//    /**
//     * 删除【请填写功能名称】
//     */
//    @RequiresPermissions("system:members:remove")
//    @Log(title = "【请填写功能名称】", businessType = BusinessType.DELETE)
//    @PostMapping( "/remove")
//    @ResponseBody
//    public AjaxResult remove(String ids)
//    {
//        return toAjax(ccConferenceMembersService.deleteCcConferenceMembersByIds(ids));
//    }
//}
