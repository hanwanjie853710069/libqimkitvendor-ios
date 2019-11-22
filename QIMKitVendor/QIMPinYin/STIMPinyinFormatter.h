//
//  
//
//  Created by kimziv on 13-9-14.
//

#ifndef _STIMPinyinFormatter_H_
#define _STIMPinyinFormatter_H_

@class STIMHanyuPinyinOutputFormat;

@interface STIMPinyinFormatter : NSObject {
}

+ (NSString *)formatHanyuPinyinWithNSString:(NSString *)pinyinStr
                withSTIMHanyuPinyinOutputFormat:(STIMHanyuPinyinOutputFormat *)outputFormat;
+ (NSString *)convertToneNumber2ToneMarkWithNSString:(NSString *)pinyinStr;
- (id)init;
@end

#endif // _STIMPinyinFormatter_H_
