package com.ruoyi.common.utils.uuid;

import com.ruoyi.common.utils.DateUtils;

import java.util.Date;


public class UuidGenerator {

	  private static final Object syncRoot = new Object();
	  private static final String dateFormat = "yyMMddHHmmss";
	  private static final int maxCounter = 10000;
      private static long lastNumber = maxCounter;
      private static String timeStr = DateUtils.format(new Date(), dateFormat);
      private static String callNodeNo = "0";

      /// <summary>
      /// 返回21为数字的uuid，不重复
      /// 201707021702091002822
      /// </summary>
      /// <returns></returns>
      public static String GetOneUuid()
      {
    	  synchronized (syncRoot)
          {
          	  String currentTimeStr = DateUtils.format(new Date(), dateFormat);
              if (!timeStr.equals(currentTimeStr))
              {
                  lastNumber = maxCounter;
                  timeStr = currentTimeStr;
              }
              lastNumber += 1;
              return timeStr + callNodeNo + lastNumber;
          }
      }
}
