//
//  NSDate+HYCategory.m
//  UHealthTemperature
//
//  Created by hanyou on 5/28/15.
//  Copyright (c) 2015 yclzone. All rights reserved.
//

#import "NSDate+HYCategory.h"

@implementation NSDate (HYCategory)
+ (NSDate *)dateFromString:(NSString *)string {
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [inputFormatter dateFromString:string];
    return date;
}

+ (NSDate *)dateFromMSTimestamp:(long long)timestamp {
    return [NSDate dateWithTimeIntervalSince1970:(double)(timestamp*0.001)];
}

+ (long long)dateToMSTimetampWithDate:(NSDate *)date {
    return (long long)([date timeIntervalSince1970] * 1000);
}

+ (NSDate *)dateFromString:(NSString *)string withFormat:(NSString *)format {
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setDateFormat:format];
    NSDate *date = [inputFormatter dateFromString:string];
    return date;
}

+ (NSTimeInterval)timeIntervalWithDate:(NSString *)dateString withFormat:(NSString *)format {
    NSDate *date = [NSDate dateFromString:dateString withFormat:format];
    return [date timeIntervalSince1970];
}
@end
