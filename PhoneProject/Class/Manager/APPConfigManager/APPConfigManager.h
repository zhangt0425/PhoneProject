//
//  APPConfigManager.h
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/28.
//  Copyright © 2017年 张涛. All rights reserved.
//

/*
 * singleton_for_header() singleton_for_class() 单例快速创建
 */

#import <Foundation/Foundation.h>

@interface APPConfigManager : NSObject

singleton_for_header(APPConfigManager)

//打印基本信息
- (void)printsAppConfigInfo;

//获取当前app服务器APPServiceISOnline
- (BOOL)appServiceISOnline;

//获取当前app服务器地址
- (NSString *)appServerAddress;

//获取运营商
-(NSString *)carrierName;

//网络状态
- (NSString *)networkingStates;

/*网络流量信息*/
- (void)checkNetworkflow;

@end
