package com.ruoyi.cc.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.ruoyi.cc.model.FsConfProfile;
import com.ruoyi.cc.model.FsMod;
import com.ruoyi.cc.model.ProfileRegExtnumModel;
import com.ruoyi.cc.model.ProfileStatusModel;
import com.ruoyi.cc.service.ICcParamsService;
import com.ruoyi.cc.service.IFsConfService;
import com.ruoyi.cc.service.IFsVariablesService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.utils.CommonUtils;
import com.ruoyi.common.utils.StringUtils;
import link.thingscloud.freeswitch.esl.EslConnectionUtil;
import link.thingscloud.freeswitch.esl.transport.message.EslMessage;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.List;


/**
 * freeswitch配置文件控制层
 */
@Controller
@RequestMapping("/cc/fsconf")
public class FsConfController extends BaseController {

    @Autowired
    private IFsConfService fsConfService;
    @Autowired
    private IFsVariablesService fsVariablesService;
    @Autowired
    private ICcParamsService ccParamsService;


    /**
     * 系统全局配置
     * @return
     */
    @RequiresPermissions("cc:switchconf:view")
    @GetMapping(value = "/switchconf")
    public String switchConf() {
        return "cc/switchconf/switchconf";
    }


    /**
     * 保存系统全局配置
     * @param params
     * @return
     */
    @PostMapping(value = "/setSwitchConf")
    @ResponseBody
    public AjaxResult setSwitchConf(@RequestBody JSONArray params) {
        fsConfService.setSwitchConf(params);
        return AjaxResult.success("设置成功！");
    }

    /**
     * 重启fs服务
     * @return
     */
    @GetMapping(value = "/restartFs")
    @ResponseBody
    public AjaxResult restartFs() {
        fsConfService.restartFs();
        return AjaxResult.success("重启成功！");
    }

    /**
     * 获取系统全局配置
     * @return
     */
    @GetMapping(value = "/getSwitchConf")
    @ResponseBody
    public AjaxResult getSwitchConf() {
        // 配置文件所有配置
        JSONObject confAllVars = fsConfService.getSwitchConf();
        // 可配置的基本配置，其他的为隐藏的高级配置
        JSONObject fsVars = fsVariablesService.getFsVariablesByCat(2); // key: 参数名, value：别名
        JSONArray baseConfigs = new JSONArray();
        JSONArray advancedConfigs = new JSONArray();
        for (String name: confAllVars.keySet()) {
            JSONObject var = new JSONObject();
            var.put("name", name);
            var.put("value", confAllVars.getString(name));
            if (fsVars.keySet().contains(name)) {
                // 基本配置
                var.put("aliasName", fsVars.getString(name)); // 别名
                baseConfigs.add(var);
            } else {
                // 高级配置
                var.put("aliasName", name); // 高级配置没有别名
                advancedConfigs.add(var);
            }
        }
        JSONObject result = new JSONObject();
        result.put("baseConfigs", baseConfigs);
        result.put("advancedConfigs", advancedConfigs);
        return AjaxResult.success("success", result);
    }


    /**
     * 全局编码配置
     * @return
     */
    @RequiresPermissions("cc:varsconf:view")
    @GetMapping(value = "/varsconf")
    public String varsConf() {
        return "cc/varsconf/varsconf";
    }


    /**
     * 保存全局编码配置
     * @param params
     * @return
     */
    @PostMapping(value = "/setVarsConf")
    @ResponseBody
    public AjaxResult setVarsConf(@RequestBody JSONArray params) {
        fsConfService.setVarsConf(params);
        return AjaxResult.success("设置成功！");
    }


    /**
     * 获取全局编码配置
     * @return
     */
    @GetMapping(value = "/getVarsConf")
    @ResponseBody
    public AjaxResult getVarsConf() {
        // 配置文件所有配置
        JSONObject confAllVars = fsConfService.getVarsConf();
        // 可配置的基本配置，其他的为隐藏的高级配置（1. vars.xml  2. switch.conf.xml  3. profile  4. xunfei_asr  5. aliyun asr）
        JSONObject fsVars = fsVariablesService.getFsVariablesByCat(1); // key: 参数名, value：别名
        JSONArray baseConfigs = new JSONArray();
        JSONArray advancedConfigs = new JSONArray();
        for (String name: confAllVars.keySet()) {
            JSONObject var = new JSONObject();
            var.put("name", name);
            var.put("value", confAllVars.getString(name));
            if (fsVars.keySet().contains(name)) {
                // 基本配置
                var.put("aliasName", fsVars.getString(name)); // 别名
                baseConfigs.add(var);
            } else {
                // 高级配置
                var.put("aliasName", name); // 高级配置没有别名
                advancedConfigs.add(var);
            }
        }
        JSONObject result = new JSONObject();
        result.put("baseConfigs", baseConfigs);
        result.put("advancedConfigs", advancedConfigs);
        return AjaxResult.success("success", result);
    }

