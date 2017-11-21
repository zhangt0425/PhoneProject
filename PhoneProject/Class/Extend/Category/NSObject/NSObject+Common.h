//
//  NSObject+Common.h
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/21.
//  Copyright © 2017年 张涛. All rights reserved.
//


/**
 * 常用的一些处理可以放这里
 */

#import <Foundation/Foundation.h>

@interface NSObject (Common)

//获取当前屏幕显示的viewcontroller
-(UIViewController *)currentViewController;


/**
 *  初始化系统弹出框
 *
 *  @param alertMessage  description
 */
+(void)showAlertView:(NSString*)alertMessage;
/**
 *  初始化Hud提示框
 *
 *  @param tipStr  description
 */
+ (void)showHudTipStr:(NSString *)tipStr;
/**
 *  初始化Hud提示框
 *
 *  @param tipStr  description
 */
+ (void)showHudTipStr:(NSString *)tipStr afterDelay:(NSTimeInterval)delay;

/*
 拨打电话
 @param tel tel description
 
 */
+ (BOOL)callTel:(NSString *)tel;

//id 取值
extern NSString* StringValue(id obj);
extern NSString* StringIntValue(id obj);
extern NSString* StringFloatValue(id obj);
extern NSAttributedString* AttributedStringValue(id obj);
extern NSNumber* NumberValue(id obj);
extern NSArray* ArrayValue(id obj);
extern NSDictionary* DictionaryValue(id obj);

@end
