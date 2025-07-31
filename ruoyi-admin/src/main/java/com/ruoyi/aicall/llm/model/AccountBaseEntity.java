package com.ruoyi.aicall.llm.model;

 public class AccountBaseEntity {

    public String serverUrl;

    public String provider;

    /**
     * The voice prompt played when  transferring to agent tips string
     */
    public String transferToAgentTips;

    /**
     * The voice prompt played when call session hangup
     */
    public String hangupTips;

    /**
     * tips for No Voice
     */
    public String customerNoVoiceTips;

    /**
     * The opening remarks of a phone call
     */
    public String openingRemarks;


    public String voiceSource;

    public String voiceCode;

    /**
     *   voice interruption supported during the robot's speech:
     *   1：yes, 0：no
     */
    public int interruptFlag;

    /**
     *  List of keywords that support speech interruption.
     */
    public String interruptKeywords;

    /**
     *  List of keywords excluded from triggering speech interruption.
     */
    public String interruptIgnoreKeywords;
}
