//
//  NSDate+HYCategory.h
//  UHealthTemperature
//
//  Created by hanyou on 5/28/15.
//  Copyright (c) 2015 yclzone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (HYCategory)
/**
 *  日期字符串yyyy-MM-dd HH:mm:ss 转日期
 *
 *  @param dateStr 日期格式：yyyy-MM-dd HH:mm:ss
 *
 *  @return 日期
 */
+ (NSDate *)dateFromString:(NSString *)dateStr;
+ (NSDate *)dateFromString:(NSString *)string withFormat:(NSString *)format;

/**
 *  毫秒时间戳转日期
 *
 *  @param timestamp 毫秒时间戳
 *
 *  @return 日期
 */
+ (NSDate *)dateFromMSTimestamp:(long long)timestamp;

/**
 *  日期转毫秒时间戳
 *
 *  @param date 日期
 *
 *  @return 毫秒时间戳
 */
+ (long long)dateToMSTimetampWithDate:(NSDate *)date;

+ (NSTimeInterval)timeIntervalWithDate:(NSString *)dateString withFormat:(NSString *)format;
@end
