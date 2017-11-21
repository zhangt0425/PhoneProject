//
//  UIButton+TextWithImageLayout.h
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/21.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, ButtonImageWithTextStyle) {
    ButtonImageWithTextStyleTop=0,      // image在上，text在下
    ButtonImageWithTextStyleLeft=1,     // image在左，text在右
    ButtonImageWithTextStyleBottom=2,   // image在下，text在上
    ButtonImageWithTextStyleRight=3     // image在右，text在左
};

@interface UIButton (TextWithImageLayout)

/**
 *  调用此方法之前一定要先设置好标题和图片
 *  设置button的titleLabel和imageView的布局样式，及间距
 *
 *  @param style titleLabel和imageView的布局样式
 *  @param space titleLabel和imageView的间距
 */
- (void)layoutButtonWithStyle:(ButtonImageWithTextStyle)style
                        space:(CGFloat)space;

@end
