//
//  UIImageView+Common.m
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/21.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "UIImageView+Common.h"

@implementation UIImageView (Common)

+ (UIImageView*)initImageView
{
    return [self initImageViewWithImage:nil];
}

+ (UIImageView*)initImageViewWithImage:(UIImage*) image
{
    return [self initImageViewWithImage:image contentMode:UIViewContentModeScaleToFill];
}

+ (UIImageView*)initImageViewWithImage:(UIImage*) image rect:(CGRect)rect
{
    return [self initImageViewWithImage:image contentMode:UIViewContentModeScaleToFill cornerRadius:0 rect:rect];
}
+ (UIImageView*)initImageViewWithImage:(UIImage*) image contentMode:(UIViewContentMode)contentMode
{
    return [self initImageViewWithImage:image contentMode:contentMode rect:CGRectZero];
}

+ (UIImageView*)initImageViewWithImage:(UIImage*) image contentMode:(UIViewContentMode)contentMode rect:(CGRect)rect
{
   return [self initImageViewWithImage:image contentMode:contentMode cornerRadius:0 rect:rect];
}
+ (UIImageView*)initImageViewWithImage:(UIImage*) image contentMode:(UIViewContentMode)contentMode cornerRadius:(CGFloat)cornerRadius rect:(CGRect)rect
{
    UIImageView*  imageView = [[UIImageView alloc] initWithFrame:rect];
    imageView.image = image;
    imageView.contentMode=contentMode;
    imageView.frame=rect;
    imageView.layer.cornerRadius=cornerRadius;
    imageView.layer.masksToBounds=YES;
    return imageView;
}
@end
