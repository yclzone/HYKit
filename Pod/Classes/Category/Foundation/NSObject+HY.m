//
//  NSObject+HY.m
//  Pods
//
//  Created by zjw7sky on 15/12/28.
//
//

#import "NSObject+HY.h"
#import <objc/runtime.h>


@implementation NSObject (HY)

+ (NSArray*)propertyKeys
{
    
    unsigned int outCount, i;
    
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    
    NSMutableArray *keys = [[NSMutableArray alloc] initWithCapacity:outCount];
    
    for (i = 0; i < outCount; i++) {
        
        objc_property_t property = properties[i];
        
        NSString *propertyName = [[NSString alloc] initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        
        [keys addObject:propertyName];
        
    }
    
    free(properties);
    
    return [keys copy];
    
}

@end
