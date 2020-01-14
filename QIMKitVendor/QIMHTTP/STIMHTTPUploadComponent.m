//
//  STIMHTTPUploadComponent.m
//  STIMKitVendor
//
//  Created by 李海彬 on 2018/8/2.
//  Copyright © 2018年 STIM. All rights reserved.
//

#import "STIMHTTPUploadComponent.h"

@implementation STIMHTTPUploadComponent

- (instancetype)initWithDataKey:(NSString *)dataKey filePath:(NSString *)filePath {
    self = [super init];
    if (self) {
        self.dataKey = dataKey;
        self.filePath = filePath;
        self.mimeType  = @"multipart/form-data";
    }
    return self;
}

- (instancetype)initWithDataKey:(NSString *)dataKey fileData:(NSData *)fileData {
    self = [super init];
    if (self) {
        self.dataKey = dataKey;
        self.data = fileData;
        self.mimeType  = @"multipart/form-data";
    }
    return self;
}

@end
