//
//  BRNetworkRequests.m
//  SecondaryBook
//
//  Created by Albert on 16/5/27.
//  Copyright © 2016年 625 Apps. All rights reserved.
//

#import "BRNetworkRequests.h"
#import <AFNetworking.h>

@implementation BRNetworkRequests
+(void)checkConnection:(void (^)(int))connectionStatus {
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        connectionStatus(status);
    }];
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
}

/**
 *  不带rid的POST请求
 *
 *  @param urlString  URL
 *  @param parameters Parameters(NSDictionary)
 *  @param success    回调
 *  @param failure    回调
 */
+(void)POST:(NSString*)urlString parameters:(id)parameters success:(void (^)(id obj))success failure:(void (^)(NSError * error))failure {
    AFHTTPSessionManager* manager = [AFHTTPSessionManager manager];
    //    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    //    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObjectsFromArray:@[@"text/html",@"text/plain"]];
    NSURL *url = [NSURL URLWithString:urlString];
    [manager POST:url.absoluteString parameters:parameters constructingBodyWithBlock:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

+(void)POST:(NSString *)urlString parameters:(id)parameters success:(void (^)(id obj))success {
    [self POST:urlString parameters:parameters success:success failure:^(NSError *error) {
        NSLog(@"Error:%@",error);
    }];
}


+ (void)GET:(NSString *)urlString parameters:(NSDictionary *)parameters success:(void(^)(id obj))success failure:(void(^)(NSError * error))failure {
    AFHTTPSessionManager* manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    NSURL *url = [NSURL URLWithString:urlString];
    [manager GET:url.absoluteString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

+ (void)GET:(NSString *)urlString parameters:(NSDictionary *)parameters success:(void (^)(id obj))success {
    [self GET:urlString parameters:parameters success:success failure:^(NSError *error) {
        NSLog(@"Error:%@",error);
    }];
}

+ (void)uploadImage:(NSString *)urlString parameters:(NSDictionary *)parameters imgName:(NSString *)imgName image:(UIImage *)image success:(void(^)(id obj))success failure:(void(^)(NSError * error))failure  {
    NSData *imageData = UIImageJPEGRepresentation(image, 0.75);
    if (imageData)
    {
        AFHTTPSessionManager* manager = [AFHTTPSessionManager manager];
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        [manager POST:urlString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
            [formData appendPartWithFileData:imageData name:imgName fileName:@"avatar.jpg" mimeType:@"image/jpeg"];
        } progress: nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            success(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failure(error);
        }];
    }
}

@end
