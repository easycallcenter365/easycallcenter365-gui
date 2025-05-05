package com.ruoyi.cc.model;

import lombok.Data;

@Data
public class FsConfProfile {
    private String profileName; // profile名称
    private String sipPort; // sip端口
    private String sipId; // sip监听地址
}
