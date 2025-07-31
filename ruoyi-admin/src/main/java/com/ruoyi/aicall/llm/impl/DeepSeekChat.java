package com.ruoyi.aicall.llm.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.ruoyi.aicall.domain.CcLlmAgentAccount;
import com.ruoyi.aicall.llm.AbstractLlmCapability;
import com.ruoyi.aicall.llm.model.LlmAccount;
import com.ruoyi.common.utils.ExceptionUtil;
import com.ruoyi.common.utils.StringUtils;
import lombok.extern.slf4j.Slf4j;
import okhttp3.*;
import okio.BufferedSource;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Slf4j
public class DeepSeekChat extends AbstractLlmCapability {
    @Override
    public String getIntentionByTips(CcLlmAgentAccount ccLlmAgentAccount, JSONArray dialogueContents) {
        try {
            log.info("进入DeepSeekChat处理逻辑");
            // 构造请求体
            JSONObject params = new JSONObject();
            params.put("model", ((LlmAccount)getAccount()).getModelName());
            params.put("enable_thinking", false);
            JSONArray messages = new JSONArray();
            JSONObject message1 = new JSONObject();
            message1.put("role", "system");
            message1.put("content", ccLlmAgentAccount.getIntentionTips());
            messages.add(message1);
            JSONObject message2 = new JSONObject();
            message2.put("role", "user");
            message2.put("content", JSONObject.toJSONString(dialogueContents));
            messages.add(message2);
            params.put("messages", messages);

            RequestBody requestBody = FormBody.create(MediaType.parse("application/json; charset=utf-8"), JSONObject.toJSONString(params));
            Request request = new Request.Builder()
                    .post(requestBody)
                    .header("Authorization", "Bearer " + ((LlmAccount)getAccount()).getApiKey())
                    .header("Content-Type", "application/json")
                    .url(getAccount().serverUrl).build();

            Response response = null;
            try {
                response = CLIENT.newCall(request).execute();
                String responseBody = response.body().string();
                log.info("Response: " + responseBody);
                if (response.isSuccessful() && response.body() != null) {
                    return JSONObject.parseObject(responseBody).getJSONArray("choices").getJSONObject(0).getJSONObject("message").getString("content");
                } else {
                    log.error("Request failed: " + response.code());
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
            return "";

        } catch (Exception e) {
            log.error("DeepSeekChat处理客户意向异常" + ExceptionUtil.getExceptionMessage(e));
        }
        return null;
    }
}
