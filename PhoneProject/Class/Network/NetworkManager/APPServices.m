//
//  APPServices.m
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/28.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "APPServices.h"

@implementation APPServices

#pragma mark- 登录

/**
 userAccount	是	string	手机号码
 userPassword	是	string	密码
 */
+ (void)loginWithUserAccount:(NSString *)userAccount
                userPassword:(NSString *)userPassword
                successBlock:(APPSuccessBlock)successBlock
                failureBlock:(APPFailureBlock)failureBlock
{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setValue:userAccount forKey:@"userAccount"];
    [params setValue:userPassword forKey:@"userPassword"];
    
    [[APPNetWorkHandler sharedInstance]
     conURL:APPMethodName_login
     networkType:NetWorkPOST
     params:params
     delegate:nil
     showHUD:NO
     shouldCache:NO
     successBlock:^(id returnData)
    {
        if (successBlock)
        {
            successBlock(returnData);
        }
    }
     failureBlock:^(NSError *error)
    {
        if (failureBlock)
        {
            failureBlock(error);
        }
    }];

}

#pragma mark- 地区信息  缓存本地
/**
 shouldCache:YES
 */
+ (void)getareaInfoWithSuccessBlock:(APPSuccessBlock)successBlock
                       failureBlock:(APPFailureBlock)failureBlock
{
    [[APPNetWorkHandler sharedInstance]
     conURL:APPMethodName_areaInfo
     networkType:NetWorkPOST
     params:nil
     delegate:nil
     showHUD:NO
     shouldCache:YES
     successBlock:^(id returnData)
     {
         if (successBlock)
         {
             successBlock(returnData);
         }
     }
     failureBlock:^(NSError *error)
     {
         if (failureBlock)
         {
             failureBlock(error);
         }
     }];

}

@end
