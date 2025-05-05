package com.ruoyi.cc.utils;

public class Test {

    public static void main(String[] args) {
        String ccLogFiles = "/home/ipcc/log/call-center.log";
        String ccHisLogFiles = ccLogFiles.replaceAll("\\.log$", "*.log");
        System.out.println(ccHisLogFiles);
    }
}
