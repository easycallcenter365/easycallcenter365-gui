package com.ruoyi.aicall.controller;

import com.ruoyi.aicall.model.Faq;
import com.ruoyi.aicall.service.IFaqService;
import com.ruoyi.common.core.domain.AjaxResult;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/aicall/faq")
public class FaqController {

    private String prefix = "aicall/faq";

    @Autowired
    private IFaqService faqService;

    @RequiresPermissions("aicall:faq:view")
    @GetMapping()
    public String faq()
    {
        return prefix + "/faq";
    }

    @GetMapping("/list")
    @ResponseBody
    public List<Faq> list() {
        return faqService.list();
    }

    @GetMapping("/export")
    @ResponseBody
    public void export(HttpServletResponse response) throws IOException {
        List<Faq> faqList = faqService.list();
        StringBuilder content = new StringBuilder();
        for (Faq faq : faqList) {
            content.append(faq.getQuestion()).append("\n");
            content.append(faq.getAnswer()).append("\n\n");
        }
        response.setContentType("application/octet-stream");
        response.setHeader("Content-Disposition", "attachment; filename=faq.txt");
        response.getOutputStream().write(content.toString().getBytes("UTF-8"));
    }

    @PostMapping("/import")
    @ResponseBody
    public void importFaq(@RequestParam("file") MultipartFile file) throws IOException {
        List<Faq> faqList = new ArrayList<>();
        BufferedReader reader = new BufferedReader(new InputStreamReader(file.getInputStream(), "UTF-8"));
        String line;
        StringBuilder question = new StringBuilder();
        StringBuilder answer = new StringBuilder();
        while ((line = reader.readLine()) != null) {
            if (line.trim().isEmpty()) {
                if (!question.toString().isEmpty() && !answer.toString().isEmpty()) {
                    faqList.add(new Faq(question.toString(), answer.toString()));
                    question = new StringBuilder();
                    answer = new StringBuilder();
                }
            } else if (question.toString().isEmpty()) {
                question.append(line);
            } else {
                answer.append(line);
            }
        }
        if (!question.toString().isEmpty() && !answer.toString().isEmpty()) {
            faqList.add(new Faq(question.toString(), answer.toString()));
        }
        faqService.importFaq(faqList);
    }

    @PostMapping("/batchSave")
    @ResponseBody
    public AjaxResult batchSaveFaqs(@RequestBody List<Faq> faqs) {
        faqService.saveFaqList(faqs);
        return AjaxResult.success();
    }
}
