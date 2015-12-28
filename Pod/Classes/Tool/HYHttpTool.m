//
//  HYHttpTool.m
//  Pods
//
//  Created by zjw7sky on 15/12/28.
//
//

#import "HYHttpTool.h"
#import "NSDictionary+HY.h"

NSTimeInterval const kBaseTimeOut  = 15;//超时

@implementation HYHttpTool

//get post
+ (void)HTTPType:(HYHttpType )type
          subURL:(NSString *)subURL
      parameters:(NSDictionary *)subParameter
      appendBase:(NSDictionary *)append
            sign:(NSString *)sign
           debug:(BOOL)debug
         handler:(HYHttpToolHandler)handler{
    
    [self HTTPType:type
            subURL:subURL
        parameters:subParameter
        appendBase:append sign:sign
             debug:debug
     dataWithBlock:nil
           handler:handler];
}

//post with data
+ (void)HTTPSubURL:(NSString *)subURL
        parameters:(NSDictionary *)subParameter
        appendBase:(NSDictionary *)append
              sign:(NSString *)sign
             debug:(BOOL)debug
     dataWithBlock:(HYHttpToolDataHandler)block
           handler:(HYHttpToolHandler)handler{
 
    [self HTTPType:HYHttpPOST
            subURL:subURL
        parameters:subParameter
        appendBase:append
              sign:sign
             debug:debug
     dataWithBlock:block
           handler:handler];
}


#pragma mark -
#pragma mark - Private Methods 


+ (void)HTTPType:(HYHttpType )type
          subURL:(NSString *)subURL
      parameters:(NSDictionary *)subParameter
      appendBase:(NSDictionary *)append
            sign:(NSString *)sign
           debug:(BOOL)debug
   dataWithBlock:(HYHttpToolDataHandler)block
         handler:(HYHttpToolHandler)handler {
    
    NSString *URLString = [NSString stringWithFormat:@"%@", subURL];
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters addEntriesFromDictionary:subParameter];
    
    /** 参数拼接 */
    if (append) {
        [parameters addEntriesFromDictionary:append];
    }
    
    // 请求加密（添加加密字段 sign）
    NSString *method = @"";
    if (type == HYHttpPOST) {
        method = @"POST";
    } else {
        method = @"GET";
    }
    
    if (sign) {
        NSDictionary *signedParameters = [parameters dictionaryWithMethod:method urlString:URLString sign:sign];
        parameters = [signedParameters mutableCopy];
    }
    NSString *action = parameters[@"action"];
    
    if (debug) {
        [self printURLWithSubURL:URLString parameter:parameters];
    }
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = kBaseTimeOut;
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject: @"text/html"];
    switch (type) {
        case HYHttpPOST: {
            [manager GET:URLString parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
                [self handleDebug:debug action:action task:task result:responseObject error:nil handler:handler];
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [self handleDebug:debug action:action task:task result:nil error:error handler:handler];
            }];
            
            break;
        }
            
        case HYHttpGET: {
            if (block) {
                [manager POST:URLString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
                    if (block) {
                        block(formData);
                    }
                } progress:^(NSProgress * _Nonnull uploadProgress) {
                    
                } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                    [self handleDebug:debug action:action task:task result:responseObject error:nil handler:handler];
                } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                    [self handleDebug:debug action:action task:task result:nil error:error handler:handler];
                }];
            }else{
                [manager POST:URLString parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
                    
                } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                    [self handleDebug:debug action:action task:task result:responseObject error:nil handler:handler];
                } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                    [self handleDebug:debug action:action task:task result:nil error:error handler:handler];
                }];
            }
            
            break;
        }
    }
}

// 请求回调
+ (void)handleDebug:(BOOL)debug action:(NSString *)action task:(NSURLSessionDataTask *)task result:(id)responseObject error:(NSError *)error handler:(HYHttpToolHandler)handler {
    if (handler) {
        if (debug) {
            if (error) {
                NSLog(@"\n< 错误\n action = %@, \n ERROR = %@\n>", action, error.localizedDescription);
            }else{
                NSString *result = [task.taskDescription stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
                result = [result stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
                NSLog(@"\n< 响应\n action = %@, \n responseObject = %@\n>", action, result);
            }
        }
        handler(responseObject,error);
    }
}

// 打印请求URL
+ (void)printURLWithSubURL:(NSString *)subURL parameter:(NSDictionary *)parameters {
    
    NSArray *keys = [parameters allKeys];
    keys = [keys sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [obj1 compare:obj2];
    }];
    
    NSString *postBody = @"";
    for (NSString *key in keys) {
        id value = parameters[key];
        postBody = [postBody stringByAppendingFormat:@"&%@=%@", key, value];
    }
    postBody = [postBody substringFromIndex:1];
    
    NSString *postStr = [subURL stringByAppendingString:[NSString stringWithFormat:@"?%@", postBody]];
    
    NSLog(@"\n< 请求\n action = %@, \n URL = %@\n>", parameters[@"action"], postStr);
}


@end
