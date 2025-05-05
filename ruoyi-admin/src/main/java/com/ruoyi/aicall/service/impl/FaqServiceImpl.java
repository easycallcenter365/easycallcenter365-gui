package com.ruoyi.aicall.service.impl;

import com.ruoyi.aicall.model.Faq;
import com.ruoyi.aicall.service.IFaqService;
import com.ruoyi.cc.service.ICcParamsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

@Service
public class FaqServiceImpl implements IFaqService {

    private static final String FAQ_FILE = "/faq/faq.txt";

    @Autowired
    private ICcParamsService ccParamsService;

    /**
     * 获取所有 FAQ 数据
     * @return FAQ 列表
     */
    @Override
    public List<Faq> list() {
        List<Faq> faqList = new ArrayList<>();
        String fsConfDirectory = ccParamsService.getParamValueByCode("fs_conf_directory", "");
        try (BufferedReader reader = new BufferedReader(new FileReader(fsConfDirectory + FAQ_FILE))) {
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
        } catch (IOException e) {
            e.printStackTrace();
        }
        return faqList;
    }

    /**
     * 导入 FAQ 数据
     * @param faqList 要导入的 FAQ 列表
     */
    @Override
    public void importFaq(List<Faq> faqList) {
        saveFaqList(faqList);
    }

    /**
     * 保存 FAQ 列表到文件
     * @param faqList 要保存的 FAQ 列表
     */
    public void saveFaqList(List<Faq> faqList) {
        String fsConfDirectory = ccParamsService.getParamValueByCode("fs_conf_directory", "");
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(fsConfDirectory + FAQ_FILE))) {
            for (Faq faq : faqList) {
                writer.write(faq.getQuestion() + "\n");
                writer.write(faq.getAnswer() + "\n\n");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
