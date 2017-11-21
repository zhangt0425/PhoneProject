//
//  NSDate+Common.h
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/21.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kMinuteTimeInterval (60)
#define kHourTimeInterval   (60 * kMinuteTimeInterval)
#define kDayTimeInterval    (24 * kHourTimeInterval)
#define kWeekTimeInterval   (7  * kDayTimeInterval)
#define kMonthTimeInterval  (30 * kDayTimeInterval)
#define kYearTimeInterval   (12 * kMonthTimeInterval)

@interface NSDate (Common)

- (BOOL)isToday;

- (BOOL)isYesterday;

- (NSString *)shortTimeTextOfDate;

- (NSString *)timeTextOfDate;

/** 不进行时差纠正 */
- (NSString *) stringForNormalDataFormatter:(NSString *)formatter;

/** 进行时差纠正 */
- (NSString *) stringForDataFormatter:(NSString *)formatter;

/** 时差纠正之后的时间 */
- (NSDate *) solveOffset;

- (NSArray *)getWeekDateInfo;

- (NSInteger) getWeekDay;

- (NSInteger) getDay;

- (NSInteger) getMonth;

/**
 *  获取系统时间
 *
 *  @return 字符串格式的系统时间
 */
+(NSString*)getCurrentTime;

@end
