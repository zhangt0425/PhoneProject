//
//  UIImageManager.m
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/24.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "UIImageManager.h"

@implementation UIImageManager

//APPIcon
+ (UIImage *)APPIcon
{
    //可根据不同主题返回对应的图片
    return [UIImage imageNamed:@"item-icon-6"];
}
//默认头像
+ (UIImage *)APPDefaultHeaderImage
{
    return [UIImage imageNamed:@"item-icon-6"];
}

@end
