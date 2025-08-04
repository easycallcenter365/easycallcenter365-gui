package com.ruoyi.web.core.config;

import com.ruoyi.system.service.ISysConfigService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.stereotype.Component;

@Component
@Slf4j
public class VersionCheckRunner implements ApplicationRunner {

    @Value("${sysconfig.sysVersion}")
    private String sysVersion;

    @Autowired
    private ISysConfigService configService;

    @Override
    public void run(ApplicationArguments args) throws Exception {
        String sysVersionDb = configService.selectConfigByKey("sys.version", "v20250805");
        log.info("version number of mysql data records:{}", sysVersionDb);
        log.info("version number of source code:{}", sysVersion);
        if (!sysVersionDb.equals(sysVersion)) {
            log.error("╔════════════════════════════════════════════════════╗");
            log.error("║ Start ERROR!                                       ║ ");
            log.error("║ The version number of the source code:{}    ║ ", sysVersion);
            log.error("║ The version number of the data records:{}   ║ ", sysVersionDb);
            log.error("╚════════════════════════════════════════════════════╝\n");
            throw new IllegalStateException("Start ERROR, The version number of the source code is not match with that of the database data");
        }
    }
}
