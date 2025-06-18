package com.ruoyi.cc.controller;

import java.util.Date;
import java.util.List;

import com.ruoyi.aicall.domain.CcTtsAliyun;
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
import com.ruoyi.cc.domain.CcBizGroup;
import com.ruoyi.cc.service.ICcBizGroupService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 业务分组Controller
 *
 * @author ruoyi
 * @date 2024-12-22
 */
@Controller
@RequestMapping("/cc/bizgroup")
public class CcBizGroupController extends BaseController
{
    private String prefix = "cc/bizgroup";

    @Autowired
    private ICcBizGroupService ccBizGroupService;

    @RequiresPermissions("cc:bizgroup:view")
    @GetMapping()
    public String group()
    {
        return prefix + "/bizgroup";
    }

    /**
     * 查询业务分组列表
     */
    @RequiresPermissions("cc:bizgroup:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(CcBizGroup ccBizGroup)
    {
        startPage();
        List<CcBizGroup> list = ccBizGroupService.selectCcBizGroupList(ccBizGroup);
        return getDataTable(list);
    }

    /**
     * 导出业务分组列表
     */
    @RequiresPermissions("cc:bizgroup:export")
    @Log(title = "业务分组", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(CcBizGroup ccBizGroup)
    {
        List<CcBizGroup> list = ccBizGroupService.selectCcBizGroupList(ccBizGroup);
        ExcelUtil<CcBizGroup> util = new ExcelUtil<CcBizGroup>(CcBizGroup.class);
        return util.exportExcel(list, "业务分组数据");
    }

    /**
     * 新增业务分组
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存业务分组
     */
    @RequiresPermissions("cc:bizgroup:add")
    @Log(title = "业务分组", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(CcBizGroup ccBizGroup)
    {
        ccBizGroup.setCreateTime(new Date());
        return toAjax(ccBizGroupService.insertCcBizGroup(ccBizGroup));
    }

    /**
     * 修改业务分组
     */
    @RequiresPermissions("cc:bizgroup:edit")
    @GetMapping("/edit/{groupId}")
    public String edit(@PathVariable("groupId") String groupId, ModelMap mmap)
    {
        CcBizGroup ccBizGroup = ccBizGroupService.selectCcBizGroupByGroupId(groupId);
        mmap.put("ccBizGroup", ccBizGroup);
        return prefix + "/edit";
    }

    /**
     * 修改保存业务分组
     */
    @RequiresPermissions("cc:bizgroup:edit")
    @Log(title = "业务分组", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(CcBizGroup ccBizGroup)
    {
        return toAjax(ccBizGroupService.updateCcBizGroup(ccBizGroup));
    }

    /**
     * 删除业务分组
     */
    @RequiresPermissions("cc:bizgroup:remove")
    @Log(title = "业务分组", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(ccBizGroupService.deleteCcBizGroupByGroupIds(ids));
    }


    /**
     * 查询全部业务组列表
     */
    @GetMapping("/all")
    @ResponseBody
    public AjaxResult all()
    {
        List<CcBizGroup> list = ccBizGroupService.selectCcBizGroupList(new CcBizGroup());
        return AjaxResult.success(list);
    }
}
