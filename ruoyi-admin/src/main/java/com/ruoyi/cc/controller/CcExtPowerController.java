package com.ruoyi.cc.controller;

import java.util.*;

import com.ruoyi.cc.domain.CcBizGroup;
import com.ruoyi.cc.domain.CcExtNum;
import com.ruoyi.cc.service.ICcBizGroupService;
import com.ruoyi.cc.service.ICcExtNumService;
import com.ruoyi.common.utils.StringUtils;
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
import com.ruoyi.cc.domain.CcExtPower;
import com.ruoyi.cc.service.ICcExtPowerService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 该定义了分机权限。可以管理哪些业务组的分机，比如监听、语音指导、im消息等。Controller
 *
 * @author ruoyi
 * @date 2024-12-22
 */
@Controller
@RequestMapping("/cc/extpower")
public class CcExtPowerController extends BaseController
{
    private String prefix = "cc/extpower";

    @Autowired
    private ICcExtPowerService ccExtPowerService;
    @Autowired
    private ICcBizGroupService ccBizGroupService;
    @Autowired
    private ICcExtNumService ccExtNumService;

    @RequiresPermissions("cc:extpower:view")
    @GetMapping()
    public String power()
    {
        return prefix + "/extpower";
    }

    /**
     * 查询该定义了分机权限。可以管理哪些业务组的分机，比如监听、语音指导、im消息等。列表
     */
    @RequiresPermissions("cc:extpower:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(CcExtPower ccExtPower)
    {
        startPage();
        List<CcExtPower> list = ccExtPowerService.selectCcExtPowerList(ccExtPower);
        List<CcBizGroup> bizGroups = ccBizGroupService.selectCcBizGroupList(new CcBizGroup());
        Map<String, String> bizGroupMap = new HashMap<>();
        for (CcBizGroup bizGroup: bizGroups) {
            bizGroupMap.put(bizGroup.getGroupId().toString(), bizGroup.getBizGroupName());
        }
        for (CcExtPower extPower: list) {
            List<String> groupNames = new ArrayList<>();
            for (String groupId: extPower.getGroupId().split(",")) {
                groupNames.add(bizGroupMap.getOrDefault(groupId, ""));
            }
            extPower.setGroupName(StringUtils.joinWith(",", groupNames.toArray()));
        }
        return getDataTable(list);
    }

    /**
     * 导出该定义了分机权限。可以管理哪些业务组的分机，比如监听、语音指导、im消息等。列表
     */
    @RequiresPermissions("cc:extpower:export")
    @Log(title = "该定义了分机权限。可以管理哪些业务组的分机，比如监听、语音指导、im消息等。", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(CcExtPower ccExtPower)
    {
        List<CcExtPower> list = ccExtPowerService.selectCcExtPowerList(ccExtPower);
        ExcelUtil<CcExtPower> util = new ExcelUtil<CcExtPower>(CcExtPower.class);
        return util.exportExcel(list, "该定义了分机权限。可以管理哪些业务组的分机，比如监听、语音指导、im消息等。数据");
    }

    /**
     * 新增该定义了分机权限。可以管理哪些业务组的分机，比如监听、语音指导、im消息等。
     */
    @GetMapping("/add")
    public String add(ModelMap mmap)
    {
        List<CcBizGroup> bizGroups = ccBizGroupService.selectCcBizGroupList(new CcBizGroup());
        mmap.put("bizGroups", bizGroups);
        return prefix + "/add";
    }

    /**
     * 新增保存该定义了分机权限。可以管理哪些业务组的分机，比如监听、语音指导、im消息等。
     */
    @RequiresPermissions("cc:extpower:add")
    @Log(title = "该定义了分机权限。可以管理哪些业务组的分机，比如监听、语音指导、im消息等。", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(CcExtPower ccExtPower)
    {
        CcExtPower checkExtNum = ccExtPowerService.selectCcExtPowerByExtNum(ccExtPower.getExtNum());
        if (null != checkExtNum) {
            return AjaxResult.error("分机号" + checkExtNum.getExtNum() + "已配置请勿重复配置！");
        }
        CcExtNum ccExtNum = ccExtNumService.selectCcExtNumByExtNum(Long.valueOf(ccExtPower.getExtNum()));
        if (null == ccExtNum) {
            if (null != checkExtNum) {
                return AjaxResult.error("分机号" + checkExtNum.getExtNum() + "不存在，请先添加分机号！");
            }
        }
        ccExtPower.setGroupId(StringUtils.joinWith(",", ccExtPower.getGroupIds()));
        return toAjax(ccExtPowerService.insertCcExtPower(ccExtPower));
    }

    /**
     * 修改该定义了分机权限。可以管理哪些业务组的分机，比如监听、语音指导、im消息等。
     */
    @RequiresPermissions("cc:extpower:edit")
    @GetMapping("/edit/{powerId}")
    public String edit(@PathVariable("powerId") Long powerId, ModelMap mmap)
    {
        List<CcBizGroup> bizGroups = ccBizGroupService.selectCcBizGroupList(new CcBizGroup());
        CcExtPower ccExtPower = ccExtPowerService.selectCcExtPowerByPowerId(powerId);
        for (CcBizGroup bizGroup: bizGroups) {
            if (Arrays.asList(ccExtPower.getGroupId().split(",")).contains(bizGroup.getGroupId().toString())) {
                bizGroup.setFlag(true);
            }
        }
        mmap.put("ccExtPower", ccExtPower);
        mmap.put("bizGroups", bizGroups);
        return prefix + "/edit";
    }

    /**
     * 修改保存该定义了分机权限。可以管理哪些业务组的分机，比如监听、语音指导、im消息等。
     */
    @RequiresPermissions("cc:extpower:edit")
    @Log(title = "该定义了分机权限。可以管理哪些业务组的分机，比如监听、语音指导、im消息等。", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(CcExtPower ccExtPower)
    {
        ccExtPower.setGroupId(StringUtils.joinWith(",", ccExtPower.getGroupIds()));
        return toAjax(ccExtPowerService.updateCcExtPower(ccExtPower));
    }

    /**
     * 删除该定义了分机权限。可以管理哪些业务组的分机，比如监听、语音指导、im消息等。
     */
    @RequiresPermissions("cc:extpower:remove")
    @Log(title = "该定义了分机权限。可以管理哪些业务组的分机，比如监听、语音指导、im消息等。", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(ccExtPowerService.deleteCcExtPowerByPowerIds(ids));
    }
}
