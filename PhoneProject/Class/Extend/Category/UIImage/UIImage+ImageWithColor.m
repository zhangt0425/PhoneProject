//
//  UIImage+ImageWithColor.m
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/21.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "UIImage+ImageWithColor.h"

@implementation UIImage (ImageWithColor)

/**
 *  拥有一个具有颜色的image实例
 *
 *  @param color 需要的颜色
 *
 *  @return UIImage
 */
+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

/**
 *  拥有一个具有渐变颜色的image实例
 *
 *  @param tintColor 需要渐变的颜色
 *
 *  @return 渐变的规则是由上至下变深，最深就是tintColor
 */
- (UIImage*)tintedGradientImageWithColor:(UIColor*)tintColor
{
    return [self tintedImageWithColor:tintColor blendingMode:kCGBlendModeOverlay];

}

/**
 *  改变image实例的颜色
 *
 *  @param tintColor 想要的颜色
 *
 *  @return 改变过颜色的image实例
 */
- (UIImage*)tintedImageWithColor:(UIColor*)tintColor
{
    return [self tintedImageWithColor:tintColor blendingMode:kCGBlendModeDestinationIn];

}
#pragma mark - Private methods

- (UIImage*)tintedImageWithColor:(UIColor*)tintColor blendingMode:(CGBlendMode)blendMode{
    
    // 传递一个0.0用来确保绘制的图像是原来的尺寸，这点很重要。
    UIGraphicsBeginImageContextWithOptions(self.size,NO,0.0f);
    
    [tintColor setFill];
    
    CGRect bounds = CGRectMake(0,0,self.size.width,self.size.height);
    
    UIRectFill(bounds);
    if (blendMode != kCGBlendModeDestinationIn) {
        
        [self drawInRect:bounds blendMode:kCGBlendModeDestinationIn alpha:1.0];
    }
    
    UIImage * tintedImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return tintedImage;
}
/**
 *  重新绘制图片
 *
 *  @param color 填充色
 *
 *  @return UIImage
 */
- (UIImage *)drawImageWithColor:(UIColor *)color
{
    UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0, self.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextClipToMask(context, rect, self.CGImage);
    [color setFill];
    CGContextFillRect(context, rect);
    UIImage*newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
@end
