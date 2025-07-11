package com.ruoyi.web.controller.system;

import java.util.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONObject;
import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.ruoyi.cc.domain.CcExtNum;
import com.ruoyi.cc.domain.CcGateways;
import com.ruoyi.cc.domain.SysDivisionData;
import com.ruoyi.cc.service.ICcExtNumService;
import com.ruoyi.cc.service.ICcGatewaysService;
import com.ruoyi.cc.service.ICcParamsService;
import com.ruoyi.cc.service.ISysDivisionDataService;
import com.ruoyi.common.utils.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ruoyi.common.config.RuoYiConfig;
import com.ruoyi.common.constant.ShiroConstants;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysMenu;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.text.Convert;
import com.ruoyi.framework.shiro.service.SysPasswordService;
import com.ruoyi.system.service.ISysConfigService;
import com.ruoyi.system.service.ISysMenuService;

/**
 * 首页 业务处理
 * 
 * @author ruoyi
 */
@Controller
public class SysIndexController extends BaseController
{
    @Autowired
    private ISysMenuService menuService;

    @Autowired
    private ISysConfigService configService;

    @Autowired
    private SysPasswordService passwordService;

    @Autowired
    private ICcExtNumService ccExtNumService;

    @Autowired
    private ICcGatewaysService ccGatewaysService;

    @Autowired
    private ICcParamsService ccParamsService;


    private String scriptServer;
    private String scriptPort;

    // 系统首页
    @GetMapping("/index")
    public String index(ModelMap mmap)
    {
        // 取身份信息
        SysUser user = getSysUser();
        // 根据用户id取出菜单
        List<SysMenu> menus = menuService.selectMenusByUser(user);
        mmap.put("menus", menus);
        mmap.put("user", user);
        mmap.put("sideTheme", configService.selectConfigByKey("sys.index.sideTheme"));
        mmap.put("skinName", configService.selectConfigByKey("sys.index.skinName"));
        Boolean footer = Convert.toBool(configService.selectConfigByKey("sys.index.footer"), true);
        Boolean tagsView = Convert.toBool(configService.selectConfigByKey("sys.index.tagsView"), true);
        mmap.put("footer", footer);
        mmap.put("tagsView", tagsView);
        mmap.put("mainClass", contentMainClass(footer, tagsView));
        mmap.put("copyrightYear", RuoYiConfig.getCopyrightYear());
        if (user.getLoginName().equals("admin")) {
            mmap.put("demoEnabled", RuoYiConfig.isDemoEnabled());
        } else {
            mmap.put("demoEnabled", false);
        }
        mmap.put("isDefaultModifyPwd", initPasswordIsModify(user.getPwdUpdateDate()));
        mmap.put("isPasswordExpired", passwordIsExpiration(user.getPwdUpdateDate()));
        mmap.put("isMobile", ServletUtils.checkAgentIsMobile(ServletUtils.getRequest().getHeader("User-Agent")));

        // 菜单导航显示风格
        String menuStyle = configService.selectConfigByKey("sys.index.menuStyle");
        // 移动端，默认使左侧导航菜单，否则取默认配置
        String indexStyle = ServletUtils.checkAgentIsMobile(ServletUtils.getRequest().getHeader("User-Agent")) ? "index" : menuStyle;

        // 优先Cookie配置导航菜单
        Cookie[] cookies = ServletUtils.getRequest().getCookies();
        for (Cookie cookie : cookies)
        {
            if (StringUtils.isNotEmpty(cookie.getName()) && "nav-style".equalsIgnoreCase(cookie.getName()))
            {
                indexStyle = cookie.getValue();
                break;
            }
        }
        String webIndex = "topnav".equalsIgnoreCase(indexStyle) ? "index-topnav" : "index";
        return webIndex;
    }

    // 锁定屏幕
    @GetMapping("/lockscreen")
    public String lockscreen(ModelMap mmap)
    {
        mmap.put("user", getSysUser());
        ServletUtils.getSession().setAttribute(ShiroConstants.LOCK_SCREEN, true);
        return "lock";
    }

    // 解锁屏幕
    @PostMapping("/unlockscreen")
    @ResponseBody
    public AjaxResult unlockscreen(String password)
    {
        SysUser user = getSysUser();
        if (StringUtils.isNull(user))
        {
            return AjaxResult.error("服务器超时，请重新登录");
        }
        if (passwordService.matches(user, password))
        {
            ServletUtils.getSession().removeAttribute(ShiroConstants.LOCK_SCREEN);
            return AjaxResult.success();
        }
        return AjaxResult.error("密码不正确，请重新输入。");
    }

    // 切换主题
    @GetMapping("/system/switchSkin")
    public String switchSkin()
    {
        return "skin";
    }

    // 切换菜单
    @GetMapping("/system/menuStyle/{style}")
    public void menuStyle(@PathVariable String style, HttpServletResponse response)
    {
        CookieUtils.setCookie(response, "nav-style", style);
    }

