//
//  HYKit.h
//  Pods
//
//  Created by Chenglin Yu on 15/10/30.
//
//

#ifndef HYKit_h
#define HYKit_h

#import "HYCategory.h"
#import "HYTool.h"



//常用的宏定义

#ifdef DEBUG
//#define kDebug(fmt, ...) NSLog((@"[文件名:%s][函数名:%s][行号:%d]" fmt), __FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__);
#define kDebug(fmt, ...) NSLog((@"[%d]" fmt), __LINE__, ##__VA_ARGS__);
#else
#define kDebug(...);
#endif

//获取当前语言
#define kCurrentLanguage        ([[NSLocale preferredLanguages] objectAtIndex:0])
//系统版本
#define kIOSVersion             [[[UIDevice currentDevice]systemVersion] floatValue]

#define kScreenWidth            ([UIScreen mainScreen].bounds.size.width)
#define kScreenHeight           ([UIScreen mainScreen].bounds.size.height)

#define kRGBA(r, g, b, a)       [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:(a)]
#define kRGB16(value,a)         [UIColor colorWithRed:((float)((value & 0xFF0000) >> 16))/255.0 green:((float)((value & 0xFF00) >> 8))/255.0 blue:((float)(value & 0xFF))/255.0 alpha:a]

#endif /* HYKit_h */
