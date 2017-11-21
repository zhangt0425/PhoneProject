//
//  UILabel+Common.m
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/21.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "UILabel+Common.h"
#import "UIView+Common.h"
#import <objc/runtime.h>

static const char* UILabelHeightEnhancementKey = "uilabel_height_associated_key";

@implementation UILabel (Common)

//快速创建lable

+ (UILabel*)initLabel
{
    return [self initLabelWithTitle:nil font:16.0 color:[UIColor blackColor]];
}

+ (UILabel *)initLabelWithTitle:(NSString*)title font:(CGFloat)font color:(UIColor*)textColor
{
    return [self initLabelWithTitle:title font:font color:textColor textAlignment:NSTextAlignmentLeft];
}
+ (UILabel *)initLabelWithTitle:(NSString*)title font:(CGFloat)font color:(UIColor*)textColor textAlignment:(NSTextAlignment)textAlignment
{
    return [self initLabelWithTitle:title font:font color:textColor textAlignment:textAlignment rect:CGRectZero];
}
+ (UILabel *)initLabelWithTitle:(NSString*)title font:(CGFloat)font color:(UIColor*)textColor textAlignment:(NSTextAlignment)textAlignment rect:(CGRect) rect
{
    UILabel* label = [[UILabel alloc] initWithFrame:rect];
    if ([title isEqual:[NSNull null]])
    {
        title = @"";
    }
    label.text = title;
    label.textColor = textColor;
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:font];
    label.textAlignment=textAlignment;
    return label;
}
- (CGFloat)originalHeight
{
    id obj = objc_getAssociatedObject(self, UILabelHeightEnhancementKey);
    
    if (obj && [obj respondsToSelector:@selector(floatValue)]) {
        return [obj floatValue];
    }
    
    // 还从来没设置过，这是第一次调用，以当前高度作为初始高度设置上去
    objc_setAssociatedObject(self, UILabelHeightEnhancementKey, [NSNumber numberWithFloat:self.frame.size.height], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    return self.frame.size.height;
}

- (void)alignTop
{
    CGFloat width       = self.frame.size.width;
    self.numberOfLines  = 0;
    
    [self sizeToFit];
    [self frameSet:@"w" value:width];
}

- (void)alignBottom
{
    // 为了使得UILabel里的文字始终在下边缘显示，需要重新设置UILabel的y位置，在此之前需要以UILabel的初始高度算出其距离底部的恒定距离是多少
    CGFloat width       = self.frame.size.width;
    CGFloat height      = self.originalHeight;
    CGFloat bottom      = self.superview.frame.size.height - self.frame.origin.y - self.frame.size.height;
    self.numberOfLines  = 0;
    
    [self sizeToFit];
    
    // 判断当前UILabel里的这些文字是否已经超出原定高度了，若超出则需要重新限定高度
    if (self.frame.size.height > height || self.frame.size.height == 0) {
        [self frameSet:@"h" value:height];
    }
    
    [self frameSet:@"w" value1:width
              key2:@"y" value2:self.superview.frame.size.height - bottom - self.frame.size.height
     ];
}

@end
