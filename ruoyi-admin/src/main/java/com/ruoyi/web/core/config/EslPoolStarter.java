package com.ruoyi.web.core.config;

import com.ruoyi.cc.service.ICcParamsService;
import link.thingscloud.freeswitch.esl.EslConnectionDetail;
import link.thingscloud.freeswitch.esl.EslConnectionUtil;
import link.thingscloud.freeswitch.esl.FreeswitchNodeInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class EslPoolStarter implements ApplicationListener<ApplicationReadyEvent> {

    protected final static Logger logger = LoggerFactory.getLogger(EslPoolStarter.class);
    @Autowired
    private ICcParamsService ccParamsService;

    @Override
    public void onApplicationEvent(ApplicationReadyEvent applicationReadyEvent) {
        logger.info("try to create FreeSWITCH esl connection pool...");
        List<String> eventSubscriptions = new ArrayList<>();

         String eventsocketip = ccParamsService.getParamValueByCode(
                 "event-socket-ip", "127.0.0.1");
         String eventsocketport = ccParamsService.getParamValueByCode(
                 "event-socket-port", "8021");
         String eventsocketpass= ccParamsService.getParamValueByCode(
                 "event-socket-pass", "ClueCon");
         String eventsocketpoolsize= ccParamsService.getParamValueByCode(
                 "event-socket-conn-pool-size", "3");

        EslConnectionDetail.setEventSubscriptions(eventSubscriptions);
        List<FreeswitchNodeInfo> nodeList = new ArrayList<>(8);
		// read from application.properties
        String host = eventsocketip;
        int port = Integer.parseInt(eventsocketport);
        String pass = eventsocketpass;
        int poolSize = Integer.parseInt(eventsocketpoolsize);
        FreeswitchNodeInfo nodeInfo = new FreeswitchNodeInfo();
        nodeInfo.setHost(host);
        nodeInfo.setPort(port);
        nodeInfo.setPass(pass);
        nodeInfo.setPoolSize(poolSize);
        nodeList.add(nodeInfo);
        EslConnectionUtil.initConnPool(nodeList);
        EslConnectionUtil.setEslExecuteTime(18000);
    }
}
