//
//  DateManager.h
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/24.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateManager : NSObject

//  DateManager 用于管理统一时间转换或计算的方法

#pragma mark - 时间戳转时间格式
/**
 *  时间戳转时间格式
 *
 *  @param time         传入时间戳
 *  @param format       格式,如"yyyy-MM-dd HH:mm:ss"
 *
 *  @return 普通时间
 */
+ (NSString *)changeTimestampToCommonTime:(long)time format:(NSString *)format;

#pragma mark - 时间格式转时间戳
/**
 *  时间格式转时间戳
 *
 *  @param time   普通时间
 *  @param format 格式,如"yyyy-MM-dd HH:mm:ss"
 *
 *  @return 时间戳
 */
+ (long)changeCommonTimeToTimestamp:(NSString *)time format:(NSString *)format;

#pragma mark - 计算某个时间戳距现在多少时间
/**
 *  计算某个时间戳距现在多少时间
 *
 *  @param compareDate 某时间
 *
 *  @return 相差时间
 */
+ (NSMutableDictionary *)compareCurrentTime:(NSInteger)compareDate;

#pragma mark - 倒计时时间戳转时间
/**
 *  倒计时时间戳转时间
 *
 *  @param countDownTime 倒计时时间戳
 *
 *  @return 倒计时时间
 */
+ (NSMutableDictionary *)changeCountDownTime:(NSInteger)countDownTime;


@end
