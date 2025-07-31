package com.ruoyi.cc.task;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class SchedulTask {

    // 每分钟执行一次
    @Scheduled(cron = "0 0/1 * * * ?")
    public void custIntention() {

    }

}
