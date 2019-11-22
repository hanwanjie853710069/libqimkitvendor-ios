//
//  
//
//  Created by kimziv on 13-9-14.
//

#ifndef _STIMChineseToPinyinResource_H_
#define _STIMChineseToPinyinResource_H_



#import <Foundation/Foundation.h>

@class NSArray;
@class NSMutableDictionary;

@interface STIMChineseToPinyinResource : NSObject {
    NSString* _directory;
    NSDictionary *_unicodeToHanyuPinyinTable;
}
//@property(nonatomic, strong)NSDictionary *unicodeToHanyuPinyinTable;

- (id)init;
- (void)initializeResource;
- (NSArray *)getHanyuPinyinStringArrayWithChar:(unichar)ch;
- (BOOL)isValidRecordWithNSString:(NSString *)record;
- (NSString *)getHanyuPinyinRecordFromCharWithChar:(unichar)ch;
+ (STIMChineseToPinyinResource *)getInstance;

@end



#endif // _STIMChineseToPinyinResource_H_
