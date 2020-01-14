//
//  STIMHTTPRequest.m
//  STIMKitVendor
//
//  Created by 李海彬 on 2018/8/2.
//  Copyright © 2018年 STIM. All rights reserved.
//

#import "STIMHTTPRequest.h"

@implementation STIMHTTPRequest

- (instancetype)initWithURL:(NSURL *)url{
    if (self = [super init]) {
        _url = url;
        _timeoutInterval = 10;
        _HTTPMethod = STIMHTTPMethodGET;
    }
    return self;
}

+ (instancetype)requestWithURL:(NSURL *)url {
    return [[self alloc] initWithURL:url];
}

@end
