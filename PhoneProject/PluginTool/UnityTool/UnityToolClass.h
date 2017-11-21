//
//  UnityToolClass.h
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/25.
//  Copyright © 2017年 张涛. All rights reserved.
//


/**
 * 针对工程中常用的一些方法可以放在此处
 *
 */

#import <Foundation/Foundation.h>

@interface UnityToolClass : NSObject


/**
 *  更多快速创建lable 可看（UILabel+Common.h）
 *
 *  @param strTitle     字符串
 *  @param font         字体大小
 *  @param textColor    字体颜色
 *
 *  @return return UILabel
 */

+ (UILabel *)labelWithTitle:(NSString*)strTitle font:(CGFloat)font color:(UIColor*)textColor;

/**
 *  更多快速创建button 可看（UIButton+Common.h）
 *
 *  @param strTitle     字符串
 *  @param font         字体大小
 *  @param textColor    字体颜色
 *
 *  @return return UILabel
 */

+ (UIButton *)buttonWithTitle:(NSString*)strTitle font:(CGFloat)font color:(UIColor*)textColor;

/**
 *  更多快速创建imageView 可看（UIImageView+Common.h）
 *
 *  @param image          image
 *  @param contentMode    contentMode
 *  @return return        UIImageView
 */

+ (UIImageView *)imageViewWithImage:(UIImage*) image contentMode:(UIViewContentMode)contentMode;

/**
 *  更多快速创建field 可看（UITextField+Common.h）
 *
 *  @param strTitle     字符串
 *  @param font         字体大小
 *  @param textColor    字体颜色
 *
 *  @return return UILabel
 */

+ (UITextField *)fieldWithTitle:(NSString*)strTitle font:(CGFloat)font color:(UIColor*)textColor;


/**
 *  根据宽度获取字符串的size
 *
 *  @param string  字符串
 *  @param width   字符串的宽度
 *  @param size    字体大小
 *
 *  @return return value  字符串的大小
 */
+ (CGSize)getSizeWithString:(NSString *)string width:(CGFloat)width fontSize:(CGFloat)size;

/**
 *  根据宽度获取字符串的高度
 *
 *  @param string  字符串
 *  @param width   字符串的宽度
 *  @param size    字体大小
 *
 *  @return return value  字符串的大小
 */
+ (CGFloat)getHeightWithString:(NSString *)string width:(CGFloat)width fontSize:(CGFloat)size;

/**
 *  获取字符串的宽度
 *
 *  @param string  字符串
 *  @param width   大小
 *  @param size    字体大小
 *
 *  @return return value  字符串的大小
 */
+ (CGFloat)getWidthWithString:(NSString *)string width:(CGFloat)width fontSize:(CGFloat)size;

/**
 *  根据宽度获取字符串的size
 *
 *  @param string  字符串
 *  @param width   字符串的宽度
 *  @param size    字体大小
 *
 *  @return return value  字符串的大小
 */
+ (CGSize)getBoldSizeWithString:(NSString *)string width:(CGFloat)width fontSize:(CGFloat)size;

/**
 *  根据宽度获取字符串的高度
 *
 *  @param string  字符串
 *  @param width   字符串的宽度
 *  @param size    字体大小
 *
 *  @return return value  字符串的大小
 */
+ (CGFloat)getBoldHeightWithString:(NSString *)string width:(CGFloat)width fontSize:(CGFloat)size;

/**
 *  获取字符串的宽度
 *
 *  @param string  字符串
 *  @param width   大小
 *  @param size    字体大小
 *
 *  @return return value  字符串的大小
 */
+ (CGFloat)getBoldWidthWithString:(NSString *)string width:(CGFloat)width fontSize:(CGFloat)size;

@end
