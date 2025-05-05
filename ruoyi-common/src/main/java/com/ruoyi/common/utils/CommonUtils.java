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

}
