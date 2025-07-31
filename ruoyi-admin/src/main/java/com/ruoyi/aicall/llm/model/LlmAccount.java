package com.ruoyi.aicall.llm.model;

import lombok.Data;

@Data
public class LlmAccount extends AccountBaseEntity {

  private String apiKey;

  private String modelName;

    /**
     *  Large Language model prompt
     */
  private String llmTips;

    /**
     *  Business knowledge used as context
     */
  private String faqContext;
}
