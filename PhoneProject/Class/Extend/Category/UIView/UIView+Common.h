//
//  UIView+Common.h
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/21.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Common)

/**
 *  获取左上角横坐标
 *
 *  @return 坐标值
 */
- (CGFloat)left;

/**
 *  获取左上角纵坐标
 *
 *  @return 坐标值
 */
- (CGFloat)top;

/**
 *  获取视图右下角横坐标
 *
 *  @return 坐标值
 */
- (CGFloat)right;

/**
 *  获取视图右下角纵坐标
 *
 *  @return 坐标值
 */
- (CGFloat)bottom;

/**
 *  获取视图宽度
 *
 *  @return 宽度值（像素）
 */
- (CGFloat)width;

/**
 *  获取视图高度
 *
 *  @return 高度值（像素）
 */
- (CGFloat)height;

/**
 *	@brief	删除所有子对象
 */
- (void)removeAllSubviews;

// By DQ
// 左上横坐标
@property (assign,nonatomic) CGFloat left;

// 左上纵坐标
@property (assign,nonatomic) CGFloat top;

// 视图宽度
@property (assign,nonatomic) CGFloat width;

// 视图高度
@property (assign,nonatomic) CGFloat height;

// 视图中心X坐标
@property (assign,nonatomic) CGFloat centerX;

// 视图中心Y坐标
@property (assign,nonatomic) CGFloat centerY;


// 添加子视图在最上层
- (void)addSubviewOrBringToFront:(UIView *)subview;

/**
 *  快速修改对象的单个属性值
 *
 *  要修改的view、imageView、button、...
 *  @param key   要修改的属性，例如：@"x",@"y",@"w",@"h"
 *  @param value 被修改属性的新值
 */
- (void)frameSet:(NSString *)key value:(CGFloat)value;

/**
 *  快速修改对象的多个属性值
 *
 *  要修改的view、imageView、button、...
 *  @param key1   要修改的属性1，例如：@"x",@"y",@"w",@"h"
 *  @param value1 属性1的新值
 *  @param key2   要修改的属性2，例如：@"x",@"y",@"w",@"h"
 *  @param value2 属性2的新值
 */
- (void)frameSet:(NSString *)key1 value1:(CGFloat)value1 key2:(NSString *)key2 value2:(CGFloat)value2;

@end
