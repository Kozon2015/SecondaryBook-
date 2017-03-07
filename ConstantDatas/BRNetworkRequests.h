//
//  BRNetworkRequests.h
//  SecondaryBook
//
//  Created by Albert on 16/5/27.
//  Copyright © 2016年 625 Apps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "APIs.h"

@interface BRNetworkRequests : NSObject
+(void)checkConnection:(void (^)(int status))connectionStatus;
+(void)POST:(NSString*)urlString parameters:(id )parameters success:(void (^)(id obj))success failure:(void (^)(NSError * error))failure;
+(void)POST:(NSString *)urlString parameters:(id)parameters success:(void (^)(id obj))success;
+(void)GET:(NSString *)urlString parameters:(NSDictionary *)parameters success:(void(^)(id obj))success failure:(void(^)(NSError * error))failure;
+(void)GET:(NSString *)urlString parameters:(NSDictionary *)parameters success:(void (^)(id obj))success;
+(void)uploadImage:(NSString *)urlString parameters:(NSDictionary *)parameters imgName:(NSString *)imgName image:(UIImage *)image success:(void(^)(id obj))success failure:(void(^)(NSError * error))failure;
@end
