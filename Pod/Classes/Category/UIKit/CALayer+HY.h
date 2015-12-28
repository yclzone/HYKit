//
//  CALayer+IBConfiguration.h
//  SuperGym
//
//  Created by liliang on 15/6/9.
//  Copyright (c) 2015年 yclzone. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface CALayer (HY)

@property(nonatomic, assign) IBInspectable UIColor *borderIBColor;
@property(nonatomic, assign) IBInspectable UIColor *shadowIBColor;

@end
