//
//  UIImage+Scale.m
//  NewSuperGym
//
//  Created by liliang on 15/7/9.
//  Copyright (c) 2015年 hanyou. All rights reserved.
//

#import "UIImage+Scale.h"

@implementation UIImage (Scale)

- (UIImage *)scaleImageToSize:(CGSize)imageSize {
    UIGraphicsBeginImageContext(imageSize);
    
    [self drawInRect:CGRectMake(0, 0, imageSize.width, imageSize.height)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return scaledImage;
}

- (UIImage *)scaleImageToMaxWidthOrHeight:(CGFloat)imageWdithOrHeight {
    CGSize size = self.size;
    UIImage *newImage;
    if (size.width > size.height) {
        if (size.width >= imageWdithOrHeight) {
            float scale = imageWdithOrHeight / size.width;
            CGSize newSize = CGSizeMake(size.width * scale, size.height * scale);
            newImage = [self scaleImageToSize:newSize];
        }
        else if (size.height >= imageWdithOrHeight) {
            float scale = imageWdithOrHeight / size.height;
            CGSize newSize = CGSizeMake(size.width * scale, size.height * scale);
            newImage = [self scaleImageToSize:newSize];
        }
        else {
            newImage = self;
        }
    }
    else {
        if (size.height >= imageWdithOrHeight) {
            float scale = imageWdithOrHeight / size.height;
            CGSize newSize = CGSizeMake(size.width * scale, size.height * scale);
            newImage = [self scaleImageToSize:newSize];
        }
        else if (size.width >= imageWdithOrHeight) {
            float scale = imageWdithOrHeight / size.width;
            CGSize newSize = CGSizeMake(size.width * scale, size.height * scale);
            newImage = [self scaleImageToSize:newSize];
        }
        else {
            newImage = self;
        }
    }
    return newImage;
}

@end
