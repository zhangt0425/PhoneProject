//
//  UIImage+CommonBlur.h
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/21.
//  Copyright © 2017年 张涛. All rights reserved.
//
/**
 *  图片模糊效果
 *
 *  @framework
 *      Accelerate.framework
 *      QuartzCore.framework
 */
#import <UIKit/UIKit.h>

#import <Accelerate/Accelerate.h>
#import <QuartzCore/QuartzCore.h>

@interface UIImage (CommonBlur)

// 0.0 to 1.0
- (UIImage*)blurredImage:(CGFloat)blurAmount;

- (UIImage *)applyBlurWithRadius:(CGFloat)blurRadius
                       tintColor:(UIColor *)tintColor
           saturationDeltaFactor:(CGFloat)saturationDeltaFactor
                       maskImage:(UIImage *)maskImage;


@end
