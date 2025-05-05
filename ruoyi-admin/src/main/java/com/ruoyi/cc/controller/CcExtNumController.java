package com.ruoyi.cc.controller;

import java.util.List;

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
import com.ruoyi.cc.domain.CcExtNum;
import com.ruoyi.cc.service.ICcExtNumService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 分机管理Controller
 *
 * @author ruoyi
 * @date 2024-12-22
 */
@Controller
@RequestMapping("/cc/extnum")
public class CcExtNumController extends BaseController
{
    private String prefix = "cc/extnum";

    @Autowired
    private ICcExtNumService ccExtNumService;

    @RequiresPermissions("cc:extnum:view")
    @GetMapping()
    public String extNum()
    {
        return prefix + "/extnum";
    }

    /**
     * 查询分机管理列表
     */
    @RequiresPermissions("cc:extnum:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(CcExtNum ccExtNum)
    {
        startPage();
        List<CcExtNum> list = ccExtNumService.selectCcExtNumList(ccExtNum);
        return getDataTable(list);
    }

    /**
     * 导出分机管理列表
     */
    @RequiresPermissions("cc:extnum:export")
    @Log(title = "分机管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(CcExtNum ccExtNum)
    {
        List<CcExtNum> list = ccExtNumService.selectCcExtNumList(ccExtNum);
        ExcelUtil<CcExtNum> util = new ExcelUtil<CcExtNum>(CcExtNum.class);
        return util.exportExcel(list, "分机管理数据");
    }

    /**
     * 新增分机管理
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存分机管理
     */
    @RequiresPermissions("cc:extnum:add")
    @Log(title = "分机管理", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(CcExtNum ccExtNum) {
        // 校验分机号唯一
        CcExtNum checkExtNum = ccExtNumService.selectCcExtNumByExtNum(ccExtNum.getExtNum());
        if (null != checkExtNum) {
            return AjaxResult.error("分机号已存在！");
        }
        // 一个工号只能绑定一个分机
        if (StringUtils.isNotEmpty(ccExtNum.getUserCode())) {
            // todo 校验工号是否存在
            CcExtNum checkUserCode = ccExtNumService.selectCcExtNumByUserCode(ccExtNum.getUserCode());
            if (null != checkUserCode) {
                return AjaxResult.error("该工号已经绑定分机" + checkUserCode.getExtNum() + "，不允许重复绑定！");
            }
        }
        return toAjax(ccExtNumService.insertCcExtNum(ccExtNum));
    }

    /**
     * 修改分机管理
     */
    @RequiresPermissions("cc:extnum:edit")
    @GetMapping("/edit/{extId}")
    public String edit(@PathVariable("extId") Long extId, ModelMap mmap)
    {
        CcExtNum ccExtNum = ccExtNumService.selectCcExtNumByExtId(extId);
        mmap.put("ccExtNum", ccExtNum);
        return prefix + "/edit";
    }

    /**
     * 修改保存分机管理
     */
    @RequiresPermissions("cc:extnum:edit")
    @Log(title = "分机管理", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(CcExtNum ccExtNum) {
        // 一个工号只能绑定一个分机
        if (StringUtils.isNotEmpty(ccExtNum.getUserCode())) {
            // todo 校验工号是否存在
            CcExtNum checkUserCode = ccExtNumService.selectCcExtNumByUserCode(ccExtNum.getUserCode());
            if (null != checkUserCode
                    && !ccExtNum.getExtNum().equals(checkUserCode.getExtNum())) {
                return AjaxResult.error("该工号已经绑定分机" + checkUserCode.getExtNum() + "，不允许重复绑定！");
            }
        }
        return toAjax(ccExtNumService.updateCcExtNum(ccExtNum));
    }

    /**
     * 删除分机管理
     */
    @RequiresPermissions("cc:extnum:remove")
    @Log(title = "分机管理", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(ccExtNumService.deleteCcExtNumByExtIds(ids));
    }
}
