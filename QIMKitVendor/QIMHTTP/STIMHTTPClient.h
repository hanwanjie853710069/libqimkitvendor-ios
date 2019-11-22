//
//  STIMHTTPClient.h
//  STIMKitVendor
//
//  Created by 李露 on 2018/8/2.
//  Copyright © 2018年 STIM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "STIMHTTPRequest.h"

@interface STIMHTTPClient : NSObject

+ (void)sendRequest:(STIMHTTPRequest *)request
           complete:(STIMCompleteHandler)completeHandler
            failure:(STIMFailureHandler)failureHandler;

+ (void)sendRequest:(STIMHTTPRequest *)request
      progressBlock:(STIMProgressHandler)progreeBlock
           complete:(STIMCompleteHandler)completeHandler
            failure:(STIMFailureHandler)failureHandler;

@end
