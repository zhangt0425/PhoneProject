//
//  NSObject+Common.m
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/21.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "NSObject+Common.h"

@implementation NSObject (Common)

#pragma mark 获取当前currentViewController
-(UIViewController *)currentViewController
{
    return [self topViewControllerWithRootViewController:[UIApplication sharedApplication].keyWindow.rootViewController];
}
-(UIViewController*)topViewControllerWithRootViewController:(UIViewController*)rootViewController
{
    if ([rootViewController isKindOfClass:[UITabBarController class]])
    {
        UITabBarController* tabBarController = (UITabBarController*)rootViewController;
        return [self topViewControllerWithRootViewController:tabBarController.selectedViewController];
    }
    else if ([rootViewController isKindOfClass:[UINavigationController class]])
    {
        UINavigationController* navigationController = (UINavigationController*)rootViewController;
        return [self topViewControllerWithRootViewController:navigationController.visibleViewController];
    }
    else if (rootViewController.presentedViewController)
    {
        UIViewController* presentedViewController = rootViewController.presentedViewController;
        return [self topViewControllerWithRootViewController:presentedViewController];
    }
    else
    {
        return rootViewController;
    }
}

#pragma mark 弹出提示框
+ (void)showAlertView:(NSString*)alertMessage
{
    if ([alertMessage isKindOfClass:[NSString class]])
    {
        if (alertMessage.length!=0) {
            UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"提示" message:alertMessage preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *action=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            [alert addAction:action];
            [self.currentViewController presentViewController:alert animated:YES completion:^{
               
            }];
        }
    }

}
#pragma mark 提示框
+ (void)showHudTipStr:(NSString *)tipStr
{
    [self showHudTipStr:tipStr afterDelay:1.5];
}

+ (void)showHudTipStr:(NSString *)tipStr afterDelay:(NSTimeInterval)delay
{
    if (tipStr && tipStr.length > 0) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.currentViewController.view animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.detailsLabelFont = [UIFont boldSystemFontOfSize:15.0];
        hud.detailsLabelText = tipStr;
        hud.margin = 10.f;
        hud.removeFromSuperViewOnHide = YES;
        [hud hide:YES afterDelay:delay];
    }
}
#pragma mark -拨打电话
+ (BOOL)callTel:(NSString *)tel
{
    NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"tel://%@",tel];
    return [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
}
#pragma mark -id 取值
NSString *StringValue(id obj)
{
    if([obj isKindOfClass:[NSString class]]){
        return (NSString *)obj;
    }else if ([obj isKindOfClass:[NSNull class]]|| obj == nil) {
        return  @"";
    }else if ([obj isKindOfClass:[NSNumber class]]) {
        NSString *doubleString        = [NSString stringWithFormat:@"%f", [obj doubleValue]];
        NSDecimalNumber *decNumber    = [NSDecimalNumber decimalNumberWithString:doubleString];
        return  [NSString stringWithFormat:@"%@", decNumber];
    } else{
        return @"";
    }
}
NSString* StringIntValue(id obj)
{
    if ([obj isKindOfClass:[NSString class]]) {
        return [NSString stringWithFormat:@"%ld",[obj integerValue]];
    }
    return @"0";
}
NSString* StringFloatValue(id obj)
{
    if ([obj isKindOfClass:[NSString class]]) {
        return [NSString stringWithFormat:@"%.2f",[obj floatValue]];
    }
    return @"0.00";
}
NSAttributedString *AttributedStringValue(id obj)
{
    if([obj isKindOfClass:[NSAttributedString class]]){
        return (NSAttributedString *)obj;
    }else if ([obj isKindOfClass:[NSNull class]]|| obj == nil) {
        return [[NSAttributedString alloc] initWithString:@""];
    }else if ([obj isKindOfClass:[NSNumber class]]) {
        NSString *strObj = [NSString stringWithFormat:@"%@",[obj description]];
        return [[NSAttributedString alloc] initWithString:strObj];
    } else{
        return [[NSAttributedString alloc] initWithString:@""];
    }
}

NSNumber *NumberValue(id obj)
{
    if([obj isKindOfClass:[NSNumber class]]){
        NSNumber *num = nil;
        
        if (strcmp([obj objCType], @encode(char)) == 0) {
            num = [NSNumber numberWithChar:[obj charValue]];
        }
        else if (strcmp([obj objCType], @encode(unsigned char)) == 0) {
            num = [NSNumber numberWithUnsignedChar:[obj unsignedCharValue]];
        }
        else if (strcmp([obj objCType], @encode(short)) == 0) {
            num = [NSNumber numberWithShort:[obj shortValue]];
        }
        else if (strcmp([obj objCType], @encode(unsigned short)) == 0) {
            num = [NSNumber numberWithUnsignedShort:[obj unsignedShortValue]];
        }
        else if (strcmp([obj objCType], @encode(int)) == 0) {
            num = [NSNumber numberWithInt:[obj intValue]];
        }
        else if (strcmp([obj objCType], @encode(unsigned int)) == 0) {
            num = [NSNumber numberWithUnsignedInt:[obj unsignedIntValue]];
        }
        else if (strcmp([obj objCType], @encode(long)) == 0) {
            num = [NSNumber numberWithLong:[obj longValue]];
        }
        else if (strcmp([obj objCType], @encode(unsigned long)) == 0) {
            num = [NSNumber numberWithUnsignedLong:[obj unsignedLongValue]];
        }
        else if (strcmp([obj objCType], @encode(long long)) == 0) {
            num = [NSNumber numberWithLongLong:[obj longLongValue]];
        }
        else if (strcmp([obj objCType], @encode(unsigned long long)) == 0) {
            num = [NSNumber numberWithUnsignedLongLong:[obj unsignedLongLongValue]];
        }
        else if (strcmp([obj objCType], @encode(float)) == 0) {
            num = [NSNumber numberWithFloat:[obj floatValue]];
        }
        else if (strcmp([obj objCType], @encode(double)) == 0) {
            num = [NSNumber numberWithDouble:[obj doubleValue]];
        }
        else if (strcmp([obj objCType], @encode(BOOL)) == 0) {
            num = [NSNumber numberWithBool:[obj boolValue]];
        }
        else {
            //To-Do  unkown num type ,num is nil
        }
        NSString *doubleString        = [NSString stringWithFormat:@"%f", [num doubleValue]];
        NSDecimalNumber *decNumber    = [NSDecimalNumber decimalNumberWithString:doubleString];
        return decNumber;
    }else if ([obj isKindOfClass:[NSNull class]]|| obj == nil) {
        return @0;
    }else if ([obj isKindOfClass:[NSString class]]) {
        //        float fv  = [(NSString *)obj floatValue];
        //        if (fv <0) {
        //            return [NSNumber numberWithFloat:fv];
        //        }
        return [NSDecimalNumber decimalNumberWithString:(NSString *)obj];
        //        return @([(NSString *)obj doubleValue]);
    }else{
        return @(0);
    }
}

NSArray* ArrayValue(id obj)
{
    if ([obj isKindOfClass:[NSNull class]]|| obj == nil) {
        return @[];
    }
    else if([obj isKindOfClass:[NSArray class]])
    {
        return (NSArray *)obj;
    }else{
        return @[];
    }
}

NSDictionary* DictionaryValue(id obj)
{
    if ([obj isKindOfClass:[NSNull class]] || obj == nil) {
        return @{};
    }else if ([obj isKindOfClass:[NSDictionary class]]) {
        return (NSDictionary *)obj;
    }else{
        return @{};
    }
}


@end
