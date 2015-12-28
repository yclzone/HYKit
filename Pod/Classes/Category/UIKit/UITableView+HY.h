//
//  UITableView+HYCategories.h
//  NewSuperGym
//
//  Created by hanyou on 7/6/15.
//  Copyright (c) 2015 hanyou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (HY)
/**
 *  注册cell ,identifier 为类名
 *
 *  @param classes 需要注册的类
 */
- (void)registerClasses:(NSArray *)classes;

/**
 *  通过Class或Nib注册Cell, identifier 为类名
 *
 *  @param classes 类名
 */
- (void)registerCellsWithClasses:(NSArray *)classes;
@end
