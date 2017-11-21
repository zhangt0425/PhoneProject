//
//  KeychainManager.h
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/24.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  app用户信息相关，可以都放在此处处理 
 *  KeyChain 钥匙串保存用户信息
 */

@interface KeychainManager : NSObject

/**
 *  保存其他类型数据
 *  withKey 字典key
 *  withValue 字典value
 */
+ (void)saveOtherKey:(id)withKey value:(id)withValue;

/**
 *  读取其他数据数据
 *
 *  @return return value description
 */
+ (id)readValueWithKey:(id)withKey;

/**
 *  读取密码
 *
 *  @return return value description
 */
+ (id)readPassword;

/**
 *  读取用户名
 *
 *  @return <#return value description#>
 */
+ (id)readUserName;

@end
