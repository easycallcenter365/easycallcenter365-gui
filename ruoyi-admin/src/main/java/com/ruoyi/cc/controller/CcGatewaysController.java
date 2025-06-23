package com.ruoyi.cc.controller;

import java.util.*;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.ruoyi.cc.model.FsConfProfile;
import com.ruoyi.cc.service.IFsConfService;
import com.ruoyi.common.utils.StringUtils;
import link.thingscloud.freeswitch.esl.EslConnectionUtil;
import link.thingscloud.freeswitch.esl.transport.message.EslMessage;
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
import com.ruoyi.cc.domain.CcGateways;
import com.ruoyi.cc.service.ICcGatewaysService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 线路配置Controller
 *
 * @author ruoyi
 * @date 2024-12-22
 */
@Controller
@RequestMapping("/cc/gateways")
public class CcGatewaysController extends BaseController
{
    private String prefix = "cc/gateways";

    @Autowired
    private ICcGatewaysService ccGatewaysService;
    @Autowired
    private IFsConfService fsConfService;

    @RequiresPermissions("cc:gateways:view")
    @GetMapping()
    public String gateways(ModelMap mmap)
    {
        List<FsConfProfile> profileList = fsConfService.selectProfileList();
        mmap.put("profileList", profileList);
        return prefix + "/gateways";
    }

