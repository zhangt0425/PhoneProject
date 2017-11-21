//
//  TouchIDManager.m
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/24.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "TouchIDManager.h"
#import <LocalAuthentication/LocalAuthentication.h>

@interface TouchIDManager ()

@property (strong,nonatomic) NSString *message;

@property (strong,nonatomic) NSString *backTitle;


@end
@implementation TouchIDManager

- (id)checkTouchIDWithMessage:(NSString *)message backTitle:(NSString *)backTitle
{
    if (self)
    {
        self.message = message;
        self.backTitle = backTitle;
    }
    return self;
}

- (void)startCheckWithResultBlock:(ResultBlock)resultBlock
{
    self.resultBlock = resultBlock;
    
    LAContext *context = [[LAContext alloc]init];
    
    context.localizedFallbackTitle = self.backTitle;
    
    NSError *error = nil;
    
    if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error])
    {
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:self.message reply:^(BOOL success, NSError * _Nullable error)
         {
             if (success) {
                 DEF_DEBUG(@"指纹验证成功");
                 if (self.resultBlock) {
                     self.resultBlock (1);
                 }
             } else if (error) {
                 DEF_DEBUG(@"指纹验证失败 error==%@ error.code==%ld",error,error.code);
                 switch (error.code) {
                     case LAErrorAuthenticationFailed: {
                         if (self.resultBlock) {
                             self.resultBlock (2);
                         }
                     }
                         break;
                     case LAErrorUserCancel: {
                         if (self.resultBlock) {
                             self.resultBlock (3);
                         }
                     }
                         break;
                     case LAErrorUserFallback: {
                         if (self.resultBlock) {
                             self.resultBlock (4);
                         }
                     }
                         break;
                     case LAErrorSystemCancel:{
                         if (self.resultBlock) {
                             self.resultBlock (5);
                         }
                     }
                         break;
                     case LAErrorTouchIDNotEnrolled: {
                         if (self.resultBlock) {
                             self.resultBlock (6);
                         }
                     }
                         break;
                     case LAErrorPasscodeNotSet: {
                         if (self.resultBlock) {
                             self.resultBlock (7);
                         }
                     }
                         break;
                     case LAErrorTouchIDNotAvailable: {
                         if (self.resultBlock) {
                             self.resultBlock (8);
                         }
                     }
                         break;
                     case LAErrorTouchIDLockout: {
                         if (self.resultBlock) {
                             self.resultBlock (9);
                         }
                     }
                         break;
                     case LAErrorAppCancel:  {
                         if (self.resultBlock) {
                             self.resultBlock (10);
                         }
                     }
                         break;
                     case LAErrorInvalidContext: {
                         if (self.resultBlock) {
                             self.resultBlock (11);
                         }
                     }
                         break;
                 }
             }
         }];
    } else {
        DEF_DEBUG(@"不支持指纹功能");
        if (self.resultBlock) {
            self.resultBlock (0);
        }
    }
}

@end
