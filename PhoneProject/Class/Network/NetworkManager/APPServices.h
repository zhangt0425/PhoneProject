//
//  APPServices.h
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/28.
//  Copyright © 2017年 张涛. All rights reserved.
//

/*
 * api 网络接口api方法都统一放在此处
 */

#import <Foundation/Foundation.h>
#import "APPNetWorkURLS.h"
#import "APPNetWorHeader.h"
#import "APPNetWorkHandler.h"

@interface APPServices : NSObject


#pragma mark- 登录

/**
 userAccount	是	string	手机号码
 userPassword	是	string	密码
 */
+ (void)loginWithUserAccount:(NSString *)userAccount
                userPassword:(NSString *)userPassword
                successBlock:(APPSuccessBlock)successBlock
                failureBlock:(APPFailureBlock)failureBlock;

#pragma mark- 地区信息  缓存本地
/**
 shouldCache:YES
 */
+ (void)getareaInfoWithSuccessBlock:(APPSuccessBlock)successBlock
                       failureBlock:(APPFailureBlock)failureBlock;


@end
