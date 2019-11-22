//
//  STIMStringTransformTools.h
//  QunarUGC
//
//  Created by ping.xue on 13-11-11.
//
//

#import "STIMCommonUIFramework.h"

@interface STIMStringTransformTools : NSObject

+ (NSString *)stimDB_CapacityTransformStrWithSize:(long long)size;


+ (NSString *)stimDB_CapacityTransformStrWithSize:(long long)size WithStrLenght:(NSUInteger)length;

@end
