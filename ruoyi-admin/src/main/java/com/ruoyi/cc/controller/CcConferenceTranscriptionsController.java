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
//import com.ruoyi.cc.domain.CcConferenceTranscriptions;
//import com.ruoyi.cc.service.ICcConferenceTranscriptionsService;
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
//@RequestMapping("/cc/transcriptions")
//public class CcConferenceTranscriptionsController extends BaseController
//{
//    private String prefix = "system/transcriptions";
//
//    @Autowired
//    private ICcConferenceTranscriptionsService ccConferenceTranscriptionsService;
//
//    @RequiresPermissions("system:transcriptions:view")
//    @GetMapping()
//    public String transcriptions()
//    {
//        return prefix + "/transcriptions";
//    }
//
//    /**
//     * 查询【请填写功能名称】列表
//     */
//    @RequiresPermissions("system:transcriptions:list")
//    @PostMapping("/list")
//    @ResponseBody
//    public TableDataInfo list(CcConferenceTranscriptions ccConferenceTranscriptions)
//    {
//        startPage();
//        List<CcConferenceTranscriptions> list = ccConferenceTranscriptionsService.selectCcConferenceTranscriptionsList(ccConferenceTranscriptions);
//        return getDataTable(list);
//    }
//
//    /**
//     * 导出【请填写功能名称】列表
//     */
//    @RequiresPermissions("system:transcriptions:export")
//    @Log(title = "【请填写功能名称】", businessType = BusinessType.EXPORT)
//    @PostMapping("/export")
//    @ResponseBody
//    public AjaxResult export(CcConferenceTranscriptions ccConferenceTranscriptions)
//    {
//        List<CcConferenceTranscriptions> list = ccConferenceTranscriptionsService.selectCcConferenceTranscriptionsList(ccConferenceTranscriptions);
//        ExcelUtil<CcConferenceTranscriptions> util = new ExcelUtil<CcConferenceTranscriptions>(CcConferenceTranscriptions.class);
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
//    @RequiresPermissions("system:transcriptions:add")
//    @Log(title = "【请填写功能名称】", businessType = BusinessType.INSERT)
//    @PostMapping("/add")
//    @ResponseBody
//    public AjaxResult addSave(CcConferenceTranscriptions ccConferenceTranscriptions)
//    {
//        return toAjax(ccConferenceTranscriptionsService.insertCcConferenceTranscriptions(ccConferenceTranscriptions));
//    }
//
//    /**
//     * 修改【请填写功能名称】
//     */
//    @RequiresPermissions("system:transcriptions:edit")
//    @GetMapping("/edit/{id}")
//    public String edit(@PathVariable("id") Long id, ModelMap mmap)
//    {
//        CcConferenceTranscriptions ccConferenceTranscriptions = ccConferenceTranscriptionsService.selectCcConferenceTranscriptionsById(id);
//        mmap.put("ccConferenceTranscriptions", ccConferenceTranscriptions);
//        return prefix + "/edit";
//    }
//
//    /**
//     * 修改保存【请填写功能名称】
//     */
//    @RequiresPermissions("system:transcriptions:edit")
//    @Log(title = "【请填写功能名称】", businessType = BusinessType.UPDATE)
//    @PostMapping("/edit")
//    @ResponseBody
//    public AjaxResult editSave(CcConferenceTranscriptions ccConferenceTranscriptions)
//    {
//        return toAjax(ccConferenceTranscriptionsService.updateCcConferenceTranscriptions(ccConferenceTranscriptions));
//    }
//
//    /**
//     * 删除【请填写功能名称】
//     */
//    @RequiresPermissions("system:transcriptions:remove")
//    @Log(title = "【请填写功能名称】", businessType = BusinessType.DELETE)
//    @PostMapping( "/remove")
//    @ResponseBody
//    public AjaxResult remove(String ids)
//    {
//        return toAjax(ccConferenceTranscriptionsService.deleteCcConferenceTranscriptionsByIds(ids));
//    }
//}