    /**
     * ASR(讯飞)参数配置
     * @return
     */
    @RequiresPermissions("cc:xunfeiasrconf:view")
    @GetMapping(value = "/xunfeiasrconf")
    public String xunfeiAsrConf() {
        return "cc/xunfeiasrconf/xunfeiasrconf";
    }

    /**
     * FunAsr参数配置
     * @return
     */
    @RequiresPermissions("cc:funasrconf:view")
    @GetMapping(value = "/funasrconf")
    public String funAsrConf() {
        return "cc/funasrconf/funasrconf";
    }

    /**
     * TTS(阿里)参数配置
     * @return
     */
    @RequiresPermissions("cc:alittsconf:view")
    @GetMapping(value = "/alittsconf")
    public String aliTtsConf() {
        return "cc/alittsconf/alittsconf";
    }

    /**
     * 获取阿里云tts配置
     * @return
     */
    @GetMapping(value = "/getAliTtsConf")
    @ResponseBody
    public AjaxResult getAliTtsConf() {
        String asrFileName = "/autoload_configs/aliyun_tts.conf.xml";
        return getConfigFileJsonData(asrFileName, 5);
    }

    /**
     * ASR(阿里)参数配置
     * @return
     */
    @RequiresPermissions("cc:aliasrconf:view")
    @GetMapping(value = "/aliasrconf")
    public String aliAsrConf() {
        return "cc/aliasrconf/aliasrconf";
    }


    /**
     * 获取ASR配置
     * @return
     */
    @GetMapping(value = "/getAliAsrConf")
    @ResponseBody
    public AjaxResult getAliAsrConf() {
        String asrFileName = "/autoload_configs/aliyun_asr.conf.xml";
        return getConfigFileJsonData(asrFileName, 5);
    }

    /**
     * 获取FunASR配置
     * @return
     */
    @GetMapping(value = "/getFunAsrConf")
    @ResponseBody
    public AjaxResult getFunAsrConf() {
        return getConfigFileJsonData("/autoload_configs/funasr.conf.xml", 4);
    }


    /**
     * 获取ASR配置
     * @return
     */
    @GetMapping(value = "/getXunfeiAsrConf")
    @ResponseBody
    public AjaxResult getXunfeiAsrConf() {
       return getConfigFileJsonData("/autoload_configs/xunfei_asr.conf.xml", 4);
    }


    private AjaxResult getConfigFileJsonData(String configFile, int cat){
        JSONObject confAllVars = fsConfService.getAsrConf(configFile);
        if(confAllVars.size() != 0) {
            JSONObject fsVars = fsVariablesService.getFsVariablesByCat(cat); // key: 参数名, value：别名
            JSONArray baseConfigs = new JSONArray();
            for (String name : confAllVars.keySet()) {
                JSONObject var = new JSONObject();
                var.put("name", name);
                boolean hidden =  fsConfService.checkNeedHidden(name);
                // server_url_webapi不需要加密
                if ("server_url_webapi".equals(name)) {
                    hidden = false;
                }
                if(hidden){
                    var.put("value", CommonUtils.maskStringUtil(confAllVars.getString(name)));
                }else {
                    var.put("value", confAllVars.getString(name));
                }
                if (fsVars.keySet().contains(name)) {
                    // 基本配置
                    var.put("aliasName", fsVars.getString(name)); // 别名
                    baseConfigs.add(var);
                } else {
                    // 高级配置
                    var.put("aliasName", name); // 高级配置没有别名
                    baseConfigs.add(var);
                }
            }
            return AjaxResult.success("success", baseConfigs);
        }else{
            return AjaxResult.error(String.format("config file not found: %s", configFile));
        }

    }

