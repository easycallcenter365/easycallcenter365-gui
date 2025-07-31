package com.ruoyi.aicall.llm.impl;

import com.alibaba.fastjson.JSONArray;
import com.ruoyi.aicall.domain.CcLlmAgentAccount;
import com.ruoyi.aicall.llm.AbstractLlmCapability;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class MaxKB extends AbstractLlmCapability {
    @Override
    public String getIntentionByTips(CcLlmAgentAccount ccLlmAgentAccount, JSONArray dialogueContents) {
        String intentionTips = ccLlmAgentAccount.getIntentionTips();
        return null;
    }
}
