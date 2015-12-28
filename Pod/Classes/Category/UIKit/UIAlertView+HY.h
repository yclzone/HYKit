//
//  UIAlertView+HYCategory.h
//  BloodOxygen
//
//  Created by gjtxz on 15/9/15.
//  Copyright (c) 2015年 hanyou. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CompleteBlock) (NSInteger buttonIndex);

@interface UIAlertView (HY)

- (void)showAlertViewWithCompleteBlock:(CompleteBlock) block;

@end