    private AjaxResult saveAndReloadAsrModule(String asrFileName, String moduleName, JSONArray params){
        String result = fsConfService.setAsrConf(params, asrFileName);
        if(StringUtils.isEmpty(result)) {
            EslMessage resp = EslConnectionUtil.sendSyncApiCommand("reload", moduleName);
            String respText = CommonUtils.ListToString(resp.getBodyLines());
            if(respText.contains("OK module loaded")) {
                return AjaxResult.success("配置写入成功！\n  模块已成功加载!");
            }else{
                return AjaxResult.error("配置写入成功！\n  但是模块加载失败! \n" + respText);
            }
        }else{
            return AjaxResult.error("配置文件写入失败！\n " + result);
        }
    }

    private AjaxResult saveAndReloadTtsModule(String asrFileName, String moduleName, JSONArray params){
        String result = fsConfService.setAsrConf(params, asrFileName);
        if(StringUtils.isEmpty(result)) {
            String paramCode = "aliyun-tts-account-json";
            JSONObject paramValues = new JSONObject();
            for (int j = 0; j < params.size(); j++) {
                JSONObject param = params.getJSONObject(j);
                String attrName = param.getString("name");
                String attValue = param.getString("value");
                paramValues.put(attrName, attValue);
            }
            ccParamsService.updateParamsValue(paramCode, JSONObject.toJSONString(paramValues));

            String reloadRsp = ccParamsService.reloadParams();
            if(!reloadRsp.equalsIgnoreCase("success")){
                return error("参数修改成功, 但是刷新失败, 请手动重启 call-center!");
            }

            EslMessage resp = EslConnectionUtil.sendSyncApiCommand("reload", moduleName);
            String respText = CommonUtils.ListToString(resp.getBodyLines());
            if(respText.contains("OK module loaded")) {
                return AjaxResult.success("配置写入成功！\n  模块已成功加载!");
            }else{
                return AjaxResult.error("配置写入成功！\n  但是模块加载失败! \n" + respText);
            }
        }else{
            return AjaxResult.error("配置文件写入失败！\n " + result);
        }
    }

    /**
     * 保存ASR配置
     * @param params
     * @return
     */
    @PostMapping(value = "/setAliAsrConf")
    @ResponseBody
    public AjaxResult setAsrConf(@RequestBody JSONArray params) {
        AjaxResult checkVersion  = checkSoftVersion();
        if(checkVersion.isError()){
            return checkVersion;
        }
        String asrFileName = "/autoload_configs/aliyun_asr.conf.xml";
        String moduleName = "mod_aliyun_asr";
        return saveAndReloadAsrModule(asrFileName, moduleName, params);
    }

    /**
     * 保存TTS配置
     * @param params
     * @return
     */
    @PostMapping(value = "/setAliTtsConf")
    @ResponseBody
    public AjaxResult setAliTtsConf(@RequestBody JSONArray params) {
        String asrFileName = "/autoload_configs/aliyun_tts.conf.xml";
        String moduleName = "mod_aliyun_tts";
        AjaxResult result = saveAndReloadTtsModule(asrFileName, moduleName, params);
        return result;
    }

    private AjaxResult checkSoftVersion(){
        String version =  ccParamsService.getParamValueByCode(
                "current-software-version", "community"
        );
        if("community".equalsIgnoreCase(version)){
            return AjaxResult.error("抱歉,社区版无法使用该模块!");
        }
        return AjaxResult.success("Ok");
    }

    /**
     * 保存ASR配置
     * @param params
     * @return
     */
    @PostMapping(value = "/setXunfeiAsrConf")
    @ResponseBody
    public AjaxResult setXunfeiAsrConf(@RequestBody JSONArray params) {
        AjaxResult checkVersion = checkSoftVersion();
        if(checkVersion.isError()){
            return checkVersion;
        }
        String asrFileName = "/autoload_configs/xunfei_asr.conf.xml";
        String moduleName = "mod_xunfei_asr";
        return saveAndReloadAsrModule(asrFileName, moduleName, params);
    }

    /**
     * 保存FunASR配置
     * @param params
     * @return
     */
    @PostMapping(value = "/setFunAsrConf")
    @ResponseBody
    public AjaxResult setFunAsrConf(@RequestBody JSONArray params) {
        String asrFileName = "/autoload_configs/funasr.conf.xml";
        String moduleName = "mod_funasr";
        return saveAndReloadAsrModule(asrFileName, moduleName, params);
    }

