//
//  UIButton+HYCategory.m
//  BloodSugar
//
//  Created by gjtxz on 15/7/25.
//  Copyright (c) 2015年 hanyou. All rights reserved.
//

#import "UIButton+HY.h"
#import <objc/runtime.h>

@interface UIButton ()

@property(nonatomic, strong) UIView *modalView;
@property(nonatomic, strong) UIActivityIndicatorView *spinnerView;
@property(nonatomic, strong) UILabel *spinnerTitleLabel;


//重复点击延迟
@property (nonatomic,assign)BOOL clickDelayTime;
@end

@implementation UIButton (HY)

// Associative reference keys.
static NSString *const kIndicatorViewKey = @"indicatorView";
static NSString *const kButtonTextObjectKey = @"buttonTextObject";
//static NSString *const kButtonSendParameterKey = @"buttonTextObject";



+ (void)load {
    
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        // When swizzling a class method, use the following:
        // Class class = object_getClass((id)self);
        
        SEL originalSelector = @selector(sendAction:to:forEvent:);
        SEL swizzledSelector = @selector(xxx_sendAction:to:forEvent:);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL didAddMethod =
        class_addMethod(class,
                        originalSelector,
                        method_getImplementation(swizzledMethod),
                        method_getTypeEncoding(swizzledMethod));
        
        if (didAddMethod) {
            class_replaceMethod(class,
                                swizzledSelector,
                                method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    }); 
    
}

-(void)xxx_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event{
    if (self.clickDelayTime) return;
    self.clickDelayTime = YES;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.clickDelayTime = NO;
    });
    [self xxx_sendAction:action to:target forEvent:event];
}

-(BOOL)clickDelayTime{
    return  [objc_getAssociatedObject(self, _cmd) boolValue];
}

-(void)setClickDelayTime:(BOOL)clickDelayTime{
    return objc_setAssociatedObject(self, @selector(clickDelayTime), @(clickDelayTime), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


-(id)sendParameter{
    return  objc_getAssociatedObject(self, _cmd);
}

-(void)setSendParameter:(id)sendParameter{
    objc_setAssociatedObject(self, @selector(sendParameter), sendParameter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void) showIndicator {
    
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    indicator.center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
    [indicator startAnimating];
    
    NSString *currentButtonText = self.titleLabel.text;
    
    objc_setAssociatedObject(self, &kButtonTextObjectKey, currentButtonText, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(self, &kIndicatorViewKey, indicator, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self setTitle:@"" forState:UIControlStateNormal];
    self.enabled = NO;
    [self addSubview:indicator];
    
    
}

- (void) hideIndicator {
    
    NSString *currentButtonText = (NSString *)objc_getAssociatedObject(self, &kButtonTextObjectKey);
    UIActivityIndicatorView *indicator = (UIActivityIndicatorView *)objc_getAssociatedObject(self, &kIndicatorViewKey);
    
    [indicator removeFromSuperview];
    [self setTitle:currentButtonText forState:UIControlStateNormal];
    self.enabled = YES;
    
}

-(void)startTime:(NSInteger )timeout title:(NSString *)tittle waitTittle:(NSString *)waitTittle{
    __block NSInteger timeOut=timeout; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeOut<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [self setTitle:tittle forState:UIControlStateNormal];
                self.userInteractionEnabled = YES;
            });
        }else{
            //            int minutes = timeout / 60;
            int seconds = timeOut % 60;
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
//                NSLog(@"____%@",strTime);
                [self setTitle:[NSString stringWithFormat:@"%@%@",strTime,waitTittle] forState:UIControlStateNormal];
                self.userInteractionEnabled = NO;
                
            });
            timeOut--;
            
        }
    });
    dispatch_resume(_timer);
    
}



- (void)beginSubmitting:(NSString *)title {
    [self endSubmitting];
    
    self.submitting = @YES;
    self.hidden = YES;
    
    self.modalView = [[UIView alloc] initWithFrame:self.frame];
    self.modalView.backgroundColor =
    [self.backgroundColor colorWithAlphaComponent:0.6];
    self.modalView.layer.cornerRadius = self.layer.cornerRadius;
    self.modalView.layer.borderWidth = self.layer.borderWidth;
    self.modalView.layer.borderColor = self.layer.borderColor;
    
    CGRect viewBounds = self.modalView.bounds;
    self.spinnerView = [[UIActivityIndicatorView alloc]
                        initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    self.spinnerView.tintColor = self.titleLabel.textColor;
    
    CGRect spinnerViewBounds = self.spinnerView.bounds;
    self.spinnerView.frame = CGRectMake(
                                        15, viewBounds.size.height / 2 - spinnerViewBounds.size.height / 2,
                                        spinnerViewBounds.size.width, spinnerViewBounds.size.height);
    self.spinnerTitleLabel = [[UILabel alloc] initWithFrame:viewBounds];
    self.spinnerTitleLabel.textAlignment = NSTextAlignmentCenter;
    self.spinnerTitleLabel.text = title;
    self.spinnerTitleLabel.font = self.titleLabel.font;
    self.spinnerTitleLabel.textColor = self.titleLabel.textColor;
    [self.modalView addSubview:self.spinnerView];
    [self.modalView addSubview:self.spinnerTitleLabel];
    [self.superview addSubview:self.modalView];
    [self.spinnerView startAnimating];
}

- (void)endSubmitting {
    if (!self.isSubmitting.boolValue) {
        return;
    }
    
    self.submitting = @NO;
    self.hidden = NO;
    
    [self.modalView removeFromSuperview];
    self.modalView = nil;
    self.spinnerView = nil;
    self.spinnerTitleLabel = nil;
}

- (NSNumber *)isSubmitting {
    return objc_getAssociatedObject(self, @selector(setSubmitting:));
}

- (void)setSubmitting:(NSNumber *)submitting {
    objc_setAssociatedObject(self, @selector(setSubmitting:), submitting, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

- (UIActivityIndicatorView *)spinnerView {
    return objc_getAssociatedObject(self, @selector(setSpinnerView:));
}

- (void)setSpinnerView:(UIActivityIndicatorView *)spinnerView {
    objc_setAssociatedObject(self, @selector(setSpinnerView:), spinnerView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)modalView {
    return objc_getAssociatedObject(self, @selector(setModalView:));
    
}

- (void)setModalView:(UIView *)modalView {
    objc_setAssociatedObject(self, @selector(setModalView:), modalView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UILabel *)spinnerTitleLabel {
    return objc_getAssociatedObject(self, @selector(setSpinnerTitleLabel:));
}

- (void)setSpinnerTitleLabel:(UILabel *)spinnerTitleLabel {
    objc_setAssociatedObject(self, @selector(setSpinnerTitleLabel:), spinnerTitleLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

/**
 *  设置文字在下，图片在上
 */
-(void) setImageTopAndTitleBottomWithSpacing:(CGFloat )spacing{
    // get the size of the elements here for readability
    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = self.titleLabel.frame.size;
    
    // get the height they will take up as a unit
    CGFloat totalHeight = (imageSize.height + titleSize.height + spacing);
    
    // raise the image and push it right to center it
    self.imageEdgeInsets = UIEdgeInsetsMake(- (totalHeight - imageSize.height), 0.0, 0.0, - titleSize.width);
    
    // lower the text and push it left to center it
    self.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageSize.width, - (totalHeight - titleSize.height),0.0);

}
@end
