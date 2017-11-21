//
//  UILabel+Common.h
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/21.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Common)

//快速创建lable

+ (UILabel*)initLabel;

+ (UILabel *)initLabelWithTitle:(NSString*)title font:(CGFloat)font color:(UIColor*)textColor;

+ (UILabel *)initLabelWithTitle:(NSString*)title font:(CGFloat)font color:(UIColor*)textColor textAlignment:(NSTextAlignment)textAlignment;

+ (UILabel *)initLabelWithTitle:(NSString*)title font:(CGFloat)font color:(UIColor*)textColor textAlignment:(NSTextAlignment)textAlignment rect:(CGRect) rect;


- (CGFloat)originalHeight;

// 设置Label的文字显示方式从左上角开始
- (void)alignTop;

// 设置Label的文字显示方式从左下角开始
- (void)alignBottom;

@end
