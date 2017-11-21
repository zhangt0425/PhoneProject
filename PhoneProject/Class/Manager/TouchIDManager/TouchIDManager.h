//
//  TouchIDManager.h
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/24.
//  Copyright © 2017年 张涛. All rights reserved.
//


/**
 usage:
 
 TouchIDManager *touch = [[TouchIDManager alloc] checkTouchIDWithMessage:@"请验证指纹" backTitle:@"密码验证"];
 
 [touch startCheckWithResultBlock:^(NSInteger codeNumber) {
 // Here to judge codeNumber
 }];
 
 PS : 使用前倒入 LocalAuthentication.framework
 */

#import <Foundation/Foundation.h>

typedef void(^ResultBlock)(NSInteger codeNumber);

/**
 codeNumber几种情况
 = 0  设备不支持TouchID
 = 1  验证成功
 = 2  验证失败
 = 3  用户取消验证
 = 4  用户点击了右侧按钮
 = 5  系统取消  例如突然来电话、按了Home键、锁屏...
 = 6  设备没有录入指纹
 = 7  设备没有设置密码 无法启动TouchID
 = 8  设备的TouchID无效
 = 9  多次验证失败 TouchID被锁
 = 10 当前软件被挂起取消了授权 (如突然来了电话,应用进入前台)
 = 11 当前软件被挂起取消了授权 (授权过程中,LAContext对象被释)
 */

/**
 *  app指纹识别
 */

@interface TouchIDManager : NSObject

@property (copy,nonatomic) ResultBlock resultBlock; // 返回block

/**
 *  TouchID初始化
 *
 *  @param message   内容文字
 *  @param backTitle 右侧按钮文字
 *
 */
- (id)checkTouchIDWithMessage:(NSString *)message backTitle:(NSString *)backTitle;

/**
 *  开始验证
 *
 *  @param resultBlock 返回结果block
 */
- (void)startCheckWithResultBlock:(ResultBlock)resultBlock;

@end
