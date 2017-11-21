//
//  NSMutableArray+Common.m
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/21.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "NSMutableArray+Common.h"

@implementation NSMutableArray (Common)

- (void)moveObjectFromIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex
{
    
    if (fromIndex == toIndex)
    {
        return;
    }
    if (toIndex != fromIndex && fromIndex < [self count] && toIndex< [self count])
    {
        id obj = [self objectAtIndex:fromIndex];
        [self removeObjectAtIndex:fromIndex];
        if (toIndex >= [self count])
        {
            [self addObject:obj];
        } else {
            [self insertObject:obj atIndex:toIndex];
        }
    }
}

- (void)moveObject:(id)object toIndex:(NSUInteger)toIndex
{
    NSUInteger fromIndex = [self indexOfObject:object];
    [self moveObjectFromIndex:fromIndex toIndex:toIndex];
}


@end
