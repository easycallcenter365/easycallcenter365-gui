package com.ruoyi.cc.controller;

import java.util.List;
import java.util.Map;

import com.ruoyi.cc.service.ICcParamsService;
import com.ruoyi.common.utils.DateUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.cc.domain.CcOutboundCdr;
import com.ruoyi.cc.service.ICcOutboundCdrService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 外呼记录Controller
 *
 * @author ruoyi
 * @date 2024-12-22
 */
@Controller
@RequestMapping("/cc/outboundcdr")
public class CcOutboundCdrController extends BaseController
{
    private String prefix = "cc/outboundcdr";

    @Autowired
    private ICcOutboundCdrService ccOutboundCdrService;

    @RequiresPermissions("cc:outboundcdr:view")
    @GetMapping()
    public String outboundcdr()
    {
        return prefix + "/outboundcdr";
    }

    @Autowired
    private ICcParamsService ccParamsService;

    /**
     * 查询外呼记录列表
     */
    @RequiresPermissions("cc:outboundcdr:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(CcOutboundCdr ccOutboundCdr)
    {
        startPage();
        Map<String, Object> params = ccOutboundCdr.getParams();
        if (null != params.get("startTimeStart")
                && !"".equals(params.get("startTimeStart"))) {
            params.put("startTimeStart", DateUtils.dateTime("yyyy-MM-dd HH:mm:ss", (String)params.get("startTimeStart")).getTime());
        }
        if (null != params.get("startTimeEnd")
                && !"".equals(params.get("startTimeEnd"))) {
            params.put("startTimeEnd", DateUtils.dateTime("yyyy-MM-dd HH:mm:ss", (String)params.get("startTimeEnd")).getTime());
        }
        if (null != params.get("answeredTimeStart")
                && !"".equals(params.get("answeredTimeStart"))) {
            params.put("answeredTimeStart", DateUtils.dateTime("yyyy-MM-dd HH:mm:ss", (String)params.get("answeredTimeStart")).getTime());
        }
        if (null != params.get("answeredTimeEnd")
                && !"".equals(params.get("answeredTimeEnd"))) {
            params.put("answeredTimeEnd", DateUtils.dateTime("yyyy-MM-dd HH:mm:ss", (String)params.get("answeredTimeEnd")).getTime());
        }
        if (null != params.get("endTimeStart")
                && !"".equals(params.get("endTimeStart"))) {
            params.put("endTimeStart", DateUtils.dateTime("yyyy-MM-dd HH:mm:ss", (String)params.get("endTimeStart")).getTime());
        }
        if (null != params.get("endTimeEnd")
                && !"".equals(params.get("endTimeEnd"))) {
            params.put("endTimeEnd", DateUtils.dateTime("yyyy-MM-dd HH:mm:ss", (String)params.get("endTimeEnd")).getTime());
        }
        if (null != params.get("timeLenStart")
                && !"".equals(params.get("timeLenStart"))) {
            params.put("timeLenStart", Double.valueOf((String)params.get("timeLenStart")) * 60 * 1000L);
        }
        if (null != params.get("timeLenEnd")
                && !"".equals(params.get("timeLenEnd"))) {
            params.put("timeLenEnd", Double.valueOf((String)params.get("timeLenEnd")) * 60 * 1000L);
        }
        ccOutboundCdr.setParams(params);
        List<CcOutboundCdr> list = ccOutboundCdrService.selectCcOutboundCdrList(ccOutboundCdr);
        for (CcOutboundCdr data: list) {
            data.setWavFileUrl("/recordings/files?filename=" + data.getRecordFilename());
        }
        return getDataTable(list);
    }

    /**
     * 导出外呼记录列表
     */
    @RequiresPermissions("cc:outboundcdr:export")
    @Log(title = "外呼记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(CcOutboundCdr ccOutboundCdr)
    {
        Map<String, Object> params = ccOutboundCdr.getParams();
        if (null != params.get("startTimeStart")
                && !"".equals(params.get("startTimeStart"))) {
            params.put("startTimeStart", DateUtils.dateTime("yyyy-MM-dd HH:mm:ss", (String)params.get("startTimeStart")).getTime());
        }
        if (null != params.get("startTimeEnd")
                && !"".equals(params.get("startTimeEnd"))) {
            params.put("startTimeEnd", DateUtils.dateTime("yyyy-MM-dd HH:mm:ss", (String)params.get("startTimeEnd")).getTime());
        }
        if (null != params.get("answeredTimeStart")
                && !"".equals(params.get("answeredTimeStart"))) {
            params.put("answeredTimeStart", DateUtils.dateTime("yyyy-MM-dd HH:mm:ss", (String)params.get("answeredTimeStart")).getTime());
        }
        if (null != params.get("answeredTimeEnd")
                && !"".equals(params.get("answeredTimeEnd"))) {
            params.put("answeredTimeEnd", DateUtils.dateTime("yyyy-MM-dd HH:mm:ss", (String)params.get("answeredTimeEnd")).getTime());
        }
        if (null != params.get("endTimeStart")
                && !"".equals(params.get("endTimeStart"))) {
            params.put("endTimeStart", DateUtils.dateTime("yyyy-MM-dd HH:mm:ss", (String)params.get("endTimeStart")).getTime());
        }
        if (null != params.get("endTimeEnd")
                && !"".equals(params.get("endTimeEnd"))) {
            params.put("endTimeEnd", DateUtils.dateTime("yyyy-MM-dd HH:mm:ss", (String)params.get("endTimeEnd")).getTime());
        }
        if (null != params.get("timeLenStart")
                && !"".equals(params.get("timeLenStart"))) {
            params.put("timeLenStart", Double.valueOf((String)params.get("timeLenStart")) * 60 * 1000L);
        }
        if (null != params.get("timeLenEnd")
                && !"".equals(params.get("timeLenEnd"))) {
            params.put("timeLenEnd", Double.valueOf((String)params.get("timeLenEnd")) * 60 * 1000L);
        }
        List<CcOutboundCdr> list = ccOutboundCdrService.selectCcOutboundCdrList(ccOutboundCdr);
        ExcelUtil<CcOutboundCdr> util = new ExcelUtil<CcOutboundCdr>(CcOutboundCdr.class);
        return util.exportExcel(list, "外呼记录数据");
    }

    /**
     * 新增外呼记录
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存外呼记录
     */
    @RequiresPermissions("cc:outboundcdr:add")
    @Log(title = "外呼记录", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(CcOutboundCdr ccOutboundCdr)
    {
        return toAjax(ccOutboundCdrService.insertCcOutboundCdr(ccOutboundCdr));
    }

    /**
     * 修改外呼记录
     */
    @RequiresPermissions("cc:outboundcdr:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") String id, ModelMap mmap)
    {
        CcOutboundCdr ccOutboundCdr = ccOutboundCdrService.selectCcOutboundCdrById(id);
        mmap.put("ccOutboundCdr", ccOutboundCdr);
        return prefix + "/edit";
    }

    /**
     * 修改保存外呼记录
     */
    @RequiresPermissions("cc:outboundcdr:edit")
    @Log(title = "外呼记录", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(CcOutboundCdr ccOutboundCdr)
    {
        return toAjax(ccOutboundCdrService.updateCcOutboundCdr(ccOutboundCdr));
    }

    /**
     * 删除外呼记录
     */
    @RequiresPermissions("cc:outboundcdr:remove")
    @Log(title = "外呼记录", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(ccOutboundCdrService.deleteCcOutboundCdrByIds(ids));
    }
}
