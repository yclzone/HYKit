//
//  UITextField+HYCategory.m
//  SuperGym
//
//  Created by hanyou on 6/10/15.
//  Copyright (c) 2015 yclzone. All rights reserved.
//

#import "UITextField+HYCategory.h"

@implementation UITextField (HYCategory)
- (void)setupTextIndentation:(CGFloat)indentation {
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, indentation, self.bounds.size.height)];
    leftView.backgroundColor = [UIColor clearColor];
    leftView.userInteractionEnabled = NO;
    self.leftView = leftView;
    self.leftViewMode = UITextFieldViewModeAlways;
}

+ (void)setupTextIndentation:(CGFloat)indentation forViews:(NSArray *)views {
    for (UITextField *textField in views) {
        [textField setupTextIndentation:indentation];
    }
}

- (void)setupSearchView {
    
    CGFloat width = self.bounds.size.height;
    
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, width)];
    leftView.backgroundColor = [UIColor clearColor];
    leftView.userInteractionEnabled = NO;
    
    UIImageView *searchView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ic_location_grey_48x48"]];
    searchView.center = leftView.center;
    [leftView addSubview:searchView];
    self.leftView = leftView;
    self.leftViewMode = UITextFieldViewModeAlways;
}

- (void)setupLeftViewWithImage:(UIImage *)image {
    CGFloat width = self.bounds.size.height;
    
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, width)];
    leftView.backgroundColor = [UIColor clearColor];
    leftView.userInteractionEnabled = NO;
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width*0.6, width*0.6)];
    imageView.backgroundColor = [UIColor clearColor];
    imageView.userInteractionEnabled = NO;
    imageView.image = image;
    imageView.center = leftView.center;
    [leftView addSubview:imageView];
    self.leftView = leftView;
    self.leftViewMode = UITextFieldViewModeAlways;
}

@end
