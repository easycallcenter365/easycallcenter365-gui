package com.ruoyi.cc.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.ruoyi.cc.domain.CcExtNum;
import com.ruoyi.cc.model.FsConfProfile;
import com.ruoyi.cc.service.ICcExtNumService;
import com.ruoyi.cc.service.ICcParamsService;
import com.ruoyi.cc.service.IFsConfService;
import com.ruoyi.cc.service.IFsVariablesService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.utils.ShiroUtils;
import com.ruoyi.common.utils.StringUtils;
import link.thingscloud.freeswitch.esl.EslConnectionUtil;
import link.thingscloud.freeswitch.esl.transport.message.EslMessage;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * 监控相关控制层
 */
@Controller
@RequestMapping("/cc/monitor")
public class FsMonitorController extends BaseController {

    @Autowired
    private ICcExtNumService ccExtNumService;

    @Autowired
    private ICcParamsService ccParamsService;

    private String scriptServer;
    private String scriptPort;

    /**
     * 呼入排队监控
     * @return
     */
    @RequiresPermissions("cc:monitor:inbound:view")
    @GetMapping(value = "/inbound")
    public String inboundMonitor(ModelMap mmap) {

        // 获取当前的用户
        SysUser currentUser = ShiroUtils.getSysUser();
        // 获取分机号
        CcExtNum ccExtNum = ccExtNumService.selectCcExtNumByUserCode(currentUser.getLoginName());

        String extnum = ccExtNum.getExtNum() + "-inboundMonitor";
        String opnum = ccExtNum.getUserCode() + "-inboundMonitor";
        String groupId = "0";
        String skillLevel = "9";
        String projectId = "0";
        String loginToken = ccExtNumService.createToken(extnum, opnum, groupId, skillLevel, projectId);
        JSONObject callConfig = new JSONObject();
        scriptServer = ccParamsService.getParamValueByCode("call-center-server-ip-addr", "");
        scriptPort = ccParamsService.getParamValueByCode("call-center-websocket-port", "");
        callConfig.put("scriptServer", scriptServer);
        callConfig.put("scriptPort", scriptPort);
        callConfig.put("loginToken", loginToken);
        mmap.put("callConfig", callConfig);
        return "cc/monitorinbound/monitorinbound";
    }


    /**
     * 坐席监控
     * @return
     */
    @RequiresPermissions("cc:monitor:agent:view")
    @GetMapping(value = "/agent")
    public String agentMonitor(ModelMap mmap) {

        // 获取当前的用户
        SysUser currentUser = ShiroUtils.getSysUser();
        // 获取分机号
        CcExtNum ccExtNum = ccExtNumService.selectCcExtNumByUserCode(currentUser.getLoginName());

        String extnum = ccExtNum.getExtNum() + "-agentMonitor";
        String opnum = ccExtNum.getUserCode() + "-agentMonitor";
        String groupId = "0";
        String skillLevel = "9";
        String projectId = "0";
        String loginToken = ccExtNumService.createToken(extnum, opnum, groupId, skillLevel, projectId);
        JSONObject callConfig = new JSONObject();

        scriptServer = ccParamsService.getParamValueByCode("call-center-server-ip-addr", "");
        scriptPort = ccParamsService.getParamValueByCode("call-center-websocket-port", "");

        callConfig.put("scriptServer", scriptServer);
        callConfig.put("scriptPort", scriptPort);
        callConfig.put("loginToken", loginToken);
        mmap.put("callConfig", callConfig);
        return "cc/monitoragent/monitoragent";
    }
}
