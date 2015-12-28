//
//  HYHttpTool.h
//  Pods
//
//  Created by zjw7sky on 15/12/28.
//
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

typedef NS_ENUM(NSInteger, HYHttpType) {
    HYHttpPOST = 0,
    HYHttpGET ,
};

typedef void(^HYHttpToolHandler)(id responseObject,NSError *error);
typedef void(^HYHttpToolDataHandler)(id <AFMultipartFormData> formData);

@interface HYHttpTool : NSObject

//get post
+ (void)HTTPType:(HYHttpType )type
          subURL:(NSString *)subURL
 parameters:(NSDictionary *)subParameter
 appendBase:(NSDictionary *)append
       sign:(NSString *)sign
      debug:(BOOL)debug
    handler:(HYHttpToolHandler)handler;

//post with data
+ (void)HTTPSubURL:(NSString *)subURL
      parameters:(NSDictionary *)subParameter
      appendBase:(NSDictionary *)append
            sign:(NSString *)sign
           debug:(BOOL)debug
   dataWithBlock:(HYHttpToolDataHandler)block
         handler:(HYHttpToolHandler)handler;

@end