    /**
     * ASR引擎设置
     * @return
     */
    @RequiresPermissions("cc:asrengine:view")
    @GetMapping(value = "/asrengine")
    public String asrengine(ModelMap mmap) {
        String asrEngine = fsConfService.getAsrengine();
        FsMod mod = new FsMod();
        mod.setModName("asrEngine");
        mod.setModValue(asrEngine);
        mmap.put("mod", mod);
        return "cc/asrengine/asrengine";
    }


    /**
     * 设置ASR引擎（mod_xunfei_asr、mod_aliyun_asr）
     * @param asrengine
     * @return
     */
    @GetMapping(value = "/setAsrengine")
    @ResponseBody
    public AjaxResult setAsrengine(@RequestParam String asrengine) {
        String result = fsConfService.setAsrengine(asrengine);
        if(StringUtils.isEmpty(result)){
            if (StringUtils.isNotEmpty(asrengine)) {
                EslConnectionUtil.sendSyncApiCommand("unload", "mod_xunfei_asr");
                EslConnectionUtil.sendSyncApiCommand("unload", "mod_funasr");
                EslConnectionUtil.sendSyncApiCommand("unload", "mod_aliyun_asr");

                EslMessage resp = EslConnectionUtil.sendSyncApiCommand("load", asrengine.trim());
                String text = CommonUtils.ListToString(resp.getBodyLines() , '\n');
                if(text.contains("+OK")) {
                    return AjaxResult.success("设置成功！");
                }else{
                    return AjaxResult.success("设置失败！\n " + text);
                }
            }else{
                return AjaxResult.error("参数错误!");
            }
        }else {
            return AjaxResult.error(result);
        }
    }

    /**
     * 证书配置
     * @return
     */
    @RequiresPermissions("cc:certwsspen:view")
    @GetMapping(value = "/certwsspen")
    public String certWssPen() {
        return "cc/certwsspen/certwsspen";
    }

    /**
     * 获取证书配置
     * @return
     */
    @GetMapping(value = "/getCertWssPen")
    @ResponseBody
    public AjaxResult getCertWssPen() {
        JSONObject result = new JSONObject();
        result.put("certValue", fsConfService.getCertWssPen());
        return AjaxResult.success("success", result);
    }

    /**
     * 保存证书配置
     * @param params
     * @return
     */
    @PostMapping(value = "/setCertWssPen")
    @ResponseBody
    public AjaxResult setCertWssPen(@RequestBody JSONObject params) {
        fsConfService.setCertWssPen(params.getString("certValue"));
        return AjaxResult.success("设置成功！");
    }

    /**
     * 日志监控
     * @return
     */
    @RequiresPermissions("cc:catlogs:view")
    @GetMapping(value = "/catlogs")
    public String catLogs() {
        return "cc/catlogs/catlogs";
    }


