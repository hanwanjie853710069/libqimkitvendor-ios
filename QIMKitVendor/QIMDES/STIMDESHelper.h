//
//  STIMDESHelper.h
//  STChatIphone
//
//  Created by 李海彬 on 2018/3/20.
//

#import <Foundation/Foundation.h>

@interface STIMDESHelper : NSObject

+ (instancetype)sharedInstance;

- (NSData *)DESEncrypt:(NSData *)data WithKey:(NSString *)key;

- (NSData *)DESDecrypt:(NSData *)data WithKey:(NSString *)key;

@end
