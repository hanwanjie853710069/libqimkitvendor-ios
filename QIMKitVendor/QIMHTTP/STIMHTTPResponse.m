//
//  STIMHTTPResponse.m
//  STIMKitVendor
//
//  Created by 李露 on 2018/8/2.
//  Copyright © 2018年 STIM. All rights reserved.
//

#import "STIMHTTPResponse.h"

@implementation STIMHTTPResponse

- (NSString *)description {
    return [NSString stringWithFormat:@"\n ResponseCode : %d \n ResponseString : %@ \n ", self.code, self.responseString];
}

@end
