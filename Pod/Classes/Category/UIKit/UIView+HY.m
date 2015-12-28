//
//  UIView+HYCategory.m
//  UHealth
//
//  Created by hanyou on 5/15/15.
//  Copyright (c) 2015 gjtx. All rights reserved.
//

#import "UIView+HY.h"

@implementation UIView (HY)

- (void)setupCornerRadius:(CGFloat)cornerRadius {
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = YES;
}

- (void)setupCircleView {
    [self setupCornerRadius:self.bounds.size.height*0.5];
}

- (void)setupCornerRadius {
    [self setupCornerRadius:4.0f];
}

+ (void)setupCornerRadius:(CGFloat)cornerRadius forViews:(NSArray *)views {
    for (UIView *view in views) {
        [view setupCornerRadius:cornerRadius];
    }
}

+ (void)setupCornerRadiusForViews:(NSArray *)views {
    [self setupCornerRadius:4.0f forViews:views];
}

- (void)setupBottomCornerRadius:(CGFloat)cornerRadius {
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

- (void)setupTopCornerRadius:(CGFloat)cornerRadius {
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

- (void)setupBorderWithColor:(UIColor *)color {
    [self setupBorderWithColor:color borderWidth:1.0f];
}

- (void)setupBorderWithColor:(UIColor *)color borderWidth:(CGFloat)borderWidth {
    CALayer *layer = self.layer;
    layer.borderColor = [color CGColor];
    layer.borderWidth = borderWidth;
}


- (void)setFrameHeight:(CGFloat)frameHeight {
    CGRect frame = self.frame;
    frame.size.height = frameHeight;
    self.frame = frame;
}
- (CGFloat)frameHeight {
    return self.frame.size.height;
}

- (void)setFrameWidth:(CGFloat)frameWidth {
    CGRect frame = self.frame;
    frame.size.width = frameWidth;
    self.frame = frame;
}
- (CGFloat)frameWidth {
    return self.frame.size.width;
}

- (void)setFrameX:(CGFloat)frameX {
    CGRect frame = self.frame;
    frame.origin.x = frameX;
    self.frame = frame;
}
- (CGFloat)frameX {
    return self.frame.origin.x;
}

- (void)setFrameY:(CGFloat)frameY {
    CGRect frame = self.frame;
    frame.origin.y = frameY;
    self.frame = frame;
}
- (CGFloat)frameY {
    return self.frame.origin.y;
}

- (void)setCenterX:(CGFloat)centerX {
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}
- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY {
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}
- (CGFloat)centerY {
    return self.center.y;
}
@end
