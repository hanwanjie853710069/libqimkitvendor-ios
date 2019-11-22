//
//  STIMHTTPClient.m
//  STIMKitVendor
//
//  Created by 李露 on 2018/8/2.
//  Copyright © 2018年 STIM. All rights reserved.
//

#import "STIMHTTPClient.h"
#import "STIMHTTPResponse.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "STIMJSONSerializer.h"
#import "STIMWatchDog.h"
#import "STIMPublicRedefineHeader.h"

static NSString *baseUrl = nil;

@implementation STIMHTTPClient

+ (NSString *)baseUrl {
    return baseUrl;
}

+ (void)configBaseUrl:(NSString *)httpBaseurl {
    if (httpBaseurl.length > 0) {
        baseUrl = httpBaseurl;
    }
}

+ (void)sendRequestWithUrl:(NSString * _Nonnull)url requesetMethod:(STIMHTTPMethod)method requestBody:(id)httpBody requestHeaders:(NSDictionary <NSString *, NSString *> *)httpHeaders complete:(STIMCompleteHandler)completeHandler failure:(STIMFailureHandler)failureHandler {
    
}

+ (void)sendRequest:(STIMHTTPRequest *)request complete:(STIMCompleteHandler)completeHandler failure:(STIMFailureHandler)failureHandler {
    if (request.uploadComponents.count > 0 || request.postParams || request.HTTPBody) {
        request.HTTPMethod = STIMHTTPMethodPOST;
    }
    if (request.HTTPMethod == STIMHTTPMethodGET) {
        [STIMHTTPClient getMethodRequest:request progressBlock:nil complete:completeHandler failure:failureHandler];
    } else if (request.HTTPMethod == STIMHTTPMethodPOST) {
        [STIMHTTPClient postMethodRequest:request progressBlock:nil complete:completeHandler failure:failureHandler];
    } else {
        
    }
}

+ (void)sendRequest:(STIMHTTPRequest *)request progressBlock:(STIMProgressHandler)progreeBlock complete:(STIMCompleteHandler)completeHandler failure:(STIMFailureHandler)failureHandler {
    if (request.uploadComponents.count > 0 || request.postParams || request.HTTPBody) {
        request.HTTPMethod = STIMHTTPMethodPOST;
    }
    if (request.HTTPMethod == STIMHTTPMethodGET) {
        [STIMHTTPClient getMethodRequest:request progressBlock:progreeBlock complete:completeHandler failure:failureHandler];
    } else if (request.HTTPMethod == STIMHTTPMethodPOST) {
        [STIMHTTPClient postMethodRequest:request progressBlock:progreeBlock complete:completeHandler failure:failureHandler];
    } else {
        
    }
}

+ (void)getMethodRequest:(STIMHTTPRequest *)request
           progressBlock:(STIMProgressHandler)progreeBlock
                complete:(STIMCompleteHandler)completeHandler
                 failure:(STIMFailureHandler)failureHandler {
    ASIHTTPRequest *asiRequest = [ASIHTTPRequest requestWithURL:request.url];
    [asiRequest setRequestMethod:@"GET"];
    [self configureASIRequest:asiRequest STIMHTTPRequest:request progressBlock:progreeBlock complete:completeHandler failure:failureHandler];
    if (request.shouldASynchronous) {
        [asiRequest startAsynchronous];
    } else {
        [asiRequest startSynchronous];
    }
}