    /**
     * 获取日志
     * @return
     */
    @GetMapping(value = "/getLogs")
    @ResponseBody
    public AjaxResult getLogs(@RequestParam String uuid) {
        if (StringUtils.isBlank(uuid) || uuid.length() <= 10) {
            return AjaxResult.error("请输入正确的uuid");
        }
        uuid = uuid.trim();
        JSONObject result = new JSONObject();
//        result.put("fsLogs", "这是freeswitch日志：\r\n19:21:38.255 [schedule-pool-3] INFO  c.r.f.s.w.s.OnlineWebSessionManager - [validateSessions,100] - invalidation sessions...\r\n19:21:38.281 [schedule-pool-3] DEBUG c.r.s.m.S.selectOnlineByExpired - [debug,135] - ==>  Preparing: select sessionId, login_name, dept_name, ipaddr, login_location, browser, os, status, start_timestamp, last_access_time, expire_time from sys_user_online o WHERE o.last_access_time <= ? ORDER BY o.last_access_time ASC\r\n19:21:38.283 [schedule-pool-3] DEBUG c.r.s.m.S.selectOnlineByExpired - [debug,135] - ==> Parameters: 2024-12-22 18:51:38(String)\r\n19:21:38.312 [schedule-pool-3] DEBUG c.r.s.m.S.selectOnlineByExpired - [debug,135] - <==      Total: 0\r\n19:21:38.313 [schedule-pool-3] INFO  c.r.f.s.w.s.OnlineWebSessionManager - [validateSessions,165] - Finished invalidation session. No sessions were stopped.\r\n");
//        result.put("ccLogs", "这是callcenter日志：\r\n19:21:38.255 [schedule-pool-3] INFO  c.r.f.s.w.s.OnlineWebSessionManager - [validateSessions,100] - invalidation sessions...\r\n19:21:38.281 [schedule-pool-3] DEBUG c.r.s.m.S.selectOnlineByExpired - [debug,135] - ==>  Preparing: select sessionId, login_name, dept_name, ipaddr, login_location, browser, os, status, start_timestamp, last_access_time, expire_time from sys_user_online o WHERE o.last_access_time <= ? ORDER BY o.last_access_time ASC\r\n19:21:38.283 [schedule-pool-3] DEBUG c.r.s.m.S.selectOnlineByExpired - [debug,135] - ==> Parameters: 2024-12-22 18:51:38(String)\r\n19:21:38.312 [schedule-pool-3] DEBUG c.r.s.m.S.selectOnlineByExpired - [debug,135] - <==      Total: 0\r\n19:21:38.313 [schedule-pool-3] INFO  c.r.f.s.w.s.OnlineWebSessionManager - [validateSessions,165] - Finished invalidation session. No sessions were stopped.\r\n");
        String fsLogFiles = ccParamsService.getParamValueByCode("fs_log_file_path", "");
        String fsLogs = fsConfService.getLogs(uuid, fsLogFiles, "cc");
        result.put("fsLogs", fsLogs); // freeswitch日志
        String ccLogFiles = ccParamsService.getParamValueByCode("cc_log_file_path", "");
        String ccLogs = fsConfService.getLogs(uuid, ccLogFiles, "cc");
        if (StringUtils.isNotEmpty(fsLogs)
                && StringUtils.isBlank(ccLogs)) {
            String ccHisLogFiles = ccLogFiles.replaceAll("\\.log$", "*.log");
            logger.info(ccHisLogFiles);
            ccLogs = fsConfService.getLogs(uuid, ccHisLogFiles, "cc");
        }
        result.put("ccLogs", ccLogs); // callcenter日志
        return AjaxResult.success("success", result);
    }


    @RequiresPermissions("cc:profileconf:view")
    @GetMapping("/profileconf")
    public String profile()
    {
        return "cc/profileconf/profileconf";
    }

    @RequiresPermissions("cc:profileconf:add")
    @GetMapping("/profileconf/add/{profileType}")
    public String addProfile(@PathVariable("profileType") String profileType, ModelMap mmap)
    {
        mmap.put("profileType", profileType);
        return "cc/profileconf/add";
    }

    @RequiresPermissions("cc:profileconf:edit")
    @GetMapping("/profileconf/edit/{profileName}")
    public String editProfile(@PathVariable("profileName") String profileName, ModelMap mmap)
    {
        mmap.put("profileName", profileName);
        return "cc/profileconf/edit";
    }

    /**
     * 查询分机管理列表
     */
    @RequiresPermissions("cc:profileconf:list")
    @PostMapping("/profileList")
    @ResponseBody
    public TableDataInfo profileList()
    {
        startPage();
        List<FsConfProfile> list = fsConfService.selectProfileList();
        return getDataTable(list);
    }

    @PostMapping(value = "/setProfileConf")
    @ResponseBody
    public AjaxResult setProfileConf(@RequestBody JSONArray params) {
        String profileName = "";
        String profileType = "";
        String operaType = "";
        JSONArray xmlParams = new JSONArray();
        for (int i = 0; i < params.size(); i++) {
            JSONObject param = params.getJSONObject(i);
            // 不需要写入文件的属性
            if ("_profileType".equals(param.getString("name"))) {
                profileType = param.getString("value");
                continue;
            }
            if ("_operaType".equals(param.getString("name"))) {
                operaType = param.getString("value");
                continue;
            }
            // 需要写入文件的属性
            if ("profileName".equals(param.getString("name"))) {
                profileName = param.getString("value");
            }
            xmlParams.add(param);
        }
        logger.info("profileName:" + profileName);
        logger.info("profileType:" + profileType);
        logger.info("operaType:" + operaType);
        String saveSuccess = fsConfService.setProfileConf(profileName, profileType, xmlParams);
        if(!StringUtils.isEmpty(saveSuccess)){
            return AjaxResult.error(saveSuccess);
        }
        if ("add".equals(operaType)) {
            // 新增后启动
            EslMessage eslMessage = EslConnectionUtil.sendSyncApiCommand("sofia", "profile " + profileName + " start");
            if (null != eslMessage) {
                logger.info(StringUtils.joinWith("/r/n", eslMessage.getBodyLines().toArray()));
            }
        } else if ("edit".equals(operaType)) {
            // 修改后重启
            EslMessage eslMessage = EslConnectionUtil.sendSyncApiCommand("sofia", "profile " + profileName + " restart");
            if (null != eslMessage) {
                logger.info(StringUtils.joinWith("/r/n", eslMessage.getBodyLines().toArray()));
            }
        }
        return AjaxResult.success("设置成功！");
    }

