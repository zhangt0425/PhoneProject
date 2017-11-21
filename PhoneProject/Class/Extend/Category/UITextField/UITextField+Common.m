//
//  UITextField+Common.m
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/21.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "UITextField+Common.h"

@implementation UITextField (Common)

+ (UITextField*)initTextField
{
    return [self initTextFieldWithTitle:nil font:16.0 textColor:[UIColor blackColor]];
}

+ (UITextField*)initTextFieldWithTitle:(NSString *)title font:(CGFloat)font textColor:(UIColor *)textColor
{
    return [self initTextFieldWithTitle:title font:font textColor:textColor rect:CGRectZero];
}

+ (UITextField*)initTextFieldWithTitle:(NSString *)title font:(CGFloat)font textColor:(UIColor *)textColor rect:(CGRect)rect
{
    return [self initTextFieldWithTitle:title placeholder:nil font:font  textColor:textColor borderStyle:UITextBorderStyleNone rect:rect];
}

+ (UITextField*)initTextFieldWithTitle:(NSString *)title placeholder:(NSString *)placeholder font:(CGFloat)font textColor:(UIColor *)textColor
{
    return [self initTextFieldWithTitle:title placeholder:placeholder font:font textColor:textColor rect:CGRectZero];
}

+ (UITextField*)initTextFieldWithTitle:(NSString *)title placeholder:(NSString *)placeholder font:(CGFloat)font textColor:(UIColor *)textColor rect:(CGRect)rect
{
    return  [self initTextFieldWithTitle:title placeholder:placeholder font:font textColor:textColor borderStyle:UITextBorderStyleNone rect:rect];
}

+ (UITextField*)initTextFieldWithTitle:(NSString *)title placeholder:(NSString *)placeholder font:(CGFloat)font textColor:(UIColor *)textColor borderStyle:(UITextBorderStyle)borderStyle
{
    return [self initTextFieldWithTitle:title placeholder:placeholder font:font textColor:textColor borderStyle:borderStyle rect:CGRectZero];
}

+ (UITextField*)initTextFieldWithTitle:(NSString *)title placeholder:(NSString *)placeholder font:(CGFloat)font textColor:(UIColor *)textColor borderStyle:(UITextBorderStyle)borderStyle rect:(CGRect)rect
{
    UITextField *textField = [[UITextField alloc]init];
    textField.font =[UIFont systemFontOfSize:font];
    textField.placeholder = placeholder;
    textField.text=title;
    textField.textColor=textColor;
    textField.borderStyle = borderStyle;
    textField.clearsOnBeginEditing = YES;
    return textField;

}
@end
