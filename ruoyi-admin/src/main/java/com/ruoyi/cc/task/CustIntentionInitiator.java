package com.ruoyi.cc.task;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.stereotype.Component;

@Slf4j
@Component
public class CustIntentionInitiator implements ApplicationRunner {
    @Override
    public void run(ApplicationArguments args) {
        // 触发 CustIntentionHandleQueue 的 static 块
        CustIntentionHandleQueue.start();
        log.info("CustIntentionHandleQueue 已触发加载，线程即将启动...");
    }
}
