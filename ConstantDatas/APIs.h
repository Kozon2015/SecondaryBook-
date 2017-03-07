//
//  APIs.h
//  SecondaryBook
//
//  Created by Albert on 16/5/27.
//  Copyright © 2016年 625 Apps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIs : NSObject

+(NSString *)getServerAddress;

/**
 *  check if intertnet is connected
 *
 *  @return Status Unknown            = -1,
 Status Not Reachable      =  0,
 Status Reachable Via WWAN =  1,
 Status Reachable Via WiFi =  2,
 */
+(int)checkInternet;

/**
 *  注册
 *  方法：POST
 *  API：user/register.do
 *
 */
+(NSString *)APIRegister;

/**
 *  注册
 *  方法：GET
 *  API：user/userInfo.do
 *
 */
+(NSString *)APIGETUserInfo;

@end
