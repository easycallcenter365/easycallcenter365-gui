package com.ruoyi.common.utils;

import java.util.List;

public class CommonUtils {
    public static String getStackTraceString(StackTraceElement[] stackTraceElements){
        StringBuilder stringBuilder = new StringBuilder();
        for (int i = 0; i < stackTraceElements.length; i++) {
            stringBuilder.append("ClassName:");
            stringBuilder.append(stackTraceElements[i].getClassName());
            stringBuilder.append("\n FileName:");
            stringBuilder.append(stackTraceElements[i].getFileName());
            stringBuilder.append("\n LineNumber:");
            stringBuilder.append(stackTraceElements[i].getLineNumber());
            stringBuilder.append("\n MethodName:");
            stringBuilder.append(stackTraceElements[i].getMethodName());
        }
        return stringBuilder.toString();
    }

    public static String ListToString(List<?> objectList) {
        if(objectList.size() == 0) {
            return "";
        }
        return ListToString(objectList, true);
    }

    /**
     * ListToString,是否使用逗号分隔符
     ***/
    public static String ListToString(List<?> objectList, boolean useSpe) {
        StringBuilder sb = new StringBuilder("");
        for (Object ele : objectList) {
            sb.append(ele);
            if (useSpe) {
                sb.append(",");
            }
        }
        String result = sb.toString();
        if (useSpe) {
            result = result.substring(0, result.length() - 1);
        }
        return result;
    }

    /**
     * ListToString, 使用分隔符
     ***/
    public static String ListToString(List<?> objectList, char delimiter) {
        StringBuilder sb = new StringBuilder("");
        for (Object ele : objectList) {
            sb.append(ele);
            sb.append(delimiter);
        }
        String result = sb.toString();
        result = result.substring(0, result.length() - 1);
        return result;
    }

    /**
     *  隐藏敏感字符串
     * @param input
     * @return
     */
    public static String maskStringUtil(String input) {
        if (input == null || input.isEmpty()) {
            return input;
        }

        int length = input.length();
        if (length <= 10) {
            // 场景1：长度≤10，隐藏第4-8位（索引3-7）
            if (length < 10) {
                return repeatString("*", length); // 不足3位直接返回
            }
            int startIdx = 3;
            int endIdx = Math.min(8, length); // 防止越界
            String stars = repeatString("*", endIdx - startIdx);
            return input.substring(0, startIdx) + stars + input.substring(endIdx);
        } else {
            // 场景2：长度>10，仅保留前3位和后3位
            String prefix = input.substring(0, 3);
            String suffix = input.substring(length - 3);
            String stars = repeatString("*", length - 6);
            return prefix + stars + suffix;
        }
    }

    /**
     * 手动实现字符串重复方法（兼容Java 8以下）
     * @param str
     * @param times
     * @return
     */
    private static String repeatString(String str, int times) {
        if (times <= 0) {
            return "";
        }
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < times; i++) {
            sb.append(str);
        }
        return sb.toString();
    }
}
