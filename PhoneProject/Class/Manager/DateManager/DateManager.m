//
//  DateManager.m
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/24.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "DateManager.h"

@implementation DateManager

#pragma mark - 时间戳转时间格式
+ (NSString *)changeTimestampToCommonTime:(long)time format:(NSString *)format;
{
    //设置时间格式
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:format];
    
    //设置时区
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    
    return [NSString stringWithFormat:@"%@",[formatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:time]]];
}


#pragma mark - 时间格式转时间戳
+ (long)changeCommonTimeToTimestamp:(NSString *)time format:(NSString *)format
{
    //设置时间格式
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:format];
    
    //设置时区
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    
    return (long)[[formatter dateFromString:time] timeIntervalSince1970];
}

+ (NSMutableDictionary *)compareCurrentTime:(NSInteger)compareDate
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:compareDate];
    NSTimeInterval timeInterval = [date timeIntervalSinceNow];
    timeInterval = fabs(timeInterval);
    
    NSString *hour,*second,*minute,*day;
    
    second = [NSString stringWithFormat:@"%d", (int)timeInterval % 60];
    minute = [NSString stringWithFormat:@"%d", (int)timeInterval / 60 % 60];
    hour = [NSString stringWithFormat:@"%d", (int)timeInterval / 3600];
    day = [NSString stringWithFormat:@"%d", (int)timeInterval / 3600 / 24];
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setValue:second forKey:@"second"];
    [dic setValue:minute forKey:@"min"];
    [dic setValue:hour forKey:@"hour"];
    [dic setValue:day forKey:@"day"];
    
    return dic;
}

+ (NSMutableDictionary *)changeCountDownTime:(NSInteger)countDownTime
{
    NSString *hour,*second,*minute,*day;
    
    second = [NSString stringWithFormat:@"%d", (int)countDownTime % 60];
    minute = [NSString stringWithFormat:@"%d", (int)countDownTime / 60 % 60];
    hour = [NSString stringWithFormat:@"%d", (int)countDownTime / 3600];
    day = [NSString stringWithFormat:@"%d", (int)countDownTime / 3600 / 24];
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setValue:second forKey:@"second"];
    [dic setValue:minute forKey:@"min"];
    [dic setValue:hour forKey:@"hour"];
    [dic setValue:day forKey:@"day"];
    
    return dic;
}


@end
