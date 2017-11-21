//
//  UIButton+Common.m
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/21.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "UIButton+Common.h"

@implementation UIButton (Common)

//快速创建BUtton

+ (UIButton*)initButton
{
    return [self initButtonWithNormalTitle:nil font:16.0 normalTextColor:[UIColor blackColor]];
}

+ (UIButton *)initButtonWithNormalTitle:(NSString*)normalTitle font:(CGFloat)font normalTextColor:(UIColor*)normalTextColor
{
    return [self initButtonWithNormalTitle:normalTitle font:font normalTextColor:normalTextColor rect:CGRectZero];
}
+ (UIButton *)initButtonWithNormalTitle:(NSString*)normalTitle font:(CGFloat)font normalTextColor:(UIColor*)normalTextColor normalImage:(UIImage *)normalImage
{
    return [self initButtonWithNormalTitle:normalTitle font:font normalTextColor:normalTextColor normalImage:normalImage rect:CGRectZero];
}
+ (UIButton *)initButtonWithNormalTitle:(NSString*)normalTitle font:(CGFloat)font normalTextColor:(UIColor*)normalTextColor rect:(CGRect) rect
{
    return [self initButtonWithNormalTitle:normalTitle font:font normalTextColor:normalTextColor normalImage:nil rect:rect];
}

+ (UIButton *)initButtonWithNormalTitle:(NSString*)normalTitle font:(CGFloat)font normalTextColor:(UIColor*)normalTextColor normalImage:(UIImage *)normalImage rect:(CGRect) rect
{
  
    return [self initButtonWithNormalTitle:normalTitle font:font normalTextColor:normalTextColor normalImage:normalImage selectedTitle:normalTitle selectedTextColor:normalTextColor selectedImage:normalImage rect:rect];
    
}
+ (UIButton *)initButtonWithNormalTitle:(NSString*)normalTitle font:(CGFloat)font normalTextColor:(UIColor*)normalTextColor normalImage:(UIImage *)normalImage selectedTitle:(NSString *)selectedTitle selectedTextColor:(UIColor *)selectedTextColor selectedImage:(UIImage *)selectedImage rect:(CGRect) rect
{
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor clearColor];
    button.titleLabel.font = [UIFont systemFontOfSize:font];
    button.frame=rect;
    
    [button setTitleColor:normalTextColor forState:UIControlStateNormal];
    [button setTitle:normalTitle forState:UIControlStateNormal];
    [button setImage:normalImage forState:UIControlStateNormal];
    
    [button setTitleColor:selectedTextColor forState:UIControlStateSelected];
    [button setTitle:selectedTitle forState:UIControlStateSelected];
    [button setImage:selectedImage forState:UIControlStateSelected];
    return button;
}
@end
