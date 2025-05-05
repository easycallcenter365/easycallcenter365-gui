package com.ruoyi.cc.controller;

import com.ruoyi.cc.service.ICcParamsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.nio.file.Path;
import java.nio.file.Paths;
import com.ruoyi.common.core.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;


/**
 * freeswitch配置文件控制层
 */
@Controller
@RequestMapping("/recordings")
public class RecordingFileController extends BaseController {
    @Autowired
    private ICcParamsService ccParamsService;

    @GetMapping("/files")
    public ResponseEntity<Resource> downloadFile(@RequestParam String filename) {
        try {
            logger.info(filename);
            String wavBasePath = ccParamsService.getParamValueByCode(
                    "recording_path", "/home/Records/");
            Path file = Paths.get(wavBasePath).resolve(filename).normalize();
            Resource resource = new UrlResource(file.toUri());
            if (resource.exists() || resource.isReadable()) {
                return ResponseEntity.ok()
                        .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + resource.getFilename() + "\"")
                        .body(resource);
            } else {
                return ResponseEntity.notFound().build();
            }
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(null);
        }
    }
}
