//
//  NSDictionary+Common.m
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/21.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "NSDictionary+Common.h"

@implementation NSDictionary (Common)

- (id)objectForPKey:(id)pKey
{
    if (![[self allKeys] containsObject:pKey])
    {
        // 如果pKey不存在，则返回空字符串
        return @"";
    }
    // 返回原本key对应的value
    return [self objectForKey:pKey];
}

@end
