//
//  UIViewController+HY.m
//  BloodOxygen
//
//  Created by gjtxz on 15/7/21.
//  Copyright (c) 2015年 hanyou. All rights reserved.
//

#import "UIViewController+HY.h"
#import <objc/runtime.h>

@implementation UIViewController (HY)


+ (void)load {
    
   
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
         Class class = [self class];
        
        // When swizzling a class method, use the following:
        // Class class = object_getClass((id)self);
        
        SEL originalSelector = @selector(viewDidLoad);
        SEL swizzledSelector = @selector(xxx_viewDidLoad);
        
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
        
        
        originalSelector = @selector(viewWillAppear:);
        swizzledSelector = @selector(xxx_viewWillAppear:);
        
        originalMethod = class_getInstanceMethod(class, originalSelector);
        swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        didAddMethod =
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
        
        originalSelector = @selector(viewWillDisappear:);
        swizzledSelector = @selector(xxx_viewWillDisappear:);
        
        originalMethod = class_getInstanceMethod(class, originalSelector);
        swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        didAddMethod =
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

#pragma mark - Method Swizzling

- (void)xxx_viewDidLoad  {
    
//    NSString *str = NSStringFromClass([self class]);
    
    [self xxx_viewDidLoad];
    //  kDebug(@"xxx_viewDidLoad: %@", self.class);
  
}


- (void)xxx_viewWillAppear:(BOOL)animated {
    [self xxx_viewWillAppear:animated];
//    kDebug(@"xxx_viewWillAppear: %@", self.class);
    
}

- (void)xxx_viewWillDisappear:(BOOL)animated {
    [self xxx_viewWillAppear:animated];
//    kDebug(@"xxx_viewWillDisappear: %@", self.class);
}

//typedef void (*_VIMP)(id,SEL,...);
//typedef id (*_IMP)(id,SEL,...);
//+ (void)load{
//    //保证方法执行一次
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//      //  获取原始方法
//        Method viewDidLoad = class_getInstanceMethod(self, @selector(viewDidLoad));
//        _VIMP viewDidLoad_IMP = (_VIMP)method_getImplementation(viewDidLoad);
//        method_setImplementation(viewDidLoad, imp_implementationWithBlock(^(id target,SEL action){
//        //    调用原有方法
//            viewDidLoad_IMP(target,@selector(viewDidLoad));
//          //  执行一些你想要的初始化
//            kDebug(@"%@ did load",target);
//
//        }));
//    });
//}

@end