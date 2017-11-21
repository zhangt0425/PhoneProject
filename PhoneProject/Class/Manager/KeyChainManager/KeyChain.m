//
//  KeyChain.m
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/24.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "KeyChain.h"

@implementation KeyChain

/**
 *  获取钥匙串
 *
 *  @param key 关键词
 *
 *  @return <#return value description#>
 */
+ (NSMutableDictionary *)getKeychainQuery:(NSString *)key
{
    return [NSMutableDictionary dictionaryWithObjectsAndKeys:
            (__bridge_transfer id)kSecClassGenericPassword,(__bridge_transfer id)kSecClass,
            key, (__bridge_transfer id)kSecAttrService,
            key, (__bridge_transfer id)kSecAttrAccount,
            (__bridge_transfer id)kSecAttrAccessibleAfterFirstUnlock,(__bridge_transfer id)kSecAttrAccessible,
            nil];
}

/**
 *  保存数据
 *
 *  @param key 关键词
 *  @param data 数据
 */
+ (void)saveKeychain:(NSString *)key data:(id)data
{
    //获取钥匙串
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:key];
    //保存前删除旧的
    SecItemDelete((__bridge_retained CFDictionaryRef)keychainQuery);
    //保存数据
    [keychainQuery setObject:[NSKeyedArchiver archivedDataWithRootObject:data] forKey:(__bridge_transfer id)kSecValueData];
    //添加到钥匙串
    SecItemAdd((__bridge_retained CFDictionaryRef)keychainQuery, NULL);
}

/**
 *  读取钥匙串
 *
 *  @param key 关键词
 *
 *  @return return value description
 */
+ (id)loadKeychain:(NSString *)key
{
    id data = nil;
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:key];
    //配置钥匙串设置
    [keychainQuery setObject:(id)kCFBooleanTrue forKey:(__bridge_transfer id)kSecReturnData];
    [keychainQuery setObject:(__bridge_transfer id)kSecMatchLimitOne forKey:(__bridge_transfer id)kSecMatchLimit];
    
    CFDataRef keyData = NULL;
    if (SecItemCopyMatching((__bridge_retained CFDictionaryRef)keychainQuery, (CFTypeRef *)&keyData) == noErr) {
        //异常捕捉
        @try {
            data = [NSKeyedUnarchiver unarchiveObjectWithData:(__bridge_transfer NSData *)keyData];
        } @catch (NSException *exception) {
            NSLog(@"Unarchive of %@ failed: %@", key, exception);
            return nil;
        } @finally {
            
        }
    }
    return data;
}

/**
 *  删除数据
 *
 *  @param key 关键词
 */
+ (void)deleteKeychain:(NSString *)key
{
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:key];
    SecItemDelete((__bridge_retained CFDictionaryRef)keychainQuery);
}

@end
