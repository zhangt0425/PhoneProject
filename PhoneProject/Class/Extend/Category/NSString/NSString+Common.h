//
//  NSString+Common.h
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/21.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Common)

#pragma mark - 文本国际化
/**
 *  文本国际化
 *
 *  @param dict 文本字典
 *
 *  @return 国际化之后的文本
 */
+ (NSString *)stringByDict:(NSDictionary *)dict;

#pragma mark - 过滤html特殊字符
/**
 *  过滤html特殊字符
 *
 *  @return 过滤后的string
 */
- (NSString *)ignoreHTMLSpecialString;


#pragma mark - MD5加密
/**
 *  MD5加密
 *
 *  @return MD5加密后的新字段
 */
- (NSString *)md5;


#pragma mark - URL编码
/**
 *  URL编码，http请求遇到汉字的时候，需要转化成UTF-8
 *
 *  @return 编码的字符串
 */
- (NSString *)urlCodingToUTF8;


#pragma mark - URL解码
/**
 *  URL解码，URL格式是 %3A%2F%2F 这样的，则需要进行UTF-8解码
 *
 *  @return 解码的字符串
 */
- (NSString *)urlDecodingToUrlString;

extern NSString *describe (id object);//打印相关

@end
