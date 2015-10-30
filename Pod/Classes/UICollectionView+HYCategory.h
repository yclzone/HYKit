//
//  UICollectionView+HYCategory.h
//  NewSuperGymForCoach
//
//  Created by hanyou on 8/24/15.
//  Copyright (c) 2015 HanYouApp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionView (HYCellRegister)
/**
 *  通过类名注册Cell，ID为类名
 *
 *  @param classes Cell类型
 */
- (void)registerCellsWithClasses:(NSArray *)classes;

- (void)registerNibWithClass:(Class)aClass forSupplementaryViewOfKind:(NSString *)kind;
@end
