package com.ruoyi.aicall.model;

import lombok.Data;

import java.util.UUID;

@Data
public class Faq {
    private String question;
    private String answer;

    // 无参构造函数
    public Faq() {
    }

    public Faq(String question, String answer) {
        this.question = question;
        this.answer = answer;
    }
}