    @GetMapping(value = "/getProfileConf")
    @ResponseBody
    public AjaxResult getProfileConf(@RequestParam(required = false) String profileName, @RequestParam(required = false)  String profileType) {
        // 配置文件所有配置
        JSONObject confAllVars = fsConfService.getProfileConf(profileName, profileType);
        // 可配置的基本配置，其他的为隐藏的高级配置
        JSONObject fsVars = fsVariablesService.getFsVariablesByCat(3); // key: 参数名, value：别名
        JSONArray baseConfigs = new JSONArray();
        JSONArray advancedConfigs = new JSONArray();
        for (String name: confAllVars.keySet()) {
            JSONObject var = new JSONObject();
            var.put("name", name);
            var.put("value", confAllVars.getString(name));
            if (fsVars.keySet().contains(name)) {
                // 基本配置
                var.put("aliasName", fsVars.getString(name)); // 别名
                baseConfigs.add(var);
            } else {
                // 高级配置
                var.put("aliasName", name); // 高级配置没有别名
                advancedConfigs.add(var);
            }
        }
        JSONObject result = new JSONObject();
        result.put("baseConfigs", baseConfigs);
        result.put("advancedConfigs", advancedConfigs);
        return AjaxResult.success("success", result);
    }

    @GetMapping(value = "/getProfileStatus")
    @ResponseBody
    public AjaxResult getProfileStatus(@RequestParam String profileName) {
        JSONObject result = new JSONObject();
        EslMessage eslMessage = EslConnectionUtil.sendSyncApiCommand("sofia", "xmlstatus");
        if (null != eslMessage) {
            logger.info(StringUtils.joinWith("\r\n", eslMessage.getBodyLines().toArray()));
            List<ProfileStatusModel> list = convertProfileStatusXml(StringUtils.joinWith("", eslMessage.getBodyLines().toArray()));
            logger.info(JSONObject.toJSONString(list));
            result.put("data", list);
        } else {
            result.put("msg", "系统错误");
        }
        return AjaxResult.success("success", result);
    }

