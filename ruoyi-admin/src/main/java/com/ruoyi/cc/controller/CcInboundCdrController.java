package com.ruoyi.cc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ruoyi.cc.domain.CcBizGroup;
import com.ruoyi.cc.domain.CcOutboundCdr;
import com.ruoyi.cc.service.ICcBizGroupService;
import com.ruoyi.cc.service.ICcParamsService;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.StringUtils;
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
import com.ruoyi.cc.domain.CcInboundCdr;
import com.ruoyi.cc.service.ICcInboundCdrService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 呼入记录Controller
 *
 * @author ruoyi
 * @date 2024-12-22
 */
@Controller
@RequestMapping("/cc/inboundcdr")
public class CcInboundCdrController extends BaseController
{
    private String prefix = "cc/inboundcdr";

    @Autowired
    private ICcInboundCdrService ccInboundCdrService;
    @Autowired
    private ICcParamsService ccParamsService;
    @Autowired
    private ICcBizGroupService groupService;


    @RequiresPermissions("cc:inboundcdr:view")
    @GetMapping()
    public String inboundcdr(ModelMap mmap)
    {
        return prefix + "/inboundcdr";
    }

    /**
     * 查询呼入记录列表
     */
    @RequiresPermissions("cc:inboundcdr:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(CcInboundCdr ccInboundCdr)
    {
        startPage();
        Map<String, Object> params = ccInboundCdr.getParams();
        if (null != params.get("inboundTimeStart")
                && !"".equals(params.get("inboundTimeStart"))) {
            params.put("inboundTimeStart", DateUtils.dateTime("yyyy-MM-dd HH:mm:ss", (String)params.get("inboundTimeStart")).getTime());
        }
        if (null != params.get("inboundTimeEnd")
                && !"".equals(params.get("inboundTimeEnd"))) {
            params.put("inboundTimeEnd", DateUtils.dateTime("yyyy-MM-dd HH:mm:ss", (String)params.get("inboundTimeEnd")).getTime());
        }
        if (null != params.get("answeredTimeStart")
                && !"".equals(params.get("answeredTimeStart"))) {
            params.put("answeredTimeStart", DateUtils.dateTime("yyyy-MM-dd HH:mm:ss", (String)params.get("answeredTimeStart")).getTime());
        }
        if (null != params.get("answeredTimeEnd")
                && !"".equals(params.get("answeredTimeEnd"))) {
            params.put("answeredTimeEnd", DateUtils.dateTime("yyyy-MM-dd HH:mm:ss", (String)params.get("answeredTimeEnd")).getTime());
        }
        if (null != params.get("hangupTimeStart")
                && !"".equals(params.get("hangupTimeStart"))) {
            params.put("hangupTimeStart", DateUtils.dateTime("yyyy-MM-dd HH:mm:ss", (String)params.get("hangupTimeStart")).getTime());
        }
        if (null != params.get("hangupTimeEnd")
                && !"".equals(params.get("hangupTimeEnd"))) {
            params.put("hangupTimeEnd", DateUtils.dateTime("yyyy-MM-dd HH:mm:ss", (String)params.get("hangupTimeEnd")).getTime());
        }
        if (null != params.get("timeLenStart")
                && !"".equals(params.get("timeLenStart"))) {
            params.put("timeLenStart", Double.valueOf((String)params.get("timeLenStart")) * 60 * 1000L);
        }
        if (null != params.get("timeLenEnd")
                && !"".equals(params.get("timeLenEnd"))) {
            params.put("timeLenEnd", Double.valueOf((String)params.get("timeLenEnd")) * 60 * 1000L);
        }
        ccInboundCdr.setParams(params);
        Map<String, String> groupNames = new HashMap<>();
        List<CcInboundCdr> list = ccInboundCdrService.selectCcInboundCdrList(ccInboundCdr);
        for (CcInboundCdr data: list) {
            data.setWavFileUrl("/recordings/files?filename=" + data.getWavFile());
            String groupName = groupNames.getOrDefault(data.getGroupId(), "");
            if (StringUtils.isBlank(groupName)) {
                CcBizGroup ccBizGroup = groupService.selectCcBizGroupByGroupId(data.getGroupId());
                if (null != ccBizGroup) {
                    groupName = ccBizGroup.getBizGroupName();
                } else {
                    groupName = "-";
                }
                groupNames.put(data.getGroupId(), groupName);
            }
            data.setGroupName(groupName);
        }
        return getDataTable(list);
    }

    /**
     * 导出呼入记录列表
     */
    @RequiresPermissions("cc:inboundcdr:export")
    @Log(title = "呼入记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(CcInboundCdr ccInboundCdr)
    {
        Map<String, Object> params = ccInboundCdr.getParams();
        if (null != params.get("inboundTimeStart")
                && !"".equals(params.get("inboundTimeStart"))) {
            params.put("inboundTimeStart", DateUtils.dateTime("yyyy-MM-dd HH:mm:ss", (String)params.get("inboundTimeStart")).getTime());
        }
        if (null != params.get("inboundTimeEnd")
                && !"".equals(params.get("inboundTimeEnd"))) {
            params.put("inboundTimeEnd", DateUtils.dateTime("yyyy-MM-dd HH:mm:ss", (String)params.get("inboundTimeEnd")).getTime());
        }
        if (null != params.get("answeredTimeStart")
                && !"".equals(params.get("answeredTimeStart"))) {
            params.put("answeredTimeStart", DateUtils.dateTime("yyyy-MM-dd HH:mm:ss", (String)params.get("answeredTimeStart")).getTime());
        }
        if (null != params.get("answeredTimeEnd")
                && !"".equals(params.get("answeredTimeEnd"))) {
            params.put("answeredTimeEnd", DateUtils.dateTime("yyyy-MM-dd HH:mm:ss", (String)params.get("answeredTimeEnd")).getTime());
        }
        if (null != params.get("hangupTimeStart")
                && !"".equals(params.get("hangupTimeStart"))) {
            params.put("hangupTimeStart", DateUtils.dateTime("yyyy-MM-dd HH:mm:ss", (String)params.get("hangupTimeStart")).getTime());
        }
        if (null != params.get("hangupTimeEnd")
                && !"".equals(params.get("hangupTimeEnd"))) {
            params.put("hangupTimeEnd", DateUtils.dateTime("yyyy-MM-dd HH:mm:ss", (String)params.get("hangupTimeEnd")).getTime());
        }
        if (null != params.get("timeLenStart")
                && !"".equals(params.get("timeLenStart"))) {
            params.put("timeLenStart", Double.valueOf((String)params.get("timeLenStart")) * 60 * 1000L);
        }
        if (null != params.get("timeLenEnd")
                && !"".equals(params.get("timeLenEnd"))) {
            params.put("timeLenEnd", Double.valueOf((String)params.get("timeLenEnd")) * 60 * 1000L);
        }
        ccInboundCdr.setParams(params);
        List<CcInboundCdr> list = ccInboundCdrService.selectCcInboundCdrList(ccInboundCdr);
        ExcelUtil<CcInboundCdr> util = new ExcelUtil<CcInboundCdr>(CcInboundCdr.class);
        return util.exportExcel(list, "呼入记录数据");
    }

    /**
     * 新增呼入记录
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存呼入记录
     */
    @RequiresPermissions("cc:inboundcdr:add")
    @Log(title = "呼入记录", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(CcInboundCdr ccInboundCdr)
    {
        return toAjax(ccInboundCdrService.insertCcInboundCdr(ccInboundCdr));
    }

    /**
     * 修改呼入记录
     */
    @RequiresPermissions("cc:inboundcdr:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") String id, ModelMap mmap)
    {
        CcInboundCdr ccInboundCdr = ccInboundCdrService.selectCcInboundCdrById(id);
        mmap.put("ccInboundCdr", ccInboundCdr);
        return prefix + "/edit";
    }

    /**
     * 修改保存呼入记录
     */
    @RequiresPermissions("cc:inboundcdr:edit")
    @Log(title = "呼入记录", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(CcInboundCdr ccInboundCdr)
    {
        return toAjax(ccInboundCdrService.updateCcInboundCdr(ccInboundCdr));
    }

    /**
     * 删除呼入记录
     */
    @RequiresPermissions("cc:inboundcdr:remove")
    @Log(title = "呼入记录", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(ccInboundCdrService.deleteCcInboundCdrByIds(ids));
    }
}
