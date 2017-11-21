//
//  JsonManager.m
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/23.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "JsonManager.h"
@implementation JsonManager

+ (id)JSONObjectWithValue:(id)value
{
    if ([value isKindOfClass:[NSString class]])
    {
        return [self JSONStringWithValue:value];
    }
    else if ([value isKindOfClass:[NSDictionary class]]||[value isKindOfClass:[NSArray class]])
    {
        return [self JSONNSDictionaryOrNSArrayWithValue:value];
    }
    return nil;
   
}
// json字符串字转字典或数组
+ (id)JSONStringWithValue:(NSString *)string
{
    NSError *error  = nil;
    id  result       = [NSJSONSerialization JSONObjectWithData:[string dataUsingEncoding:NSUTF8StringEncoding]
                                                      options:NSJSONReadingMutableContainers  error:nil];
    if (error)
    {
        DEF_DEBUG(@"JsonManager JSONValue error: %@", error);
    }

    return result;
}
// 字典或数组转json字符串
+ (NSString *)JSONNSDictionaryOrNSArrayWithValue:(id)value
{
    if (![value isKindOfClass:[NSDictionary class]] && ![value isKindOfClass:[NSArray class]])
    {
        DEF_DEBUG(@"JSONValueWithValue value error");
        return nil;
    }
    // 所有的数据判断都放到上面的方法，这里直接调用上面的方法即可
    NSData *data = [self dataWithObject:value];
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

// 传入字典或者数组 转换成data
+ (NSData *)dataWithObject:(id)value
{
    if (![value isKindOfClass:[NSDictionary class]]&& ![value isKindOfClass:[NSArray class]])
    {
        DEF_DEBUG(@"dataWithObject value error");
        return nil;
    }
    //使用系统版本
    NSError *error  = nil;
    id result       = [NSJSONSerialization dataWithJSONObject:value options:NSJSONWritingPrettyPrinted error:&error];
    if (error)
    {
        DEF_DEBUG(@"jsonManager dataWithObject  value error->%@", error);
    }
    
    return result;
}

// data数据转换成字典或数组
+ (id)objectWithData:(NSData *)data
{
    if (!data)
    {
        DEF_DEBUG(@"JsonManager objectWithData data is nil");
        return nil;
    }
    NSError *error  = nil;
    id result       = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    if (error)
    {
        DEF_DEBUG(@"JsonManager objectWithData error: %@", error);
    }
    return result;
}

@end
