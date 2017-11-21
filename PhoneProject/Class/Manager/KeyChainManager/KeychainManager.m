//
//  KeychainManager.m
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/24.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "KeychainManager.h"
#import "KeyChain.h"


//用bundleid来做key 保证唯一性
#define KEY_IN_KEYCHAIN  [[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString *)kCFBundleIdentifierKey]

#define KEY_PASSWOED [KEY_IN_KEYCHAIN stringByAppendingString:@"Password"]
#define KEY_USERNAME [KEY_IN_KEYCHAIN stringByAppendingString:@"UserName"]


@implementation KeychainManager

/**
 *  保存其他类型数据
 *  withKey 字典key
 *  withValue 字典value
 */
+ (void)saveOtherKey:(id)withKey value:(id)withValue;
{
    NSMutableDictionary *data = [NSMutableDictionary dictionary];
    [data setObject:withValue forKey:withKey];
    [KeyChain saveKeychain:KEY_IN_KEYCHAIN data:data];
}


/**
 *  读取其他数据数据
 *
 *  @return return value description
 */
+ (id)readValueWithKey:(id)withKey
{
    NSMutableDictionary *data = (NSMutableDictionary *)[KeyChain loadKeychain:KEY_IN_KEYCHAIN];
    return [data objectForKey:withKey];
}
/**
 *  读取密码
 *
 *  @return return value description
 */
+ (id)readPassword
{
    NSString *password= [self readValueWithKey:KEY_PASSWOED];
    return password;
}

/**
 *  读取用户名
 *
 *  @return <#return value description#>
 */
+ (id)readUserName
{
    NSString *userName= [self readValueWithKey:KEY_USERNAME];
    return userName;
    
}


@end
