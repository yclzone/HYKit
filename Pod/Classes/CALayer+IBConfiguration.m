//
//  CALayer+IBConfiguration.m
//  SuperGym
//
//  Created by liliang on 15/6/9.
//  Copyright (c) 2015年 yclzone. All rights reserved.
//

#import "CALayer+IBConfiguration.h"

@implementation CALayer (IBConfiguration)

-(void)setBorderIBColor:(UIColor *)color
{
    self.borderColor = color.CGColor;
}

-(UIColor *)borderIBColor
{
    return [UIColor colorWithCGColor:self.borderColor];
}

-(void)setShadowIBColor:(UIColor *)color
{
    self.shadowColor = color.CGColor;
}

-(UIColor *)shadowIBColor
{
    return [UIColor colorWithCGColor:self.shadowColor];
}

@end
