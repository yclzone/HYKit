//
//  UIImage+Scale.h
//  NewSuperGym
//
//  Created by liliang on 15/7/9.
//  Copyright (c) 2015年 hanyou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Scale)

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

@end
