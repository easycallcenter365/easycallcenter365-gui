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
//import com.ruoyi.cc.domain.CcConferenceList;
//import com.ruoyi.cc.service.ICcConferenceListService;
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
//@RequestMapping("/cc/list")
//public class CcConferenceListController extends BaseController
//{
//    private String prefix = "system/list";
//
//    @Autowired
//    private ICcConferenceListService ccConferenceListService;
//
//    @RequiresPermissions("system:list:view")
//    @GetMapping()
//    public String list()
//    {
//        return prefix + "/list";
//    }
//
//    /**
//     * 查询【请填写功能名称】列表
//     */
//    @RequiresPermissions("system:list:list")
//    @PostMapping("/list")
//    @ResponseBody
//    public TableDataInfo list(CcConferenceList ccConferenceList)
//    {
//        startPage();
//        List<CcConferenceList> list = ccConferenceListService.selectCcConferenceListList(ccConferenceList);
//        return getDataTable(list);
//    }
//
//    /**
//     * 导出【请填写功能名称】列表
//     */
//    @RequiresPermissions("system:list:export")
//    @Log(title = "【请填写功能名称】", businessType = BusinessType.EXPORT)
//    @PostMapping("/export")
//    @ResponseBody
//    public AjaxResult export(CcConferenceList ccConferenceList)
//    {
//        List<CcConferenceList> list = ccConferenceListService.selectCcConferenceListList(ccConferenceList);
//        ExcelUtil<CcConferenceList> util = new ExcelUtil<CcConferenceList>(CcConferenceList.class);
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
//    @RequiresPermissions("system:list:add")
//    @Log(title = "【请填写功能名称】", businessType = BusinessType.INSERT)
//    @PostMapping("/add")
//    @ResponseBody
//    public AjaxResult addSave(CcConferenceList ccConferenceList)
//    {
//        return toAjax(ccConferenceListService.insertCcConferenceList(ccConferenceList));
//    }
//
//    /**
//     * 修改【请填写功能名称】
//     */
//    @RequiresPermissions("system:list:edit")
//    @GetMapping("/edit/{id}")
//    public String edit(@PathVariable("id") Long id, ModelMap mmap)
//    {
//        CcConferenceList ccConferenceList = ccConferenceListService.selectCcConferenceListById(id);
//        mmap.put("ccConferenceList", ccConferenceList);
//        return prefix + "/edit";
//    }
//
//    /**
//     * 修改保存【请填写功能名称】
//     */
//    @RequiresPermissions("system:list:edit")
//    @Log(title = "【请填写功能名称】", businessType = BusinessType.UPDATE)
//    @PostMapping("/edit")
//    @ResponseBody
//    public AjaxResult editSave(CcConferenceList ccConferenceList)
//    {
//        return toAjax(ccConferenceListService.updateCcConferenceList(ccConferenceList));
//    }
//
//    /**
//     * 删除【请填写功能名称】
//     */
//    @RequiresPermissions("system:list:remove")
//    @Log(title = "【请填写功能名称】", businessType = BusinessType.DELETE)
//    @PostMapping( "/remove")
//    @ResponseBody
//    public AjaxResult remove(String ids)
//    {
//        return toAjax(ccConferenceListService.deleteCcConferenceListByIds(ids));
//    }
//}
