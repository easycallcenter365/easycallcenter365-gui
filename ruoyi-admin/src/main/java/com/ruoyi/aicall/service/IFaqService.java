package com.ruoyi.aicall.service;

import com.ruoyi.aicall.model.Faq;

import java.util.List;

public interface IFaqService {

    List<Faq> list();

    void importFaq(List<Faq> faqList);

    void saveFaqList(List<Faq> faqs);
}