+ (void)postMethodRequest:(STIMHTTPRequest *)request
            progressBlock:(STIMProgressHandler)progreeBlock
                 complete:(STIMCompleteHandler)completeHandler
                  failure:(STIMFailureHandler)failureHandler {
    ASIFormDataRequest *asiRequest = [ASIFormDataRequest requestWithURL:request.url];
    [asiRequest setRequestMethod:@"POST"];
    if (request.postParams) {
        for (id key in request.postParams) {
            [asiRequest setPostValue:request.postParams[key] forKey:key];
        }
    } else {
        if (request.HTTPBody) {
            id bodyStr = [[STIMJSONSerializer sharedInstance] deserializeObject:request.HTTPBody error:nil];
            STIMVerboseLog(@"STIMHTTPRequest请求Url : %@, Body :%@,", request.url, bodyStr);
            [asiRequest setPostBody:[NSMutableData dataWithData:request.HTTPBody]];
        }
    }
    if (request.uploadComponents) {
        for (NSInteger i = 0; i < request.uploadComponents.count; i++) {
            STIMHTTPUploadComponent *component = request.uploadComponents[i];
            if (component.filePath) {
                [asiRequest addFile:component.filePath withFileName:component.fileName andContentType:component.mimeType forKey:component.dataKey];
            } else if (component.data) {
                [asiRequest addData:component.data withFileName:component.fileName andContentType:component.mimeType forKey:component.dataKey];
            }
            NSDictionary *uploadBodyDic = component.bodyDic;
            for (NSString *uploadBodyKey in component.bodyDic.allKeys) {
                [asiRequest addPostValue:[uploadBodyDic objectForKey:uploadBodyKey] forKey:uploadBodyKey];
            }
        }
    }
    [self configureASIRequest:asiRequest STIMHTTPRequest:request progressBlock:progreeBlock complete:completeHandler failure:failureHandler];
    STIMVerboseLog(@"startSynchronous获取当前线程1 :%@, %@",dispatch_get_current_queue(),  request.url);
    CFAbsoluteTime startTime = [[STIMWatchDog sharedInstance] startTime];
    if (request.shouldASynchronous) {
        [asiRequest startAsynchronous];
    } else {
        [asiRequest startSynchronous];
    }
    STIMVerboseLog(@"startSynchronous获取当前线程2 :%@,  %@, %lf", dispatch_get_current_queue(), request.url, [[STIMWatchDog sharedInstance] escapedTimewithStartTime:startTime]);
}

+ (void)configureASIRequest:(ASIHTTPRequest *)asiRequest
              STIMHTTPRequest:(STIMHTTPRequest *)request
              progressBlock:(STIMProgressHandler)progreeBlock
                   complete:(STIMCompleteHandler)completeHandler
                    failure:(STIMFailureHandler)failureHandler {
    [asiRequest setNumberOfTimesToRetryOnTimeout:2];
    [asiRequest setValidatesSecureCertificate:asiRequest.validatesSecureCertificate];
    [asiRequest setTimeOutSeconds:request.timeoutInterval];
    [asiRequest setAllowResumeForFileDownloads:YES];
    if (request.HTTPRequestHeaders) {
        [asiRequest setUseCookiePersistence:NO];
        NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:request.HTTPRequestHeaders];
        [asiRequest setRequestHeaders:dict];
    } else {
        //默认加载Cookie
        [asiRequest setUseCookiePersistence:YES];
    }
    if (request.downloadDestinationPath) { //有下载路径时，认为是下载
        [asiRequest setDownloadDestinationPath:request.downloadDestinationPath];
        [asiRequest setTemporaryFileDownloadPath:request.downloadTemporaryPath];
    }
    __weak typeof(asiRequest) weakAsiRequest = asiRequest;
    asiRequest.completionBlock = ^{
        __strong typeof(weakAsiRequest) strongAsiRequest = weakAsiRequest;
        STIMHTTPResponse *response = [STIMHTTPResponse new];
        response.code = strongAsiRequest.responseStatusCode;
        response.data = strongAsiRequest.responseData;
        response.responseString = strongAsiRequest.responseString;
        STIMVerboseLog(@"【RequestUrl : %@\n RequestHeader : %@\n Response : %@\n", weakAsiRequest.url, weakAsiRequest.requestHeaders, response);
        if (completeHandler) {
            completeHandler(response);
        }
    };
    [asiRequest setFailedBlock:^{
        __strong typeof(weakAsiRequest) strongAsiRequest = weakAsiRequest;
        if (failureHandler) {
            STIMVerboseLog(@"Error : %@", strongAsiRequest.error);
            failureHandler(strongAsiRequest.error);
        }
    }];
    __block long long receiveSize = 0;
    [asiRequest setBytesSentBlock:^(unsigned long long size, unsigned long long total) {
        receiveSize += size;
        float progress = (float)receiveSize/total;
        STIMVerboseLog(@"sent progressValue22 : %lf", progress);
        if (progreeBlock) {
            progreeBlock(progress);
        }
    }];
    [asiRequest setBytesReceivedBlock:^(unsigned long long size, unsigned long long total) {
        receiveSize += size;
        float progress = (float)receiveSize/total;
        STIMVerboseLog(@"download progressValue : %lf", progress);
        if (progreeBlock) {
            progreeBlock(progress);
        }
    }];
}

@end
