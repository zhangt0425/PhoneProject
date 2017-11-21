//
//  UIView+Snpashot.m
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/21.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "UIView+Snpashot.h"

@implementation UIView (Snpashot)


- (UIImage *)captureImage
{
    return [self captureImageAtRect:self.bounds];
}

- (UIImage *)captureImageAtRect:(CGRect)rect
{
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, [[UIScreen mainScreen] scale]);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, rect.origin.x, rect.origin.y);
    [[self layer] renderInContext:context];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}


@end
