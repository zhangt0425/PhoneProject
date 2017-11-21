//
//  KeyChain.h
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/24.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KeyChain : NSObject

//需要导入Security.framework框架 数据信息存储钥匙串，app删除后重新安装依然可以拿到数据

+ (NSMutableDictionary *)getKeychainQuery:(NSString *)key;

+ (void)saveKeychain:(NSString *)key data:(id)data;

+ (id)loadKeychain:(NSString *)key;

+ (void)deleteKeychain:(NSString *)key;

@end
