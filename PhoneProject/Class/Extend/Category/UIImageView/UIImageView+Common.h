//
//  UIImageView+Common.h
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/21.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (Common)

//快速创建UIImageView
+ (UIImageView*)initImageView;

+ (UIImageView*)initImageViewWithImage:(UIImage*) image;

+ (UIImageView*)initImageViewWithImage:(UIImage*) image rect:(CGRect)rect;

+ (UIImageView*)initImageViewWithImage:(UIImage*) image contentMode:(UIViewContentMode)contentMode;

+ (UIImageView*)initImageViewWithImage:(UIImage*) image contentMode:(UIViewContentMode)contentMode rect:(CGRect)rect;

+ (UIImageView*)initImageViewWithImage:(UIImage*) image contentMode:(UIViewContentMode)contentMode cornerRadius:(CGFloat)cornerRadius rect:(CGRect)rect;


@end