    // 系统介绍
    @GetMapping("/system/main")
    public String main(ModelMap mmap)
    {
        mmap.put("version", RuoYiConfig.getVersion());

        // 获取当前的用户
        SysUser currentUser = ShiroUtils.getSysUser();
        // 获取分机号
        CcExtNum ccExtNum = ccExtNumService.selectCcExtNumByUserCode(currentUser.getLoginName());

        String extnum = ccExtNum.getExtNum().toString();
        String opnum = ccExtNum.getUserCode();
        String groupId = "1";
        String skillLevel = "9";
        String projectId = "1";
        String loginToken = ccExtNumService.createToken(extnum, opnum, groupId, skillLevel, projectId);
        List<CcGateways> gatewaysList = ccGatewaysService.selectCcGatewaysList(new CcGateways());
        List<JSONObject> gatewayList = new ArrayList<>();
        for (CcGateways ccGateways: gatewaysList) {
            JSONObject configGateway = new JSONObject();
            configGateway.put("uuid", ccGateways.getId().toString());
            configGateway.put("updateTime", ccGateways.getUpdateTime());
            configGateway.put("gatewayAddr", ccGateways.getGwAddr());
            configGateway.put("callerNumber", ccGateways.getCaller());
            configGateway.put("calleePrefix", ccGateways.getCalleePrefix());
            configGateway.put("callProfile", ccGateways.getProfileName());
            configGateway.put("priority", ccGateways.getPriority());
            configGateway.put("concurrency", ccGateways.getMaxConcurrency());
            if (ccGateways.getRegister() == 1) {
                configGateway.put("register", true);
                configGateway.put("authUsername", ccGateways.getAuthUsername());
                configGateway.put("authPassword", ccGateways.getAuthPassword());
            } else {
                configGateway.put("register", false);
            }
            configGateway.put("audioCodec", ccGateways.getCodec());
            gatewayList.add(configGateway);

//            uuid: '01',   // 网关唯一编号;
//            updateTime: 1712611571863,  //网关信息更新时间, 每次修改必须更新这个字段，否则配置无法生效;
//            gatewayAddr: '192.168.67.210:5090',  // 网关地址或名称，  如果是注册模式： 网关地址参数则填写为网关名称;
//            callerNumber: '64901409',                 //主叫号码
//            calleePrefix: '',                    // 被叫前缀
//            priority: 2,                         //优先级，数字越小，越优先被使用;
//            concurrency: 20,                    // 网关并发数，同时支持呼叫数;
//            register: false,                     // 是否为注册模式
//            audioCodec: 'g711'                   // 网关通信语音编码;
        }
        JSONObject callConfig = new JSONObject();

        scriptServer = ccParamsService.getParamValueByCode("call-center-server-ip-addr", "");
        scriptPort = ccParamsService.getParamValueByCode("call-center-websocket-port", "");

        callConfig.put("scriptServer", scriptServer);
        callConfig.put("scriptPort", scriptPort);
        callConfig.put("loginToken", loginToken);
        callConfig.put("gatewayList", gatewayList);
        mmap.put("callConfig", callConfig);
        return "main";
    }

    // content-main class
    public String contentMainClass(Boolean footer, Boolean tagsView)
    {
        if (!footer && !tagsView)
        {
            return "tagsview-footer-hide";
        }
        else if (!footer)
        {
            return "footer-hide";
        }
        else if (!tagsView)
        {
            return "tagsview-hide";
        }
        return StringUtils.EMPTY;
    }

    // 检查初始密码是否提醒修改
    public boolean initPasswordIsModify(Date pwdUpdateDate)
    {
        Integer initPasswordModify = Convert.toInt(configService.selectConfigByKey("sys.account.initPasswordModify"));
        return initPasswordModify != null && initPasswordModify == 1 && pwdUpdateDate == null;
    }

    // 检查密码是否过期
    public boolean passwordIsExpiration(Date pwdUpdateDate)
    {
        Integer passwordValidateDays = Convert.toInt(configService.selectConfigByKey("sys.account.passwordValidateDays"));
        if (passwordValidateDays != null && passwordValidateDays > 0)
        {
            if (StringUtils.isNull(pwdUpdateDate))
            {
                // 如果从未修改过初始密码，直接提醒过期
                return true;
            }
            Date nowDate = DateUtils.getNowDate();
            return DateUtils.differentDaysByMillisecond(nowDate, pwdUpdateDate) > passwordValidateDays;
        }
        return false;
    }

    public static void main(String[] args) {
        try {
            String authTokenSecret = "TeleRobot2048AbDfF@#!";
            //登录成功后生成JWT
            //JWT的header部分,该map可以是空的,因为有默认值{"alg":HS256,"typ":"JWT"}
            Map<String, Object> map = new HashMap<>();
            Calendar instance = Calendar.getInstance();
            instance.add(Calendar.HOUR, 24);
            String token = JWT.create()
                    //添加头部
                    .withHeader(map)
                    //添加payload
                    .withClaim("extnum", "1004")
                    .withClaim("opnum", "jtbank")
                    .withClaim("groupId", "1")
                    .withClaim("skillLevel", "9")
                    .withClaim("projectId", "1942155412793647106")
                    //设置过期时间
                    .withExpiresAt(instance.getTime())
                    //设置签名 密钥
                    .sign(Algorithm.HMAC256(authTokenSecret));
            System.out.println(token);

        } catch (Exception err) {
        }
    }
}
