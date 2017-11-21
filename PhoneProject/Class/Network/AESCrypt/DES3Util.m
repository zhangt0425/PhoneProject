//
//  DES3Util.m
//  lx100-gz
//
//  Created by  柳峰 on 12-9-17.
//  Copyright 2012 http://blog.csdn.net/lyq8479. All rights reserved.
//

#import "DES3Util.h"
#import <CommonCrypto/CommonCryptor.h>
#import <CommonCrypto/CommonDigest.h>  
#import <Security/Security.h>
#import "LKGTMBase64.h"
#import "GTMDefines.h"

//密匙 key
#define gkey			@"71fe6c299e7ec3e29ab0bb82b4cdb77a"
//偏移量
#define gIv             @"01234567"

@implementation DES3Util

#pragma mark - 加密
/**
 *  字典元素值加密
 *
 *  @param dicData dicData description
 */
+ (NSMutableDictionary *)getSecrityForString:(NSDictionary *)dicData;
{
    NSMutableDictionary *newDic = [[NSMutableDictionary alloc] init];
    NSArray *keyArray = [dicData allKeys];
    
    for (int i = 0; i<keyArray.count; i++)
    {
        NSString *keyString = keyArray[i];
        NSString *valueString = dicData[keyString];
        NSString *encrpt = [DES3Util encrypt:valueString];
        [newDic setValue:encrpt forKey:keyString];
        DEF_DEBUG(@"%@",encrpt);
    }
    
    return newDic;
}

// 加密方法
+ (NSString*)encrypt:(NSString*)plainText
{
    
    NSData* data = [plainText dataUsingEncoding:NSUTF8StringEncoding];
    size_t plainTextBufferSize = [data length];
    const void *vplainText = (const void *)[data bytes];
    
    CCCryptorStatus ccStatus;
    uint8_t *bufferPtr = NULL;
    size_t bufferPtrSize = 0;
    size_t movedBytes = 0;
    
    bufferPtrSize = (plainTextBufferSize + kCCBlockSize3DES) & ~(kCCBlockSize3DES - 1);
    bufferPtr = malloc( bufferPtrSize * sizeof(uint8_t));
    memset((void *)bufferPtr, 0x0, bufferPtrSize);
    
    const void *vkey = (const void *) [gkey UTF8String];
    const void *vinitVec = (const void *) [gIv UTF8String];
    ccStatus = CCCrypt(kCCEncrypt,
                       kCCAlgorithm3DES,
                       kCCOptionPKCS7Padding,
                       vkey,
                       kCCKeySize3DES,
                       vinitVec,
                       vplainText,
                       plainTextBufferSize,
                       (void *)bufferPtr,
                       bufferPtrSize,
                       &movedBytes);
    
    NSData *myData = [NSData dataWithBytes:(const void *)bufferPtr length:(NSUInteger)movedBytes];
    NSString *result = [LKGTMBase64 stringByEncodingData:myData];
    return result;
}

// 解密方法
+ (NSString*)decrypt:(NSString*)encryptText
{
    //把“字符去掉
    encryptText=[self ignoreSpecialStringWithString:encryptText];
    //encryptText=@"3iIesppzHdnmAsMrwPVgSPPtsIzgNSmn";
    NSData *encryptData = [LKGTMBase64 decodeData:[encryptText dataUsingEncoding:NSUTF8StringEncoding]];
    
    size_t plainTextBufferSize = [encryptData length];
    const void *vplainText = [encryptData bytes];
    
    CCCryptorStatus ccStatus;
    uint8_t *bufferPtr = NULL;
    size_t bufferPtrSize = 0;
    size_t movedBytes = 0;
    
    bufferPtrSize = (plainTextBufferSize + kCCBlockSize3DES) & ~(kCCBlockSize3DES - 1);
    bufferPtr = malloc( bufferPtrSize * sizeof(uint8_t));
    memset((void *)bufferPtr, 0x0, bufferPtrSize);
    
    const void *vkey = (const void *) [gkey UTF8String];
    const void *vinitVec = (const void *) [gIv UTF8String];
    
    ccStatus = CCCrypt(kCCDecrypt,
                       kCCAlgorithm3DES,
                       kCCOptionPKCS7Padding,
                       vkey,
                       kCCKeySize3DES,
                       vinitVec,
                       vplainText,
                       plainTextBufferSize,
                       (void *)bufferPtr,
                       bufferPtrSize,
                       &movedBytes);
    
    
    NSString *result = [[NSString alloc] initWithData:[NSData dataWithBytes:(const void *)bufferPtr
                                                                      length:(NSUInteger)movedBytes] encoding:NSUTF8StringEncoding];
    return result;
}
#pragma mark - 过滤特殊字符
+ (NSString *)ignoreSpecialStringWithString:(NSString *)encryptText
{
    //把 “ 字符去掉
    encryptText=[encryptText stringByReplacingOccurrencesOfString:@"""\"" withString:@""];
    // 如果还有别的特殊字符，请添加在这里
    
    return encryptText;
}

@end
