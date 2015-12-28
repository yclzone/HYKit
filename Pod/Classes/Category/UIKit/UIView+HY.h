//
//  UIView+HYCategory.h
//  UHealth
//
//  Created by hanyou on 5/15/15.
//  Copyright (c) 2015 gjtx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (HY)
/** frame X */
@property (nonatomic, assign) CGFloat frameX;
/** frame Y */
@property (nonatomic, assign) CGFloat frameY;
/** width */
@property (nonatomic, assign) CGFloat frameWidth;
/** height */
@property (nonatomic, assign) CGFloat frameHeight;
/** center X */
@property (nonatomic, assign) CGFloat centerX;
/** center Y */
@property (nonatomic, assign) CGFloat centerY;

/**
 *  设置圆角
 *
 *  @param cornerRadius 圆角半径
 */
- (void)setupCornerRadius:(CGFloat)cornerRadius;

/**
 *  设置圆角，4.0f
 */
- (void)setupCornerRadius;

+ (void)setupCornerRadius:(CGFloat)cornerRadius forViews:(NSArray *)views;

+ (void)setupCornerRadiusForViews:(NSArray *)views;
/**
 *  圆形视图
 */
- (void)setupCircleView;

/**
 *  设置底部圆角
 *
 *  @param cornerRadius 圆角半径
 */
- (void)setupBottomCornerRadius:(CGFloat)cornerRadius;

/**
 *  设置顶部圆角
 *
 *  @param cornerRadius 圆角半径
 */
- (void)setupTopCornerRadius:(CGFloat)cornerRadius;

/**
 *  设置边框，1.0f
 *
 *  @param color 边框颜色
 */
- (void)setupBorderWithColor:(UIColor *)color;

/**
 *  设置边框
 *
 *  @param color       边框颜色
 *  @param borderWidth 边框宽度
 */
- (void)setupBorderWithColor:(UIColor *)color borderWidth:(CGFloat)borderWidth;
@end
