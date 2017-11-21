//
//  UIButton+Common.h
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/21.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Common)

//快速创建BUtton

+ (UIButton*)initButton;

+ (UIButton *)initButtonWithNormalTitle:(NSString*)normalTitle font:(CGFloat)font normalTextColor:(UIColor*)normalTextColor;


+ (UIButton *)initButtonWithNormalTitle:(NSString*)normalTitle font:(CGFloat)font normalTextColor:(UIColor*)normalTextColor normalImage:(UIImage *)normalImage;

+ (UIButton *)initButtonWithNormalTitle:(NSString*)normalTitle font:(CGFloat)font normalTextColor:(UIColor*)normalTextColor rect:(CGRect) rect;

+ (UIButton *)initButtonWithNormalTitle:(NSString*)normalTitle font:(CGFloat)font normalTextColor:(UIColor*)normalTextColor normalImage:(UIImage *)normalImage rect:(CGRect) rect;

+ (UIButton *)initButtonWithNormalTitle:(NSString*)normalTitle font:(CGFloat)font normalTextColor:(UIColor*)normalTextColor normalImage:(UIImage *)normalImage selectedTitle:(NSString *)selectedTitle selectedTextColor:(UIColor *)selectedTextColor selectedImage:(UIImage *)selectedImage rect:(CGRect) rect;

@end