    /**
     * profileStatus格式转换
     * @param xml
     * @return
     */
    private List<ProfileStatusModel> convertProfileStatusXml(String xml) {
        List<ProfileStatusModel> list = new ArrayList<>();
        try {
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();
            InputSource is = new InputSource(new StringReader(xml));
            Document doc = builder.parse(is);
            // 根节点
            Node profiles = doc.getDocumentElement();
            // 下层数据节点（profile、gateway、alias等）
            NodeList children = profiles.getChildNodes();
            for (int i = 0; i < children.getLength(); i++) {
                // 比如profile节点
                Node child = children.item(i);
                if (child.getNodeType() == Node.ELEMENT_NODE) {
                    Element element = (Element) children.item(i);
                    Node name = element.getElementsByTagName("name").item(0);
                    Node type = element.getElementsByTagName("type").item(0);
                    Node data = element.getElementsByTagName("data").item(0);
                    Node state = element.getElementsByTagName("state").item(0);

                    ProfileStatusModel model = new ProfileStatusModel();
                    if (null != name && StringUtils.isNotEmpty(name.getTextContent())) {
                        model.setName(name.getTextContent().trim());
                    }
                    if (null != type && StringUtils.isNotEmpty(type.getTextContent())) {
                        model.setType(type.getTextContent().trim());
                    }
                    if (null != data && StringUtils.isNotEmpty(data.getTextContent())) {
                        model.setData(data.getTextContent().trim());
                    }
                    if (null != state && StringUtils.isNotEmpty(state.getTextContent())) {
                        model.setState(state.getTextContent().trim());
                    }
                    list.add(model);

                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @GetMapping(value = "/startProfile")
    @ResponseBody
    public AjaxResult startProfile(@RequestParam String profileName) {
        JSONObject result = new JSONObject();
        EslMessage eslMessage = EslConnectionUtil.sendSyncApiCommand("sofia", "profile " + profileName + " start");
        if (null != eslMessage) {
            result.put("msg", eslMessage.getBodyLines());
        } else {
            result.put("msg", "系统错误");
        }
        return AjaxResult.success("success", result);
    }

    @GetMapping(value = "/stopProfile")
    @ResponseBody
    public AjaxResult stopProfile(@RequestParam String profileName) {
        JSONObject result = new JSONObject();
        EslMessage eslMessage = EslConnectionUtil.sendSyncApiCommand("sofia", "profile " + profileName + " stop");
        if (null != eslMessage) {
            result.put("msg", eslMessage.getBodyLines());
        } else {
            result.put("msg", "系统错误");
        }
        return AjaxResult.success("success", result);
    }

    @GetMapping(value = "/restartProfile")
    @ResponseBody
    public AjaxResult restartProfile(@RequestParam String profileName) {
        JSONObject result = new JSONObject();
        EslMessage eslMessage = EslConnectionUtil.sendSyncApiCommand("sofia", "profile " + profileName + " restart");
        if (null != eslMessage) {
            result.put("msg", eslMessage.getBodyLines());
        } else {
            result.put("msg", "系统错误");
        }
        return AjaxResult.success("success", result);
    }


    @GetMapping(value = "/getExtnumList")
    @ResponseBody
    public AjaxResult getExtnumList(@RequestParam String profileName) {
        JSONObject result = new JSONObject();
        EslMessage eslMessage = EslConnectionUtil.sendSyncApiCommand("sofia", "xmlstatus profile " + profileName + " reg");
        if (null != eslMessage) {
            logger.info(StringUtils.joinWith("\r\n", eslMessage.getBodyLines().toArray()));
            List<ProfileRegExtnumModel> list = convertProfileRegExtnumXml(StringUtils.joinWith("", eslMessage.getBodyLines().toArray()));
            logger.info(JSONObject.toJSONString(list));
            result.put("data", list);
        } else {
            result.put("msg", "系统错误");
        }
        return AjaxResult.success("success", result);
    }

    private List<ProfileRegExtnumModel> convertProfileRegExtnumXml(String xml) {
        List<ProfileRegExtnumModel> list = new ArrayList<>();
        try {
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();
            InputSource is = new InputSource(new StringReader(xml));
            Document doc = builder.parse(is);
            NodeList children = doc.getElementsByTagName("registration");
            for (int i = 0; i < children.getLength(); i++) {
                // 比如profile节点
                Node child = children.item(i);
                if (child.getNodeType() == Node.ELEMENT_NODE) {
                    Element element = (Element) children.item(i);
                    Node user = element.getElementsByTagName("user").item(0);
                    Node networkIp = element.getElementsByTagName("network-ip").item(0);
                    Node status = element.getElementsByTagName("status").item(0);
                    Node agent = element.getElementsByTagName("agent").item(0);

                    ProfileRegExtnumModel model = new ProfileRegExtnumModel();
                    if (null != user && StringUtils.isNotEmpty(user.getTextContent())) {
                        model.setUser(user.getTextContent().trim().split("@")[0]);
                    }
                    if (null != networkIp && StringUtils.isNotEmpty(networkIp.getTextContent())) {
                        model.setNetworkIp(networkIp.getTextContent().trim());
                    }
                    if (null != status && StringUtils.isNotEmpty(status.getTextContent())) {
                        model.setStatus(status.getTextContent().trim());
                    }
                    if (null != agent && StringUtils.isNotEmpty(agent.getTextContent())) {
                        String agentValue = agent.getTextContent().trim();
                        if (agentValue.length() > 16) {
                            agentValue = agentValue.substring(0, 14) + "...";
                        }
                        model.setAgent(agentValue);
                    }
                    list.add(model);

                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

}
