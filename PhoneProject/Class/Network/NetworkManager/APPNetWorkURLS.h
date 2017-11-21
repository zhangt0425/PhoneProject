//
//  APPNetWorkURLS.h
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/25.
//  Copyright © 2017年 张涛. All rights reserved.
//

/*
 * api  建议按照下面格式 方便快速查找
 */

#ifndef APPNetWorkURLS_h
#define APPNetWorkURLS_h


#pragma mark ==========================服务配置============================

#pragma mark - 是否上线 //YES 生产环境 NO //测试环境
static const BOOL APPServiceISOnline = NO;

#pragma mark -请求时间
static const NSTimeInterval APPNetworkingTimeoutSeconds = 20.0f;

#pragma mark -cache缓存5分钟的cache过期时间
static const NSTimeInterval APPCacheOutdateTimeSeconds = 300;
#pragma mark -cache缓存最多1000条cache
static const NSUInteger APPCacheCountLimit = 1000;

#pragma mark -生产环境
static NSString *const APPServerAddress_online = @"http://139.196.178.139:8080";

#pragma mark -测试环境
static NSString *const APPServerAddress_offline = @"http://120.26.241.229:8001";

static NSString *const APPVersion_online = @"xgorder/api";
static NSString *const APPVersion_offline = @"xgorder/api";

#pragma mark======================服务配置end================================


#pragma mark ========================用户信息相关==============================

#pragma mark -登录
static NSString *const APPMethodName_login = @"useraccount/login.do";

#pragma mark -地区信息  缓存本地
static NSString *const APPMethodName_areaInfo = @"customer/getArea.do";

#pragma mark======================用户信息相关end================================



#endif /* APPNetWorkURLS_h */
