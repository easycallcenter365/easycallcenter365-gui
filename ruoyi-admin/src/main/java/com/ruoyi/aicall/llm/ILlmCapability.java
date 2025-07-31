package com.ruoyi.aicall.llm;

import com.alibaba.fastjson.JSONArray;
import com.ruoyi.aicall.domain.CcLlmAgentAccount;
import com.ruoyi.aicall.llm.model.AccountBaseEntity;

public interface ILlmCapability {

    String getIntentionByTips(CcLlmAgentAccount ccLlmAgentAccount, JSONArray dialogueContents);

    void setAccount(AccountBaseEntity llmAccount);

    AccountBaseEntity getAccount();

}
