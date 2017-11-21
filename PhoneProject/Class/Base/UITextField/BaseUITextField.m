//
//  BaseUITextField.m
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/21.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "BaseUITextField.h"

@implementation BaseUITextField

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.insets = UIEdgeInsetsMake(0, 0, 0, 0);
    }
    return self;
}

//重写系统方法
- (CGRect)textRectForBounds:(CGRect)bounds
{
    return UIEdgeInsetsInsetRect(bounds, _insets);
}

- (CGRect)editingRectForBounds:(CGRect)bounds
{
    return UIEdgeInsetsInsetRect(bounds, _insets);
}

- (void)setPlaceHolderColor:(UIColor *)placeHolderColor
{
    [self setValue:placeHolderColor forKeyPath:@"_placeholderLabel.textColor"];
}

@end
