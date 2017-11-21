//
//  NSMutableArray+Common.h
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/21.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (Common)

/**
 *  NSMutableArray 移动数组内两个下标下的数据
 *
 *  @param fromIndex 想移动的下标
 *  @param toIndex   移动到的下标
 */
- (void)moveObjectFromIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex;

/**
 *  NSMutableArray
 *
 *  @param object  移动的数据
 *  @param toIndex 移动到的下标
 */
- (void)moveObject:(id)object toIndex:(NSUInteger)toIndex;

@end
