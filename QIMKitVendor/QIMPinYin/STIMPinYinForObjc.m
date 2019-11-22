//
//  STIMPinYinForObjc.m
//  Search
//
//  Created by LYZ on 14-1-24.
//  Copyright (c) 2014年 LYZ. All rights reserved.
//

#import "STIMPinYinForObjc.h"

@implementation STIMPinYinForObjc

+ (NSString*)chineseConvertToPinYin:(NSString*)chinese {
    NSString *sourceText = chinese;
    STIMHanyuPinyinOutputFormat *outputFormat = [[STIMHanyuPinyinOutputFormat alloc] init];
    [outputFormat setToneType:ToneTypeWithoutTone];
    [outputFormat setVCharType:VCharTypeWithV];
    [outputFormat setCaseType:CaseTypeLowercase];
    NSString *outputPinyin = [STIMPinyinHelper toHanyuPinyinStringWithNSString:sourceText withSTIMHanyuPinyinOutputFormat:outputFormat withNSString:@""]; 
    return outputPinyin;
}

+ (NSString*)chineseConvertToPinYinHead:(NSString *)chinese {
    STIMHanyuPinyinOutputFormat *outputFormat = [[STIMHanyuPinyinOutputFormat alloc] init];
    [outputFormat setToneType:ToneTypeWithoutTone];
    [outputFormat setVCharType:VCharTypeWithV];
    [outputFormat setCaseType:CaseTypeLowercase];
    NSMutableString *outputPinyin = [[NSMutableString alloc] init];
    for (int i=0;i <chinese.length;i++) {
        NSString *mainPinyinStrOfChar = [STIMPinyinHelper getFirstHanyuPinyinStringWithChar:[chinese characterAtIndex:i] withSTIMHanyuPinyinOutputFormat:outputFormat];
        if (nil!=mainPinyinStrOfChar) {
            [outputPinyin appendString:[mainPinyinStrOfChar substringToIndex:1]];
        } else {
            break;
        }
    }
    return outputPinyin;
}
@end
