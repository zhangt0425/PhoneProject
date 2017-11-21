//
//  UIImage+ImageWithColor.h
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/21.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ImageWithColor)

/**
 *  拥有一个具有颜色的image实例
 *
 *  @param color 需要的颜色
 *
 *  @return UIImage
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

/**
 *  拥有一个具有渐变颜色的image实例
 *
 *  @param tintColor 需要渐变的颜色
 *
 *  @return 渐变的规则是由上至下变深，最深就是tintColor
 */
- (UIImage*)tintedGradientImageWithColor:(UIColor*)tintColor;
/**
 *  改变iamage实例的颜色
 *
 *  @param tintColor 想要的颜色
 *
 *  @return 改变过颜色的image实例
 */
- (UIImage*)tintedImageWithColor:(UIColor*)tintColor;

/**
 *  重新绘制图片颜色
 *
 *  @param color 填充色
 *
 *  @return UIImage
 */
- (UIImage *)drawImageWithColor:(UIColor *)color;

@end
