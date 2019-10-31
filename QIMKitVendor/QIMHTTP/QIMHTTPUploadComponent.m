//
//  QIMHTTPUploadComponent.m
//  QIMKitVendor
//
//  Created by 李露 on 2018/8/2.
//  Copyright © 2018年 QIM. All rights reserved.
//

#import "QIMHTTPUploadComponent.h"

@implementation QIMHTTPUploadComponent

+(QIMHTTPUploadComponent *)addFromDataWithDataKey:(NSString *)dataKey fileName:(NSString *)fileName filePath:(NSString *)filePath minetype:(NSString *)mimeType fileData:(NSData *)fileData fileUrl:(NSURL * _Nonnull)fileUrl
{
    QIMHTTPUploadComponent * uplopadComponent = [[QIMHTTPUploadComponent alloc]init];
    uplopadComponent.dataKey = dataKey;
    if (fileName) {
        uplopadComponent.fileName = fileName;
    }
    if (filePath) {
        uplopadComponent.filePath = filePath;
    }
    if (mimeType) {
        uplopadComponent.mimeType = mimeType;
    }
    if (fileUrl) {
        uplopadComponent.fileUrl = fileUrl;
    }
    uplopadComponent.fileData = fileData;
    return uplopadComponent;
}
@end
