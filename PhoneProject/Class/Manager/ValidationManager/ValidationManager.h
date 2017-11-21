//
//  ValidationManager.h
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/24.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 *  app验证相关都到这里
 */

@interface ValidationManager : NSObject


#pragma mark - 判断字符串是否为空
/**
 *  判断字符串是否为空
 *
 *  @param string 要判断的字符串
 *
 *  @return 返回YES为空，NO为不空
 */
+ (BOOL)isBlankString:(NSString *)string;

/**
 *  判断是否为真实手机号码
 *
 *  @param text 手机号
 *
 *  @return 返回YES为真实手机号码，NO为否
 */
+ (BOOL)checkInputMobile:(NSString *)text;

/**
 *  判断email格式是否正确
 *
 *  @param emailString 邮箱
 *
 *  @return 返回YES为Email格式正确，NO为否
 */
+ (BOOL)isAvailableEmail:(NSString *)emailString;

/**
 *  姓名验证
 *
 *  @param name 姓名
 *
 *  @return 返回YES为姓名规格正确，NO为否
 */
+ (BOOL)isValidateName:(NSString *)name;

/**
 *  判断身份证号是否合法
 *
 *  @param cardId cardId description
 *
 *  @return return value description
 */
+ (BOOL)isUserCard:(NSString *)cardId;


@end
