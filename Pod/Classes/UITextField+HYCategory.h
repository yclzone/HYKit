//
//  UITextField+HYCategory.h
//  SuperGym
//
//  Created by hanyou on 6/10/15.
//  Copyright (c) 2015 yclzone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (HYCategory)

/**
 *  设置文本框文字缩进
 *
 *  @param indentation 缩进量
 */
- (void)setupTextIndentation:(CGFloat)indentation;
+ (void)setupTextIndentation:(CGFloat)indentation forViews:(NSArray *)views;

/**
 *  添加搜索标志
 */
- (void)setupSearchView;

- (void)setupLeftViewWithImage:(UIImage *)image;
@end
