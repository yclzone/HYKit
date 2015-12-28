//
//  NSString+HYCategory.h
//  UHealthTemperature
//
//  Created by hanyou on 5/28/15.
//  Copyright (c) 2015 yclzone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, MD5Type) {
    MD5Type32BitLowercase = 0,
    MD5Type32BitUppercase = 1,
    MD5Type16BitLowercase = 2,
    MD5Type16BitUppercase = 3,
};

@interface NSString (HY)

#pragma mark -
#pragma mark 日期转字符串
/**
 *  返回日期字符串格式：yyyy-MM-dd HH:mm:ss
 *
 *  @param date 日期
 *
 *  @return 日期字符串格式：yyyy-MM-dd HH:mm:ss
 */
+ (NSString *)stringFromDate:(NSDate *)date;
+ (NSString *)stringFromDate:(NSDate *)date withFormat:(NSString *)format;

/**
 *  时间戳转字符串
 *
 *  @param timestamp 时间戳，单位秒
 *  @param format    日期字符串格式
 *
 *  @return 日期字符串
 */
+ (NSString *)stringFromTimestamp:(NSInteger)timestamp withFormat:(NSString *)format;
+ (NSString *)stringFromTimestamp:(NSInteger)timestamp;

#pragma mark -
#pragma mark MD5
/**
 *  计算指定字符串的MD5值，32位小写
 *
 *  @param string 需要计算的字符串
 *
 *  @return MD5值，32位小写
 */
+ (NSString *)md5StringWithString:(NSString *)string;

/**
 *  计算字符串的MD5值，32位小写
 *
 *  @return MD5值，32位小写
 */
- (NSString *)md5;

/**
 *  计算指定字符串的MD5值
 *
 *  @param string 需要计算的字符串
 *  @param type   MD5值类型
 *
 *  @return MD5值
 */
+ (NSString *)md5StringWithString:(NSString *)string type:(MD5Type)type;

/**
 *  计算字符串的MD5值
 *
 *  @param type MD5值类型
 *
 *  @return 字符串的MD5值
 */
- (NSString *)md5WithType:(MD5Type)type;

#pragma mark -
#pragma mark 其他

/**
 *  计算字符串矩形尺寸
 *
 *  @param font     字体
 *  @param maxWidth 最大宽度
 *
 *  @return 字符串矩形尺寸
 */
- (CGSize)sizeWithFont:(UIFont *)font maxWidth:(CGFloat)maxWidth;

/**
 *  返回App语言类型，1为中文，0为英文
 *
 *  @return App语言类型
 */
+ (NSString *)currentLanguage;

/**
 *  生成时间字符串和4位随机数组成的字符串，通常做唯一文件名使用
 *
 *  @param fileExtension 文件扩展名，可为nil
 *
 *  @return 生成的随机唯一字符串
 */
+ (NSString *)dateStampString:(NSString *)fileExtension;

/**
 *  时间戳转成提示的消息文字，如几小时前等
 *
 *  @param timeStamp 时间戳
 *
 *  @return 时间文字字符串
 */
+ (NSString *)timeStampToUserInfoStr:(NSInteger)timeStamp;

+ (NSString *)stringFromInteger:(NSInteger)value;
@end
