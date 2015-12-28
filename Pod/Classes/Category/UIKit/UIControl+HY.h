//
//  UIControl+HYCategory.h
//  BloodSugar
//
//  Created by zjw7sky on 15/11/16.
//  Copyright © 2015年 hanyou. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ActionBlock) ();

@interface UIControl (HY) 

- (void) handleControlEvent:(UIControlEvents)event withBlock:(ActionBlock)action;

@end
