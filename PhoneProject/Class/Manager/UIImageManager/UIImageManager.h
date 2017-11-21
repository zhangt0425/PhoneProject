//
//  UIImageManager.h
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/24.
//  Copyright © 2017年 张涛. All rights reserved.
//

/**
 *   获取app图片建议都写在这里--统一管理 方便换肤
 */
#import <Foundation/Foundation.h>

@interface UIImageManager : NSObject

//APPIcon
+ (UIImage *)APPIcon;

//默认头像
+ (UIImage *)APPDefaultHeaderImage;

@end
