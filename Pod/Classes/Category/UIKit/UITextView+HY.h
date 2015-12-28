//
//  UITextView+HYCategory.h
//  BloodSugar
//
//  Created by gjtxz on 15/7/25.
//  Copyright (c) 2015年 hanyou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (HY)

@property (nonatomic, strong) UITextView *placeHolderTextView;
//@property (nonatomic, assign) id <UITextViewDelegate> textViewDelegate;
- (void)addPlaceHolder:(NSString *)placeHolder;

@end
