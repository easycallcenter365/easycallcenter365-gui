package com.ruoyi.cc.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.ruoyi.cc.model.FsConfProfile;
import com.ruoyi.cc.service.ICcParamsService;
import com.ruoyi.cc.service.IFsConfService;
import com.ruoyi.common.utils.CommonUtils;
import com.ruoyi.common.utils.ExceptionUtil;
import com.ruoyi.common.utils.StringUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.List;

/**
 * freeswitch配置文件控制service层
 */
@Service
@Slf4j
public class FsConfServiceImpl implements IFsConfService {

    @Autowired
    private ICcParamsService ccParamsService;

//    @Value("${fs.conf.path}")
//    private String confXmlPath;
//    @Value("${fs.conf.template.profile}")
//    private String profileTemplatePath;
//    @Value("${fs.conf.template.gateway-register}")
//    private String registerGatewayTemplatePath;
//    @Value("${fs.conf.template.gateway-unregister}")
//    private String unregisterGatewayTemplatePath;

    @Override
    public void setSwitchConf(JSONArray params) {
        String fsConfDirectory = ccParamsService.getParamValueByCode("fs_conf_directory", "");
        try {
            // 创建DocumentBuilderFactory对象
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            // 创建DocumentBuilder对象
            DocumentBuilder builder = factory.newDocumentBuilder();
            // 解析XML文件获取Document对象
            String switchConfXmlPath = fsConfDirectory + "/autoload_configs/switch.conf.xml";
            Document document = builder.parse(new File(switchConfXmlPath));
            // 获取settings元素
            Element settings = (Element)document.getElementsByTagName("settings").item(0);
            // 更新属性值
            NodeList nodes = settings.getElementsByTagName("param");
            for (int i = 0; i < nodes.getLength(); i++) {
                if (nodes.item(i) instanceof Element) {
                    Element element = (Element) nodes.item(i);
                    log.info(JSONObject.toJSONString(element));
                    for (int j = 0; j < params.size(); j++) {
                        JSONObject param = params.getJSONObject(j);
                        String attrName = param.getString("name");
                        if (attrName.equals(element.getAttribute("name"))) {
                            element.setAttribute("value", param.getString("value").trim());
                        }
                    }
                }
            }
            // 将更新后的Document对象写回XML文件
            TransformerFactory transformerFactory = TransformerFactory.newInstance();
            Transformer transformer = transformerFactory.newTransformer();
            transformer.setOutputProperty(OutputKeys.INDENT, "yes");
            DOMSource source = new DOMSource(document);
            StringWriter writer = new StringWriter();
            transformer.transform(source, new StreamResult(writer));
            String updatedXML = writer.toString();
            // 将updatedXML写入文件
            java.nio.file.Files.write(java.nio.file.Paths.get(switchConfXmlPath), updatedXML.getBytes());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void restartFs() {
        // 使用ProcessBuilder来正确处理命令字符串
        List<String> commands = new ArrayList<>();

        String fsDeployType = ccParamsService.getParamValueByCode("fs-deploy-type", "native");
        if("native".equalsIgnoreCase(fsDeployType)){
            String fsNativeStartUpScript =  ccParamsService.getParamValueByCode(
                    "fs-deploy-native-start-up-script",
                    "/usr/local/freeswitchvideo/bin/freeswitch.sh"
            );
            commands.add("/usr/bin/sh");
            commands.add(fsNativeStartUpScript);
        }else if("docker".equalsIgnoreCase(fsDeployType)){
            String fsDockerContainerName = ccParamsService.getParamValueByCode(
                    "fs_docker_container_name",
                    "freeswitchvideo-debian12"
            );
            commands.add("docker");
            commands.add("restart");
            commands.add(fsDockerContainerName);
        }
        if(commands.size() == 0){
           log.error("fs-deploy-type 参数错误!");
           return;
        }
        try {

            // 使用ProcessBuilder执行命令
            ProcessBuilder processBuilder = new ProcessBuilder(commands);
            Process process = processBuilder.start();

            BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));

            String line;
            while ((line = reader.readLine()) != null) {
                log.info(line);
            }

            // 读取命令的错误输出
            BufferedReader errorReader = new BufferedReader(new InputStreamReader(process.getErrorStream()));
            String errorLine;
            while ((errorLine = errorReader.readLine()) != null) {
                log.info(errorLine);
            }

            int exitCode = process.waitFor(); // 等待进程结束并获取退出值
            if (exitCode == 0) {
                log.info(StringUtils.join(commands.toArray(), " ") + " executed successfully.");
            } else {
                log.info("exitCode:" + exitCode);
                log.info(StringUtils.join(commands.toArray(), " ") + " execution failed.");
            }
        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
        }
    }

