package com.ruoyi.aicall.model;

import lombok.Data;

import java.io.PipedReader;

@Data
public class LlmAccount {

    private String apiKey;

    private String modelName;

    private String serverUrl;

    /**
     *  Large model prompt
     */
    private String llmTips;

    /**
     *  Business knowledge used as context
     */
    private String faqContext;


    /**
     * The voice prompt played when  transferring to agent tips string
     */
    private String transferToAgentTips;

    /**
     * The voice prompt played when call session hangup
     */
    private String hangupTips;

    /**
     * tips for No Voice
     */
    private String customerNoVoiceTips;

    /**
     * The opening remarks of a phone call
     */
    private String openingRemarks;
}

