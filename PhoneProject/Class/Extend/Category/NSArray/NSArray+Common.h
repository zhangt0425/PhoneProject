//
//  NSArray+Common.h
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/21.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Common)

/**
 *  NSArray 添加
 *
 *  @param object 数据
 *
 *  @return 返回修改后的NSArray
 */
- (NSArray *)addObject:(id)object;

/**
 *  NSArray 插入数据
 *
 *  @param object 数据
 *  @param index  插入下标
 *
 *  @return 返回修改后数组
 */
- (NSArray *)insertObject:(id)object atIndex:(NSUInteger)index;

/**
 *  NSArray 删除某一个数据
 *
 *  @param object 数据
 *
 *  @return 返回修改后数组
 */
- (NSArray *)removeObject:(id)object;

/**
 *  NSArray 删除下标的数据
 *
 *  @param index 下标
 *
 *  @return 返回修改后数组
 */
- (NSArray *)removeObjectAtIndex:(NSUInteger)index;

/**
 *  NSArray 删除最后一个数据
 *
 *  @return 修改后的数组
 */
- (NSArray *)moveLastObject;

/**
 *  NSArray 替换某个下标下的数据
 *
 *  @param index  下标
 *  @param object 数据
 *
 *  @return 返回修改后的数据
 */
- (NSArray *)replaceObjectAtIndex:(NSUInteger)index withObject:(id)object;

/**
 *  NSArray 移动数组内两个下标下的数据
 *
 *  @param fromIndex 想移动的下标
 *  @param toIndex   移动到的下标
 *
 *  @return 返回修改后的数据
 */
- (NSArray *)moveObjectFromIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex;

/**
 *  NSArray 移动某个数据到一个下标下
 *
 *  @param object  数据
 *  @param toIndex 移动到的下标
 *
 *  @return 返回修改后的数据
 */
- (NSArray *)moveObject:(id)object toIndex:(NSUInteger)toIndex;


@end
