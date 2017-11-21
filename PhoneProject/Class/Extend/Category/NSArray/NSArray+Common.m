//
//  NSArray+Common.m
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/21.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "NSArray+Common.h"

@implementation NSArray (Common)

- (NSArray *)addObject:(id)object
{
    NSMutableArray *array = [self mutableCopy];
    [array addObject:object];
    return [array copy];
}

- (NSArray *)insertObject:(id)object atIndex:(NSUInteger)index
{
    NSMutableArray *array = [self mutableCopy];
    [array insertObject:object atIndex:index];
    return [array copy];
}

- (NSArray *)removeObject:(id)object
{
    NSMutableArray *array = [self mutableCopy];
    [array removeObject:object];
    return [array copy];
}

- (NSArray *)removeObjectAtIndex:(NSUInteger)index
{
    NSMutableArray *array = [self mutableCopy];
    [array removeObjectAtIndex:index];
    return [array copy];
}

- (NSArray *)moveLastObject
{
    NSMutableArray *array = [self mutableCopy];
    [array removeLastObject];
    return [array copy];
}

- (NSArray *)replaceObjectAtIndex:(NSUInteger)index withObject:(id)object
{
    NSMutableArray *array = [self mutableCopy];
    [array replaceObjectAtIndex:index withObject:object];
    return [array copy];
}

- (NSArray *)moveObjectFromIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex
{
    if (fromIndex == toIndex)
    {
        return self;
    }
    NSMutableArray *array = [self mutableCopy];
    if (toIndex != fromIndex && fromIndex < [array count] && toIndex< [array count])
    {
        id obj = [self objectAtIndex:fromIndex];
        [array removeObjectAtIndex:fromIndex];
        if (toIndex >= [self count])
        {
            [array addObject:obj];
        } else {
            [array insertObject:obj atIndex:toIndex];
        }
    }
    return [array copy];
}

- (NSArray *)moveObject:(id)object toIndex:(NSUInteger)toIndex
{
    NSUInteger fromIndex = [self indexOfObject:object];
    return [self moveObjectFromIndex:fromIndex toIndex:toIndex];
}


@end
