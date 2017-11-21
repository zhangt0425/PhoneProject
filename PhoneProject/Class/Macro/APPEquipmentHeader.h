//
//  APPEquipmentHeader.h
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/21.
//  Copyright © 2017年 张涛. All rights reserved.
//

#ifndef APPEquipmentHeader_h
#define APPEquipmentHeader_h

/**
 *  在此处定义宏（app设备信息）
 */

// 判断屏幕尺寸
#define DEF_IPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define DEF_IPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define DEF_IPhone678 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define DEF_IPhone678Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)
#define DEF_IPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)


// 判断ipad还是iphone
#define DEF_IPad    (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define DEF_IPhone  (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

// 获得APP工程信息
//当前应用软件版本  比如：1.0.1
#define DEF_APPCurVersion      [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
// 当前应用版本号码   int类型
#define DEF_APPCurVersionNum [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
//APP名称
#define DEF_APPName      [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]
//工程名称PhoneProject
#define DEF_APPProjectName  [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleExecutableKey]

//手机相关信息
//电池电量50%
#define DEF_PhoneBatteryLevel [[UIDevice currentDevice] batteryLevel]
//设备唯一标识符 3DCF9688-6946-4C30-8B27-377A7910DCB0
#define DEF_PhoneIdentifierForVendor [[[UIDevice currentDevice] identifierForVendor] UUIDString]
//手机别名： 用户定义的名称iPhone Simulator
#define DEF_PhoneName [[UIDevice currentDevice] name]
//设备名称iPhone OS
#define DEF_PhoneSystemName  [[UIDevice currentDevice] systemName]
//手机系统版本9.3
#define DEF_PhoneSystemVersion  [[UIDevice currentDevice] systemVersion]
//地方型号（国际化区域名称）iPhone
#define DEF_PhoneLocalizedModel  [[UIDevice currentDevice] localizedModel]

#endif /* APPEquipmentHeader_h */
