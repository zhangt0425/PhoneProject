//
//  UITextField+Common.h
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/21.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Common)

//快速创建
+ (UITextField*)initTextField;

+ (UITextField*)initTextFieldWithTitle:(NSString *)title font:(CGFloat)font textColor:(UIColor *)textColor;

+ (UITextField*)initTextFieldWithTitle:(NSString *)title font:(CGFloat)font textColor:(UIColor *)textColor rect:(CGRect)rect;

+ (UITextField*)initTextFieldWithTitle:(NSString *)title placeholder:(NSString *)placeholder font:(CGFloat)font  textColor:(UIColor *)textColor;

+ (UITextField*)initTextFieldWithTitle:(NSString *)title placeholder:(NSString *)placeholder font:(CGFloat)font textColor:(UIColor *)textColor rect:(CGRect)rect;

+ (UITextField*)initTextFieldWithTitle:(NSString *)title placeholder:(NSString *)placeholder font:(CGFloat)font textColor:(UIColor *)textColor borderStyle:(UITextBorderStyle)borderStyle;

+ (UITextField*)initTextFieldWithTitle:(NSString *)title placeholder:(NSString *)placeholder font:(CGFloat)font textColor:(UIColor *)textColor borderStyle:(UITextBorderStyle)borderStyle rect:(CGRect)rect;

@end
