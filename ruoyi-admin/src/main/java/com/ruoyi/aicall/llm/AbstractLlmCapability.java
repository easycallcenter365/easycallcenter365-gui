package com.ruoyi.aicall.llm;

import com.alibaba.fastjson.JSONArray;
import com.ruoyi.aicall.domain.CcLlmAgentAccount;
import com.ruoyi.aicall.llm.model.AccountBaseEntity;
import okhttp3.OkHttpClient;

import java.util.concurrent.TimeUnit;

public abstract class AbstractLlmCapability implements ILlmCapability {

    protected AccountBaseEntity llmAccountInfo;

    protected static final OkHttpClient CLIENT =  new OkHttpClient.Builder()
            .connectTimeout(90, TimeUnit.SECONDS)
            .readTimeout(90, TimeUnit.SECONDS)
            .build();

    @Override
    public  void setAccount(AccountBaseEntity llmAccount){
        this.llmAccountInfo = llmAccount;
    }
    @Override
    public AccountBaseEntity getAccount(){
        return llmAccountInfo;
    }

    @Override
    public abstract String getIntentionByTips(CcLlmAgentAccount ccLlmAgentAccount, JSONArray dialogueContents);
}
