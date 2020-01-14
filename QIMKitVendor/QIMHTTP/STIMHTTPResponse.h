//
//  STIMHTTPResponse.h
//  STIMKitVendor
//
//  Created by 李海彬 on 2018/8/2.
//  Copyright © 2018年 STIM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STIMHTTPResponse : NSObject

@property (nonatomic) NSInteger code;
@property (nonatomic, strong) NSData *data;
@property (nonatomic, copy) NSString *responseString;

@end
