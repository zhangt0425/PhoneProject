//
//  CommonAlertSheetController.m
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/21.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "CommonAlertSheetController.h"

@implementation CommonAlertSheetController

- (id)initWithTitle:(NSString *)title message:(NSString *)message buttons:(NSArray *)buttonTitles afterDismiss:(CommonAlertSheetViewBlock)block
{
    self = [self init];
    if (self)
    {
        self.title = title;
        self.message = message;
        self.buttons = buttonTitles;
        self.clickBlock = block;
    }
    return self;
}

-(id)initWithTitle:(NSString *)title message:(NSString *)message buttons:(NSArray *)buttonTitles cancelButton:(NSString *)cancelButton afterDismiss:(CommonAlertSheetViewBlock)block cancel:(CommonCancelBlock)cancelBlock
{
    self = [self init];
    if (self)
    {
        self.title = title;
        self.message = message;
        self.cancelButton = cancelButton;
        self.buttons = buttonTitles;
        self.clickBlock = block;
        self.cancelBlock = cancelBlock;
    }
    return self;
}

- (void)setButtons:(NSArray *)buttons
{
    self.sheet = [UIAlertController alertControllerWithTitle:self.title message:self.message preferredStyle:UIAlertControllerStyleActionSheet];
    
    for (int i = 0; i < buttons.count; i++) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:buttons[i] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (self.clickBlock) {
                self.clickBlock(self,i);
            }
        }];
        [self.sheet addAction:action];
    }
    
    if (self.cancelButton) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:self.cancelButton style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            if (self.cancelBlock) {
                self.cancelBlock();
            }
        }];
        [self.sheet addAction:action];
    }
}

- (void)showSheet:(UIViewController *)viewController completion:(CommonShowAlertBlock)block
{
    self.showBlock = block;
    
    [viewController presentViewController:self.sheet animated:YES completion:^{
        if (self.showBlock) {
            self.showBlock();
        }
    }];
}

- (void)dismiss:(UIViewController *)viewController completion:(CommonDismissAlertBlock)block
{
    self.dismissBlock = block;
    
    [viewController dismissViewControllerAnimated:YES completion:^{
        if (self.dismissBlock) {
            self.dismissBlock();
        }
    }];
}

- (void)showSheet:(UIViewController *)viewController
{
    [self showSheet:viewController completion:nil];
}

- (void)dismiss:(UIViewController *)viewController
{
    [self dismiss:viewController completion:nil];
}

@end