    /**
     * 查询线路配置列表
     */
    @RequiresPermissions("cc:gateways:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(CcGateways ccGateways)
    {
        startPage();
        List<CcGateways> list = ccGatewaysService.selectCcGatewaysList(ccGateways);
        return getDataTable(list);
    }

    /**
     * 导出线路配置列表
     */
    @RequiresPermissions("cc:gateways:export")
    @Log(title = "线路配置", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(CcGateways ccGateways)
    {
        List<CcGateways> list = ccGatewaysService.selectCcGatewaysList(ccGateways);
        ExcelUtil<CcGateways> util = new ExcelUtil<CcGateways>(CcGateways.class);
        return util.exportExcel(list, "线路配置数据");
    }

    /**
     * 新增线路配置
     */
    @GetMapping("/add")
    public String add(ModelMap mmap)
    {
        List<FsConfProfile> profileList = fsConfService.selectProfileList();
        mmap.put("profileList", profileList);
        return prefix + "/add";
    }

    /**
     * 新增保存线路配置
     */
    @RequiresPermissions("cc:gateways:add")
    @Log(title = "线路配置", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(CcGateways ccGateways)
    {

        CcGateways checkGateways = ccGatewaysService.selectCcGatewaysByGwName(ccGateways.getGwName());
        if (null != checkGateways) {
            return AjaxResult.error("网关名称不能重复，请修改");
        }
        // 新增gateway配置文件
        String configs = ccGateways.getConfigs();
        JSONObject params = new JSONObject();
        if (StringUtils.isNotEmpty(configs)) {
            params = JSONObject.parseObject(configs);
        }
        //  0 对接模式； 1注册模式
        params.put("realm", ccGateways.getGwAddr());
        if (ccGateways.getRegister() == 0) {
            params.put("caller-id-in-from", "false");
            params.put("register", "false");
            params.put("origination_caller_id_number", ccGateways.getCaller());
            params.put("origination_caller_id_name", ccGateways.getCaller());
            params.put("effective_caller_id_number", ccGateways.getCaller());
            params.put("effective_caller_id_name", ccGateways.getCaller());
            params.put("username", ccGateways.getCaller());
            fsConfService.setGwUnRegisterConf("", ccGateways.getProfileName(), ccGateways.getGwName(), params);
        } else {
            params.put("caller-id-in-from", "true");
            params.put("register", "true");
            params.put("username", ccGateways.getAuthUsername());
            params.put("password", ccGateways.getAuthPassword());
            fsConfService.setGwRegisterConf("", ccGateways.getProfileName(), ccGateways.getGwName(), params);
        }
        ccGateways.setConfigs(configs);
        ccGateways.setUpdateTime(new Date().getTime());
        Integer result = ccGatewaysService.insertCcGateways(ccGateways);
        EslMessage eslMessage = EslConnectionUtil.sendSyncApiCommand("sofia", "profile " + ccGateways.getProfileName() + " rescan");
        if (null != eslMessage) {
            logger.info(StringUtils.joinWith("/r/n", eslMessage.getBodyLines().toArray()));
        }
        return toAjax(result);
    }

    /**
     * 修改线路配置
     */
    @RequiresPermissions("cc:gateways:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        List<FsConfProfile> profileList = fsConfService.selectProfileList();
        mmap.put("profileList", profileList);
        CcGateways ccGateways = ccGatewaysService.selectCcGatewaysById(id);
        mmap.put("ccGateways", ccGateways);
        return prefix + "/edit";
    }

    /**
     * 修改保存线路配置
     */
    @RequiresPermissions("cc:gateways:edit")
    @Log(title = "线路配置", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(CcGateways ccGateways)
    {
        CcGateways orignGateways = ccGatewaysService.selectCcGatewaysById(ccGateways.getId());
        CcGateways checkGateways = ccGatewaysService.selectCcGatewaysByGwName(ccGateways.getGwName());
        if (null != checkGateways && !checkGateways.getId().equals(ccGateways.getId())) {
            return AjaxResult.error("网关名称不能重复，请修改");
        }
        // 新增gateway配置文件
        String configs = ccGateways.getConfigs();
        JSONObject params = new JSONObject();
        if (StringUtils.isNotEmpty(configs)) {
            params = JSONObject.parseObject(configs);
        }
        //  0 对接模式； 1注册模式
        params.put("realm", ccGateways.getGwAddr());
        if (ccGateways.getRegister() == 0) {
            params.put("caller-id-in-from", "false");
            params.put("register", "false");
            params.put("origination_caller_id_number", ccGateways.getCaller());
            params.put("origination_caller_id_name", ccGateways.getCaller());
            params.put("effective_caller_id_number", ccGateways.getCaller());
            params.put("effective_caller_id_name", ccGateways.getCaller());
            params.put("username", ccGateways.getCaller());
            fsConfService.setGwUnRegisterConf(orignGateways.getProfileName(), ccGateways.getProfileName(), ccGateways.getGwName(), params);
        } else {
            params.put("caller-id-in-from", "true");
            params.put("register", "true");
            params.put("username", ccGateways.getAuthUsername());
            params.put("password", ccGateways.getAuthPassword());
            fsConfService.setGwRegisterConf(orignGateways.getProfileName(), ccGateways.getProfileName(), ccGateways.getGwName(), params);
        }
        ccGateways.setUpdateTime(new Date().getTime());
        Integer result = ccGatewaysService.updateCcGateways(ccGateways);
        EslMessage eslMessage1 = EslConnectionUtil.sendSyncApiCommand("sofia", "profile " + ccGateways.getProfileName() + " killgw " + ccGateways.getGwName());
        if (null != eslMessage1) {
            logger.info(StringUtils.joinWith("/r/n", eslMessage1.getBodyLines().toArray()));
        }
        EslMessage eslMessage2 = EslConnectionUtil.sendSyncApiCommand("sofia", "profile " + ccGateways.getProfileName() + " rescan");
        if (null != eslMessage2) {
            logger.info(StringUtils.joinWith("/r/n", eslMessage2.getBodyLines().toArray()));
        }
        return toAjax(result);
    }

    /**
     * 删除线路配置
     */
    @RequiresPermissions("cc:gateways:remove")
    @Log(title = "线路配置", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(ccGatewaysService.deleteCcGatewaysByIds(ids));
    }

    /**
     * 全部网关列表
     * @return
     */
    @GetMapping("/all")
    @ResponseBody
    public AjaxResult all()
    {
        List<CcGateways> list = ccGatewaysService.selectCcGatewaysList(new CcGateways());
        return AjaxResult.success(list);
    }


    /**
     * 外呼网关列表
     * @return
     */
    @GetMapping("/outbound")
    @ResponseBody
    public AjaxResult outbound()
    {
        Map<String, Object> params = new HashMap<>();
        params.put("purposes", Arrays.asList(2,3));
        List<CcGateways> list = ccGatewaysService.selectCcGatewaysList(new CcGateways().setParams(params));
        return AjaxResult.success(list);
    }
}
