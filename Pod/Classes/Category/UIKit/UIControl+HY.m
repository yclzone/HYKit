//
//  UIControl+HYCategory.m
//  BloodSugar
//
//  Created by zjw7sky on 15/11/16.
//  Copyright © 2015年 hanyou. All rights reserved.
//

#import "UIControl+HY.h"
#import <objc/runtime.h>

@implementation UIControl (HY)

static const char JWassociatedkey;

- (void)handleControlEvent:(UIControlEvents)event withBlock:(ActionBlock)block {
    
    objc_setAssociatedObject(self, &JWassociatedkey, block, OBJC_ASSOCIATION_COPY);
    [self addTarget:self action:@selector(callActionBlock:) forControlEvents:event];
}


- (void)callActionBlock:(id)sender {
    ActionBlock block = objc_getAssociatedObject(self, &JWassociatedkey);
    if (block) {
        block();
    }
}

@end
