//
//  CommonAlertSheetController.h
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/21.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CommonAlertSheetController;

typedef void(^CommonAlertSheetViewBlock)(CommonAlertSheetController * alertSheet,NSInteger buttonIndex);
typedef void(^CommonShowAlertBlock)();
typedef void(^CommonDismissAlertBlock)();
typedef void(^CommonCancelBlock)();

@interface CommonAlertSheetController : NSObject<UIActionSheetDelegate>

@property (strong,nonatomic) UIAlertController *sheet;
@property (strong,nonatomic) UIActionSheet *oldSheet;

@property (strong, nonatomic) NSString *title; // 标题
@property (strong, nonatomic) NSString *message; // 内容
@property (strong, nonatomic) NSString *cancelButton; // 取消按钮
@property (strong, nonatomic) NSArray *buttons; // 选项按钮
//@property (readonly, nonatomic) NSMutableArray *buttonsStyle;

@property (copy, nonatomic) CommonAlertSheetViewBlock clickBlock; // 点击block
@property (copy, nonatomic) CommonShowAlertBlock showBlock; // 出现block
@property (copy, nonatomic) CommonDismissAlertBlock dismissBlock; // 消失block
@property (copy, nonatomic) CommonCancelBlock cancelBlock; // 取消block

/**
 *  初始化sheet 无取消按钮
 *
 *  @param title        标题
 *  @param message      内容
 *  @param buttonTitles 选项按钮
 *  @param block        回调block
 *
 *  @return <#return value description#>
 */
-(id)initWithTitle:(NSString*)title
           message:(NSString*)message
           buttons:(NSArray*)buttonTitles
      afterDismiss:(CommonAlertSheetViewBlock)block;

/**
 *  初始化sheet 有取消按钮
 *
 *  @param title        标题
 *  @param message      内容
 *  @param buttonTitles 选项按钮
 *  @param cancelButton 取消按钮
 *  @param block        回调block
 *  @param cancelBlock  取消block
 *
 *  @return <#return value description#>
 */
-(id)initWithTitle:(NSString*)title
           message:(NSString*)message
           buttons:(NSArray*)buttonTitles
      cancelButton:(NSString *)cancelButton
      afterDismiss:(CommonAlertSheetViewBlock)block
            cancel:(CommonCancelBlock)cancelBlock;

/**
 *  sheet 出现
 *
 *  @param viewController 出现控制器
 */
- (void)showSheet:(UIViewController *)viewController;

/**
 *  sheet消失
 *
 *  @param viewController 消失控制器
 */
- (void)dismiss:(UIViewController *)viewController;

/**
 *  sheet 出现
 *
 *  @param viewController 出现控制器
 *  @param showBlock      出现完成block
 */
- (void)showSheet:(UIViewController *)viewController completion:(CommonShowAlertBlock)showBlock;

/**
 *  sheet 消失
 *
 *  @param viewController 消失控制器
 *  @param dismissBlock   消失完成block
 */
- (void)dismiss:(UIViewController *)viewController completion:(CommonDismissAlertBlock)dismissBlock;

@end
