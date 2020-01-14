//
//  STIMPublicRedefineHeader.h
//  STIMPublicRedefineHeader
//
//  Created by 李海彬 on 11/8/18.
//  Copyright © 2018 STIM. All rights reserved.
//

#ifndef STIMPublicRedefineHeader_h
#define STIMPublicRedefineHeader_h

#if __has_include("STIMLocalLog.h")

    #import "CocoaLumberjack.h"

    static const DDLogLevel ddLogLevel = DDLogLevelAll;
    //是否开启日志，根据项目配置来
    #define NSLog(frmt, ...) DDLogVerbose(frmt, ##__VA_ARGS__)//版本信息为橙色
    #define STIMErrorLog(frmt, ...) DDLogError(frmt, ##__VA_ARGS__)//错误信息为红白
    #define STIMWarnLog(frmt, ...) DDLogWarn(frmt, ##__VA_ARGS__)//警告为黑黄
    #define STIMInfoLog(frmt, ...) DDLogInfo(frmt, ##__VA_ARGS__)//信息为蓝白
    #define STIMDebugLog(frmt, ...) DDLogDebug(frmt, ##__VA_ARGS__)//调试为白黑
    #define STIMVerboseLog(frmt, ...) DDLogVerbose(frmt, ##__VA_ARGS__)//版本信息为橙色

#else

    //是否开启日志，根据项目配置来
    #define NSLog(frmt, ...)
    #define STIMErrorLog(frmt, ...)
    #define STIMWarnLog(frmt, ...)
    #define STIMInfoLog(frmt, ...)
    #define STIMDebugLog(frmt, ...)
    #define STIMVerboseLog(frmt, ...) 

#endif

#endif /* STIMPublicRedefineHeader_h */