    @Override
    public JSONObject getSwitchConf() {
        String fsConfDirectory = ccParamsService.getParamValueByCode("fs_conf_directory", "");
        JSONObject confAllVars = new JSONObject();
        try {
            // 创建DocumentBuilderFactory对象
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            // 创建DocumentBuilder对象
            DocumentBuilder builder = factory.newDocumentBuilder();
            // 解析XML文件获取Document对象
            String switchConfXmlPath = fsConfDirectory + "/autoload_configs/switch.conf.xml";
            Document document = builder.parse(new File(switchConfXmlPath));
            // 获取settings元素
            Element settings = (Element)document.getElementsByTagName("settings").item(0);
            // 获取属性值
            NodeList nodes = settings.getElementsByTagName("param");
            for (int i = 0; i < nodes.getLength(); i++) {
                if (nodes.item(i) instanceof Element) {
                    Element element = (Element) nodes.item(i);
                    confAllVars.put(element.getAttribute("name"), element.getAttribute("value"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return confAllVars;
    }

    @Override
    public String getAsrengine() {
        String fsConfDirectory = ccParamsService.getParamValueByCode("fs_conf_directory", "");
        try {
            // 创建DocumentBuilderFactory对象
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            // 创建DocumentBuilder对象
            DocumentBuilder builder = factory.newDocumentBuilder();
            // 解析XML文件获取Document对象
            String modulesConfXmlPath = fsConfDirectory + "/autoload_configs/modules.conf.xml";
            Document document = builder.parse(new File(modulesConfXmlPath));
            // 获取modules元素
            Element modules = (Element)document.getElementsByTagName("modules").item(0);
            // 获取属性值
            NodeList nodes = modules.getElementsByTagName("load");
            for (int i = 0; i < nodes.getLength(); i++) {
                if (nodes.item(i) instanceof Element) {
                    Element element = (Element) nodes.item(i);
                    if ("mod_xunfei_asr".equals(element.getAttribute("module"))){
                        return "mod_xunfei_asr";
                    }
                    if ("mod_aliyun_asr".equals(element.getAttribute("module"))){
                        return "mod_aliyun_asr";
                    }
                    if ("mod_funasr".equals(element.getAttribute("module"))){
                        return "mod_funasr";
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }

    @Override
    public String setAsrengine(String asrengine) {
        String fsConfDirectory = ccParamsService.getParamValueByCode("fs_conf_directory", "");
        try {
            // 创建DocumentBuilderFactory对象
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            // 创建DocumentBuilder对象
            DocumentBuilder builder = factory.newDocumentBuilder();
            // 解析XML文件获取Document对象
            String modulesConfXmlPath = fsConfDirectory + "/autoload_configs/modules.conf.xml";
            Document document = builder.parse(new File(modulesConfXmlPath));
            // 获取modules元素
            Element modules = (Element)document.getElementsByTagName("modules").item(0);
            // 获取属性值
            NodeList nodes = modules.getElementsByTagName("load");
            Boolean existAsrMod = false;
            for (int i = 0; i < nodes.getLength(); i++) {
                if (nodes.item(i) instanceof Element) {
                    Element element = (Element) nodes.item(i);
                    if ("mod_xunfei_asr".equals(element.getAttribute("module"))
                            || "mod_funasr".equals(element.getAttribute("module"))
                            || "mod_aliyun_asr".equals(element.getAttribute("module"))){
                        existAsrMod = true;
                        if (StringUtils.isNotEmpty(asrengine)) {
                            element.setAttribute("module", asrengine);
                        } else {
                            modules.removeChild(element);
                        }
                    }
                }
            }
            if (!existAsrMod && StringUtils.isNotEmpty(asrengine)) {
                Element element = document.createElement("load");
                element.setAttribute("module", asrengine);
                modules.appendChild(element);
            }
            // 将更新后的Document对象写回XML文件
            TransformerFactory transformerFactory = TransformerFactory.newInstance();
            Transformer transformer = transformerFactory.newTransformer();
            transformer.setOutputProperty(OutputKeys.INDENT, "yes");
            DOMSource source = new DOMSource(document);
            StringWriter writer = new StringWriter();
            transformer.transform(source, new StreamResult(writer));
            String updatedXML = writer.toString();
            // 将updatedXML写入文件
            java.nio.file.Files.write(java.nio.file.Paths.get(modulesConfXmlPath), updatedXML.getBytes());
        } catch (Throwable e) {
           String tips = String.format("更新配置文件 modules.conf.xml 失败, {} {}",
                   e.toString(), CommonUtils.getStackTraceString(e.getStackTrace()));
           log.error(tips);
           return tips;
        }
        return "";
    }

    @Override
    public void setVarsConf(JSONArray params) {
        String fsConfDirectory = ccParamsService.getParamValueByCode("fs_conf_directory", "");
        try {
            // 创建DocumentBuilderFactory对象
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            // 创建DocumentBuilder对象
            DocumentBuilder builder = factory.newDocumentBuilder();
            // 解析XML文件获取Document对象
            String varsConfXmlPath = fsConfDirectory + "/vars.xml";
            Document document = builder.parse(new File(varsConfXmlPath));
            NodeList nodes = document.getElementsByTagName("X-PRE-PROCESS");
            for (int i = 0; i < nodes.getLength(); i++) {
                if (nodes.item(i) instanceof Element) {
                    Element element = (Element) nodes.item(i);
                    log.info(JSONObject.toJSONString(element));
                    for (int j = 0; j < params.size(); j++) {
                        JSONObject param = params.getJSONObject(j);
                        String data = element.getAttribute("data");
                        String name = data.substring(0, data.indexOf("="));
                        String attrName = param.getString("name");
                        if (attrName.equals(name)) {
                            element.setAttribute("data", attrName + "=" + param.getString("value").trim());
                        }
                    }
                }
            }
            // 将更新后的Document对象写回XML文件
            TransformerFactory transformerFactory = TransformerFactory.newInstance();
            Transformer transformer = transformerFactory.newTransformer();
            transformer.setOutputProperty(OutputKeys.INDENT, "yes");
            DOMSource source = new DOMSource(document);
            StringWriter writer = new StringWriter();
            transformer.transform(source, new StreamResult(writer));
            String updatedXML = writer.toString();
            // 将updatedXML写入文件
            java.nio.file.Files.write(java.nio.file.Paths.get(varsConfXmlPath), updatedXML.getBytes());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public JSONObject getVarsConf() {
        JSONObject confAllVars = new JSONObject();
        String fsConfDirectory = ccParamsService.getParamValueByCode("fs_conf_directory", "");
        try {
            // 创建DocumentBuilderFactory对象
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            // 创建DocumentBuilder对象
            DocumentBuilder builder = factory.newDocumentBuilder();
            // 解析XML文件获取Document对象
            String varsConfXmlPath = fsConfDirectory + "/vars.xml";
            Document document = builder.parse(new File(varsConfXmlPath));
            // 获取属性值
            NodeList nodes = document.getElementsByTagName("X-PRE-PROCESS");
            for (int i = 0; i < nodes.getLength(); i++) {
                if (nodes.item(i) instanceof Element) {
                    Element element = (Element) nodes.item(i);
                    String data = element.getAttribute("data");
                    if (StringUtils.isNotEmpty(data)) {
                        String name = data.substring(0, data.indexOf("="));
                        String value = data.substring(data.indexOf("=") + 1);
                        confAllVars.put(name, value);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return confAllVars;
    }

    @Override
    public JSONObject getAsrConf(String asrFileName) {
        JSONObject confAllVars = new JSONObject();
        String fsConfDirectory = ccParamsService.getParamValueByCode("fs_conf_directory", "");
        try {
            // 创建DocumentBuilderFactory对象
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            // 创建DocumentBuilder对象
            DocumentBuilder builder = factory.newDocumentBuilder();
            // 解析XML文件获取Document对象
            String asrConfXmlPath = fsConfDirectory + asrFileName;
            Document document = builder.parse(new File(asrConfXmlPath));
            // 获取settings元素
            Element settings = (Element)document.getElementsByTagName("settings").item(0);
            // 获取属性值
            NodeList nodes = settings.getElementsByTagName("param");
            for (int i = 0; i < nodes.getLength(); i++) {
                if (nodes.item(i) instanceof Element) {
                    Element element = (Element) nodes.item(i);
                    confAllVars.put(element.getAttribute("name"), element.getAttribute("value"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return confAllVars;
    }

    @Override
    public String setAsrConf(JSONArray params, String asrFileName) {
        String fsConfDirectory = ccParamsService.getParamValueByCode("fs_conf_directory", "");
        try {
            // 创建DocumentBuilderFactory对象
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            // 创建DocumentBuilder对象
            DocumentBuilder builder = factory.newDocumentBuilder();
            // 解析XML文件获取Document对象
            String asrConfXmlPath = fsConfDirectory + asrFileName;
            Document document = builder.parse(new File(asrConfXmlPath));
            // 获取settings元素
            Element settings = (Element)document.getElementsByTagName("settings").item(0);
            // 更新属性值
            NodeList nodes = settings.getElementsByTagName("param");
            for (int i = 0; i < nodes.getLength(); i++) {
                if (nodes.item(i) instanceof Element) {
                    Element element = (Element) nodes.item(i);
                    log.info(JSONObject.toJSONString(element));
                    for (int j = 0; j < params.size(); j++) {
                        JSONObject param = params.getJSONObject(j);
                        String attrName = param.getString("name");
                        if (attrName.equals(element.getAttribute("name"))) {
                            element.setAttribute("value", param.getString("value").trim());
                        }
                    }
                }
            }
            // 将更新后的Document对象写回XML文件
            TransformerFactory transformerFactory = TransformerFactory.newInstance();
            Transformer transformer = transformerFactory.newTransformer();
            transformer.setOutputProperty(OutputKeys.INDENT, "yes");
            DOMSource source = new DOMSource(document);
            StringWriter writer = new StringWriter();
            transformer.transform(source, new StreamResult(writer));
            String updatedXML = writer.toString();
            // 将updatedXML写入文件
            java.nio.file.Files.write(java.nio.file.Paths.get(asrConfXmlPath), updatedXML.getBytes());
        } catch (Exception e) {
            String errorDetails = e.toString() + CommonUtils.getStackTraceString(e.getStackTrace());
            log.error("setAsrConf error: {}", errorDetails);
            return errorDetails;
        }
        return "";
    }

    @Override
    public String getCertWssPen() {
        String fsConfDirectory = ccParamsService.getParamValueByCode("fs_conf_directory", "");
        String fileName = fsConfDirectory + "/tls/wss.pem";
        StringBuilder content = new StringBuilder();
        if (!new File(fileName).exists()) {
            return "";
        }
        try (BufferedReader br = new BufferedReader(new FileReader(fileName))) {
            String line;
            while ((line = br.readLine()) != null) {
                content.append(line).append("\n"); // 追加每一行内容，并添加换行符
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return content.toString();
    }

    @Override
    public void setCertWssPen(String certValue) {
        String fsConfDirectory = ccParamsService.getParamValueByCode("fs_conf_directory", "");
        String fileName = fsConfDirectory + "/tls/wss.pem";
        if (!new File(fsConfDirectory + "/tls").exists()) {
            new File(fsConfDirectory + "/tls").mkdirs();
        }
        if (!new File(fileName).exists()) {
            try {
                new File(fileName).createNewFile();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(fileName))) {
            bw.write(certValue);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public String getLogs(String uuid, String logFile, String logType) {
        log.info(logFile);
        // 使用ProcessBuilder来正确处理命令字符串
        String ansiRegex = "\u001b\\[[;\\d]*m"; // 匹配 ANSI 转义序列的正则表达式
        List<String> commands = new ArrayList<>();
        commands.add("sh");
        commands.add("-c");
        commands.add("cat " + logFile + " | grep '" + uuid + "'");
        log.info(StringUtils.join(commands.toArray(), " "));
        String logs = "";
        try {

            // 使用ProcessBuilder执行命令
            ProcessBuilder processBuilder = new ProcessBuilder(commands);
            Process process = processBuilder.start();

            BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));

            String line;
            while ((line = reader.readLine()) != null) {
                if ("fs".equals(logType)) {
                    try{
                        logs += JSONObject.parseObject(line).getString("log").replaceAll(ansiRegex, "") ;
                    }catch (Exception e) {
                        log.error(ExceptionUtil.getExceptionMessage(e));
                    }
                } else {
                    logs += line + "\r\n";
                }
            }

            // 读取命令的错误输出
            BufferedReader errorReader = new BufferedReader(new InputStreamReader(process.getErrorStream()));
            String errorLine;
            while ((errorLine = errorReader.readLine()) != null) {
                log.info(errorLine);
            }
            process.waitFor(); // 等待进程结束并获取退出值
        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
        }
        return logs;
    }

    @Override
    public List<FsConfProfile> selectProfileList() {
        String fsConfDirectory = ccParamsService.getParamValueByCode("fs_conf_directory", "");
        List<FsConfProfile> fsConfProfileList = new ArrayList<>();
        String profilePath = fsConfDirectory + "/sip_profiles";
        File profileDir = new File(profilePath);
        // 过滤出文件夹中所有的文件（非文件夹）
        File[] files = profileDir.listFiles(new FileFilter() {
            public boolean accept(File file) {
                return file.isFile();
            }
        });
        if (files != null) {
            for (File file : files) {
                // 检查文件是否是XML文件
                if (file.getName().endsWith(".xml")) {
                    try {
                        FsConfProfile fsConfProfile = new FsConfProfile();
                        // 创建DocumentBuilderFactory对象
                        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
                        // 创建DocumentBuilder对象
                        DocumentBuilder builder = factory.newDocumentBuilder();
                        // 解析XML文件
                        Document document = builder.parse(file);
                        // profile元素
                        Element profile = (Element)document.getElementsByTagName("profile").item(0);
                        fsConfProfile.setProfileName(profile.getAttribute("name"));
                        // 获取settings元素
                        Element settings = (Element)document.getElementsByTagName("settings").item(0);
                        // 获取属性值
                        NodeList nodes = settings.getElementsByTagName("param");
                        for (int i = 0; i < nodes.getLength(); i++) {
                            if (nodes.item(i) instanceof Element) {
                                Element element = (Element) nodes.item(i);
                                if ("sip-port".equals(element.getAttribute("name"))) {
                                    fsConfProfile.setSipPort(element.getAttribute("value"));
                                }
                                if ("sip-ip".equals(element.getAttribute("name"))) {
                                    fsConfProfile.setSipId(element.getAttribute("value"));
                                }
                            }
                        }
                        fsConfProfileList.add(fsConfProfile);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
        }
        return fsConfProfileList;
    }

    @Override
    public void setProfileConf(String profileName, String profileType, JSONArray params) {
        String fsConfDirectory = ccParamsService.getParamValueByCode("fs_conf_directory", "");
        try {
            // 创建DocumentBuilderFactory对象
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            // 创建DocumentBuilder对象
            DocumentBuilder builder = factory.newDocumentBuilder();
            // 解析XML文件获取Document对象
            String profilefXmlPath = fsConfDirectory + "/sip_profiles/" + profileName + ".xml";
            File profilefXmlFile = new File(profilefXmlPath);
            if (!profilefXmlFile.exists()) {
                // 如果xml文件不存在（新增profile），则先从模板文件里拷贝一份，并创建对应的文件夹
                try {
                    // 使用Files.copy方法拷贝文件
                    Files.copy(Paths.get(fsConfDirectory + "/template/" + profileType + ".xml"), Paths.get(profilefXmlPath), StandardCopyOption.REPLACE_EXISTING);
                    log.info("文件拷贝成功！");
                    new File(fsConfDirectory + "/sip_profiles/" + profileName).mkdirs();
                    log.info("创建文件夹成功！");
                } catch (IOException e) {
                    e.printStackTrace();
                    log.info("文件拷贝失败！");
                }
            }
            Document document = builder.parse(profilefXmlFile);
            // profile元素
            Element profile = (Element)document.getElementsByTagName("profile").item(0);
            profile.setAttribute("name", profileName);
            // 获取X-PRE-PROCESS元素，修改data
            Element gatways = (Element)document.getElementsByTagName("X-PRE-PROCESS").item(0);
            gatways.setAttribute("data", profileName + "/*.xml");
            // 获取settings元素
            Element settings = (Element)document.getElementsByTagName("settings").item(0);
            // 更新属性值
            NodeList nodes = settings.getElementsByTagName("param");
            for (int j = 0; j < params.size(); j++) {
                JSONObject param = params.getJSONObject(j);
                String attrName = param.getString("name");
                String attrValue = param.getString("value");
                // 忽略参数名或者参数值为空的参数
                if (StringUtils.isBlank(attrName)
                        || StringUtils.isBlank(attrValue)) {
                    continue;
                }
                Boolean newParams = true; // 是否是新增参数
                for (int i = 0; i < nodes.getLength(); i++) {
                    if (nodes.item(i) instanceof Element) {
                        Element element = (Element) nodes.item(i);
                        if (attrName.equals(element.getAttribute("name"))) {
                            newParams = false;
                            element.setAttribute("value", param.getString("value").trim());
                        }
                    }
                }
                if (newParams) {
                    log.info("新增属性:{}", JSONObject.toJSONString(param));
                    Element element = document.createElement("param");
                    element.setAttribute("name", param.getString("name").trim());
                    element.setAttribute("value", param.getString("value").trim());
                    settings.appendChild(element);
                }
            }
            // 将更新后的Document对象写回XML文件
            TransformerFactory transformerFactory = TransformerFactory.newInstance();
            Transformer transformer = transformerFactory.newTransformer();
            transformer.setOutputProperty(OutputKeys.INDENT, "yes");
            DOMSource source = new DOMSource(document);
            StringWriter writer = new StringWriter();
            transformer.transform(source, new StreamResult(writer));
            String updatedXML = writer.toString();
            // 将updatedXML写入文件
            java.nio.file.Files.write(java.nio.file.Paths.get(profilefXmlPath), updatedXML.getBytes());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public JSONObject getProfileConf(String profileName, String profileType) {
        String fsConfDirectory = ccParamsService.getParamValueByCode("fs_conf_directory", "");
        String profilefXmlPath = "";
        if (StringUtils.isBlank(profileName)) {
            // 新增
            profilefXmlPath = fsConfDirectory + "/template/" + profileType + ".xml";
        } else {
            // 更新/查看
            profilefXmlPath = fsConfDirectory + "/sip_profiles/" + profileName + ".xml";
        }
        JSONObject confAllVars = new JSONObject();
        try {
            // 创建DocumentBuilderFactory对象
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            // 创建DocumentBuilder对象
            DocumentBuilder builder = factory.newDocumentBuilder();
            // 解析XML文件获取Document对象
            Document document = builder.parse(new File(profilefXmlPath));
            // 获取settings元素
            Element settings = (Element)document.getElementsByTagName("settings").item(0);
            // 获取属性值
            NodeList nodes = settings.getElementsByTagName("param");
            for (int i = 0; i < nodes.getLength(); i++) {
                if (nodes.item(i) instanceof Element) {
                    Element element = (Element) nodes.item(i);
                    confAllVars.put(element.getAttribute("name"), element.getAttribute("value"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return confAllVars;
    }

    @Override
    public void setGwRegisterConf(String orginProfileName, String profileName, String gwName, JSONObject params) {
        String fsConfDirectory = ccParamsService.getParamValueByCode("fs_conf_directory", "");
        setGwConf(fsConfDirectory + "/template/MRWG1.xml", orginProfileName, profileName, gwName, params);
    }

    @Override
    public void setGwUnRegisterConf(String orginProfileName, String profileName, String gwName, JSONObject params) {
        String fsConfDirectory = ccParamsService.getParamValueByCode("fs_conf_directory", "");
        setGwConf(fsConfDirectory + "/template/MRWG0.xml", orginProfileName, profileName, gwName, params);
    }

    private void setGwConf(String gwTemplate, String orginProfileName, String profileName, String gwName, JSONObject params) {
        String fsConfDirectory = ccParamsService.getParamValueByCode("fs_conf_directory", "");
        try {
            // 创建DocumentBuilderFactory对象
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            // 创建DocumentBuilder对象
            DocumentBuilder builder = factory.newDocumentBuilder();
            // 如果修改了profile，则删除原文件
            if (StringUtils.isNotEmpty(orginProfileName) && !orginProfileName.equals(profileName)) {
                String orignGatewayXmlPath = fsConfDirectory + "/sip_profiles/" + orginProfileName + "/" + gwName + ".xml";
                try {
                    Files.delete(Paths.get(orignGatewayXmlPath));
                    log.info("文件删除成功！");
                } catch (Exception e) {
                    log.error("删除文件失败:{}", orignGatewayXmlPath);
                    log.error(ExceptionUtil.getExceptionMessage(e));
                }
            }
            // 如果目录不存在则自动创建
            File profileDir = new File(fsConfDirectory + "/sip_profiles/" + profileName);
            if (!profileDir.exists()) {
                profileDir.mkdirs();
            }
            // 解析XML文件获取Document对象
            String gatewayXmlPath = fsConfDirectory + "/sip_profiles/" + profileName + "/" + gwName + ".xml";
            File profilefXmlFile = new File(gatewayXmlPath);
            // 每次都从模板文件里拷贝一份，并覆盖参数值，确保修改是否注册模式时属性正确
            try {
                // 使用Files.copy方法拷贝文件
                Files.copy(Paths.get(gwTemplate), Paths.get(gatewayXmlPath), StandardCopyOption.REPLACE_EXISTING);
                log.info("文件拷贝成功！");
            } catch (IOException e) {
                e.printStackTrace();
                log.info("文件拷贝失败！");
            }
            Document document = builder.parse(profilefXmlFile);
            // gateway元素
            Element gateway = (Element)document.getElementsByTagName("gateway").item(0);
            gateway.setAttribute("name", gwName);
            // 更新属性值
            NodeList nodes = document.getElementsByTagName("param");
            for (String attrName: params.keySet()) {
                String attrValue = params.getString(attrName);
                // 忽略参数名或者参数值为空的参数
                if (StringUtils.isBlank(attrName)
                        || StringUtils.isBlank(attrValue)) {
                    continue;
                }
                Boolean newParams = true; // 是否是新增参数
                for (int i = 0; i < nodes.getLength(); i++) {
                    if (nodes.item(i) instanceof Element) {
                        Element element = (Element) nodes.item(i);
                        if (attrName.equals(element.getAttribute("name"))) {
                            newParams = false;
                            element.setAttribute("value", attrValue.trim());
                        }
                    }
                }
                if (newParams) {
                    log.info("新增属性:{}", attrName);
                    Element element = document.createElement("param");
                    element.setAttribute("name", attrName);
                    element.setAttribute("value", attrValue.trim());
                    gateway.appendChild(element);
                }
            }
            // 将更新后的Document对象写回XML文件
            TransformerFactory transformerFactory = TransformerFactory.newInstance();
            Transformer transformer = transformerFactory.newTransformer();
            transformer.setOutputProperty(OutputKeys.INDENT, "yes");
            DOMSource source = new DOMSource(document);
            StringWriter writer = new StringWriter();
            transformer.transform(source, new StreamResult(writer));
            String updatedXML = writer.toString();
            // 将updatedXML写入文件
            java.nio.file.Files.write(java.nio.file.Paths.get(gatewayXmlPath), updatedXML.getBytes());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        String certValue = "123";
        String fileName =  "D:\\liliqiang\\ruoyi\\test\\wss.pem";
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(fileName))) {
            bw.write(certValue);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
