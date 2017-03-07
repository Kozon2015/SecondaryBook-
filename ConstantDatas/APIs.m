//
//  APIs.m
//  SecondaryBook
//
//  Created by Albert on 16/5/27.
//  Copyright © 2016年 625 Apps. All rights reserved.
//

#import "APIs.h"
#import "AFHTTPSessionManager.h"

@implementation APIs

static const NSString* serverAddress = @"http://172.23.106.2:8080//book_bbs/";

+(NSString *)getServerAddress {
    return [NSString stringWithFormat:@"%@",serverAddress];
}

+(int)checkInternet{
    __block int ReachabilityStatus = -1;
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        ReachabilityStatus = status;
        NSLog(@"status%ld",(long)status);
        
    }];
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    return ReachabilityStatus;
}

+(NSString *)APIRegister {
    return [NSString stringWithFormat:@"%@user/register.do",serverAddress];
}

+(NSString *)APIGETUserInfo {
    return [NSString stringWithFormat:@"%@user/userInfo.do",serverAddress];
}

@end
