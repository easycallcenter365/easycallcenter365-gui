package com.ruoyi.aicall.model;


import lombok.Data;

@Data
public class CozeAccount {

    private String serverUrl;
    private String botId;

    /**
     *  available tokenType enums:
     *  oauth、pat
     */
    private String tokenType;

    private String patToken;

    private String oauthClientId;
    private String oauthPrivateKey;
    private String oauthPublicKeyId;

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

