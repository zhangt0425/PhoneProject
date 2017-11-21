//
//  UIView+Snpashot.h
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/21.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Snpashot)

- (UIImage *)captureImage;

- (UIImage *)captureImageAtRect:(CGRect)rect;

@end
