//
//  UITableView+HYCategories.m
//  NewSuperGym
//
//  Created by hanyou on 7/6/15.
//  Copyright (c) 2015 hanyou. All rights reserved.
//

#import "UITableView+HY.h"

@implementation UITableView (HY)

- (void)registerClasses:(NSArray *)classes {
    for (Class aClass in classes) {
        NSString *className = NSStringFromClass(aClass);
        [self registerClass:aClass forCellReuseIdentifier:className];
    }
}

- (void)registerCellsWithClasses:(NSArray *)classes {
    for (Class aClass in classes) {
        NSString *className = NSStringFromClass(aClass);
        
        NSString *nibPath = [[NSBundle mainBundle] pathForResource:className ofType:@"nib"];
        if (nibPath) {
            UINib *nib = [UINib nibWithNibName:className bundle:nil];
            [self registerNib:nib forCellReuseIdentifier:className];
        } else {
            [self registerClass:aClass forCellReuseIdentifier:className];
        }
    }
}
@end
