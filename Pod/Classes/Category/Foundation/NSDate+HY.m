//
//  NSDate+HYCategory.m
//  UHealthTemperature
//
//  Created by hanyou on 5/28/15.
//  Copyright (c) 2015 yclzone. All rights reserved.
//

#import "NSDate+HY.h"

@implementation NSDate (HY)
+ (NSDate *)dateFromString:(NSString *)string { 
    return [self dateFromString:string withDateFormatStyle:DateFormatYMDHMS];
}

+ (NSDate *)dateFromString:(NSString *)string withFormat:(NSString *)format {
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setDateFormat:format];
    NSDate *date = [inputFormatter dateFromString:string];
    return date;
}

+ (NSDate *)dateFromString:(NSString *)string withDateFormatStyle:(DateFormatStyle)format{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    switch (format) {
        case DateFormatYMDHMS: {
            [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
            break;
        }
        case DateFormatYMDHM: {
            [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
            break;
        }
        case DateFormatYMD: {
            [dateFormatter setDateFormat:@"yyyy-MM-dd"];
            break;
        }
        case DateFormatMDHMS: {
            [dateFormatter setDateFormat:@"MM-dd HH:mm:ss"];
            break;
        }
        case DateFormatMDHM: {
            [dateFormatter setDateFormat:@"MM-dd HH:mm"];
            break;
        }
        case DateFormatMD: {
            [dateFormatter setDateFormat:@"MM-dd"];
            break;
        }
        case DateFormatHMS: {
            [dateFormatter setDateFormat:@"HH:mm:ss"];
            break;
        }
        case DateFormatHM: {
            [dateFormatter setDateFormat:@"HH:mm"];
            break;
        }
        case DateFormatMS: {
            [dateFormatter setDateFormat:@"mm:ss"];
            break;
        }
        default: {
            [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
            break;
        }
    }
    
    return [dateFormatter dateFromString:string];;
}


+ (NSDate *)dateFromMSTimestamp:(long long)timestamp {
    return [NSDate dateWithTimeIntervalSince1970:(double)(timestamp*0.001)];
}

+ (long long)dateToMSTimetampWithDate:(NSDate *)date {
    return (long long)([date timeIntervalSince1970] * 1000);
}

+ (NSTimeInterval)timeIntervalWithDate:(NSString *)dateString withFormat:(NSString *)format {
    NSDate *date = [NSDate dateFromString:dateString withFormat:format];
    return [date timeIntervalSince1970];
}



@end
