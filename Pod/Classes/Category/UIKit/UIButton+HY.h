//
//  UIButton+HYCategory.h
//  BloodSugar
//
//  Created by gjtxz on 15/7/25.
//  Copyright (c) 2015年 hanyou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (HY)
 
//传递参数
@property (nonatomic,strong)id sendParameter;

/**
 This method will show the activity indicator in place of the button text.
 */
- (void) showIndicator;

/**
 This method will remove the indicator and put thebutton text back in place.
 */
- (void) hideIndicator;

/*
 *  @brief  按钮点击后，禁用按钮并在按钮上显示ActivityIndicator，以及title
 *  @param title 按钮上显示的文字
 */
- (void)beginSubmitting:(NSString *)title;

/*
 *  @brief  按钮点击后，恢复按钮点击前的状态
 */
- (void)endSubmitting;

/*
 *  @brief  按钮是否正在提交中
 */
@property(nonatomic, readonly, getter=isSubmitting) NSNumber *submitting;

//倒计时
-(void)startTime:(NSInteger )timeout title:(NSString *)tittle waitTittle:(NSString *)waitTittle;


/**
 *  设置文字在下，图片在上
 */
-(void) setImageTopAndTitleBottomWithSpacing:(CGFloat )spacing;

@end
