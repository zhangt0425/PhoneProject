//
//  UIColor+Common.h
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/21.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Common)

/**
 *   返回一个随机颜色实例
 */
+ (UIColor *)randomColor;


#pragma mark - 使用二进制颜色值
/**
 *  使用二进制颜色值
 *
 *  @param hex   颜色的二进制值
 *  @param alpha 透明度
 *
 *  @return 颜色
 */
+ (UIColor *)colorWithRGBHex:(UInt32)hex alpha:(CGFloat)alpha;


/**
 *  使用16进制颜色值
 *
 *  @param string   颜色的16进制值
 *
 *  @return 颜色
 */
+ (UIColor *)colorWithHexString:(NSString *)string;


@end
