//
//  NSString+HYCategory.m
//  UHealthTemperature
//
//  Created by hanyou on 5/28/15.
//  Copyright (c) 2015 yclzone. All rights reserved.
//

#import "NSString+HY.h"
#import <CommonCrypto/CommonDigest.h>
#import "NSDate+HY.h"

@implementation NSString (HY)
+ (NSString *)stringFromDate:(NSDate *)date
{
    NSDateFormatter *dateFormatter =[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: @"yyyy-MM-dd HH:mm:ss"];
    return [dateFormatter stringFromDate:date];
}

+ (NSString *)stringFromDate:(NSDate *)date withFormat:(NSString *)format
{
    NSDateFormatter *dateFormatter =[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: format];
    return [dateFormatter stringFromDate:date];
}

+ (NSString *)stringFromTimestamp:(NSInteger)timestamp withFormat:(NSString *)format {
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timestamp];
    return [self stringFromDate:date withFormat:format];
}

+ (NSString *)stringFromTimestamp:(NSInteger)timestamp {
    return [self stringFromTimestamp:timestamp withFormat:@"yyyy-MM-dd HH:mm:ss"];
}


+ (NSString *)md5StringWithString:(NSString *)string {
    return [self md5StringWithString:string type:MD5Type32BitLowercase];
}

- (NSString *)md5 {
    return [NSString md5StringWithString:self type:MD5Type32BitLowercase];;
}

+ (NSString *)md5StringWithString:(NSString *)string type:(MD5Type)type {
    const char *original_str = [string UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(original_str, (CC_LONG)strlen(original_str), result);
    NSMutableString *hash = [NSMutableString string];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [hash appendFormat:@"%02X", result[i]];
    
    NSString *MD5Strubg = @"";
    
    switch (type) {
        case MD5Type16BitLowercase:
            MD5Strubg = [[hash lowercaseString] substringWithRange:NSMakeRange(8, 16)];
            break;
        case MD5Type16BitUppercase:
            MD5Strubg = [[hash uppercaseString] substringWithRange:NSMakeRange(8, 16)];
            break;
        case MD5Type32BitLowercase:
            MD5Strubg = [hash lowercaseString];
            break;
        case MD5Type32BitUppercase:
            MD5Strubg = [hash uppercaseString];
            break;
    }
    return MD5Strubg;
}

- (NSString *)md5WithType:(MD5Type)type {
    return [NSString md5StringWithString:self type:type];
}

- (CGSize)sizeWithFont:(UIFont *)font maxWidth:(CGFloat)maxWidth {
    NSDictionary *attributes = @{NSFontAttributeName: font};
    return [self boundingRectWithSize:CGSizeMake(maxWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
}

+(NSString *)currentLanguage{
    NSString *language = [[NSLocale preferredLanguages] objectAtIndex:0];
    NSString *language_type;
    
    if([language hasPrefix:@"en"]){
        language_type = @"1";
    }else{
        language_type = @"0";
        
    }
    
    return language_type;
}

+ (NSString *)dateStampString:(NSString *)fileExtension {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat    = @"yyyyMMddHHmmss";
    NSString *stamp =[NSString stringWithFormat:@"%@%04d", [dateFormatter stringFromDate:[NSDate date]], rand()%10000];
    if (!fileExtension) {
        return stamp;
    }
    return [stamp stringByAppendingPathExtension:fileExtension];
}

+ (NSString *)timeStampToUserInfoStr:(NSInteger)timeStamp {
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeStamp];
    NSDate *now  = [NSDate date];
    NSTimeInterval timeInterval = [now timeIntervalSinceDate:date];
    
    NSInteger theMinute = timeInterval / 60;
    NSInteger theHour   = timeInterval / (60*60);
    
    if (theMinute <= 0) {
        return @"刚刚";
    }
    else if (theMinute > 0 && theMinute < 30) {
        return [NSString stringWithFormat:@"%zd分钟前",theMinute];
    }
    else if (theMinute == 30) {
        return @"半小时前";
    }
    else if (theMinute > 30 && theMinute < 60) {
        return [NSString stringWithFormat:@"%zd分钟前",theMinute];
    }
    else if (theMinute >= 60 && theHour < 24) {
        return [NSString stringWithFormat:@"%zd小时前",theHour];
    }
    else if (theHour == 24) {
        return @"1天前";
    }
    else {
        NSDateFormatter *dateFormatter =[[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat: @"yyyy-MM-dd HH:mm:ss"];
        return [dateFormatter stringFromDate:date];;
    }
}

+ (NSString *)stringFromInteger:(NSInteger)value {
    return [NSString stringWithFormat:@"%zd", value];
}
@end
