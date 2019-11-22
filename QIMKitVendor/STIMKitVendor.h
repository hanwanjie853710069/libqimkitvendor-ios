//
//  STIMKitVendor.h
//  STIMKitVendor
//
//  Created by 李露 on 2018/4/25.
//  Copyright © 2018年 QIM. All rights reserved.
//

#import <UIKit/UIKit.h>

//! Project version number for STIMKitVendor.
FOUNDATION_EXPORT double STIMKitVendorVersionNumber;

//! Project version string for STIMKitVendor.
FOUNDATION_EXPORT const unsigned char STIMKitVendorVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <STIMKitVendor/PublicHeader.h>
#import "CocoaLumberjack.h"

static const DDLogLevel ddLogLevel = DDLogLevelVerbose;
//是否开启日志，根据项目配置来
#define NSLog(frmt, ...) DDLogVerbose(frmt, ##__VA_ARGS__)//版本信息为橙色
#define QIMErrorLog(frmt, ...) DDLogError(frmt, ##__VA_ARGS__)//错误信息为红白
#define QIMWarnLog(frmt, ...) DDLogWarn(frmt, ##__VA_ARGS__)//警告为黑黄
#define QIMInfoLog(frmt, ...) DDLogInfo(frmt, ##__VA_ARGS__)//信息为蓝白
#define QIMDebugLog(frmt, ...) DDLogDebug(frmt, ##__VA_ARGS__)//调试为白黑
#define QIMVerboseLog(frmt, ...) DDLogVerbose(frmt, ##__VA_ARGS__)//版本信息为橙色
