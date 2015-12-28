//
//  UIImage+Scale.h
//  NewSuperGym
//
//  Created by liliang on 15/7/9.
//  Copyright (c) 2015年 hanyou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (HY)

/**
 *  把图片缩小到指定尺寸
 *
 *  @param imageSize 制定图片的尺寸
 *
 *  @return 新的图片
 */
- (UIImage *)scaleImageToSize:(CGSize)imageSize;


/**
 *  把图片缩小到宽或高最大得长度
 *
 *  @param imageWdithOrHeight 图片的宽或高
 *
 *  @return 新图片
 */
- (UIImage *)scaleImageToMaxWidthOrHeight:(CGFloat)imageWdithOrHeight;

+ (UIImage *)imageWithColor:(UIColor *)color;


/**
 *  根据颜色和大小获取Image
 *
 *  @param color 颜色
 *  @param size  大小
 *
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

/**
 *  根据图片返回一张高斯模糊的图片
 *
 *  @param blur 模糊系数
 *
 *  @return 新的图片
 */
- (UIImage *)boxblurImageWithBlur:(CGFloat)blur;

@end
