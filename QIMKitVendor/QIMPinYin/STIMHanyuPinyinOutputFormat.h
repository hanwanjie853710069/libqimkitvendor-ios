/**
 *	Created by kimziv on 13-9-14.
 */
#ifndef _STIMHanyuPinyinOutputFormat_H_
#define _STIMHanyuPinyinOutputFormat_H_

#import <Foundation/Foundation.h>


typedef enum {
  ToneTypeWithToneNumber,
  ToneTypeWithoutTone,
  ToneTypeWithToneMark
}ToneType;

typedef enum {
    CaseTypeUppercase,
    CaseTypeLowercase
}CaseType;

typedef enum {
    VCharTypeWithUAndColon,
    VCharTypeWithV,
    VCharTypeWithUUnicode
}VCharType;


@interface STIMHanyuPinyinOutputFormat : NSObject

@property(nonatomic, assign) VCharType vCharType;
@property(nonatomic, assign) CaseType caseType;
@property(nonatomic, assign) ToneType toneType;

- (id)init;
- (void)restoreDefault;
@end

#endif // _STIMHanyuPinyinOutputFormat_H_
