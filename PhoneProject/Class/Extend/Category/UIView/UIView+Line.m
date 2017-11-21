//
//  UIView+Line.m
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/21.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "UIView+Line.h"

@implementation UIView (Line)

- (void)addLine:(CGRect)rect
{
    [self addLine:[UIColor grayColor] inRect:rect];
}

- (void)addLine:(UIColor *)color inRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIGraphicsPushContext(context);
    //Set the stroke (pen) color
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    CGContextSetLineWidth(context, 1.0/[UIScreen mainScreen].scale);
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, CGRectGetMinX(rect), CGRectGetMaxY(rect));
   	CGContextAddLineToPoint(context, CGRectGetMaxX(rect), CGRectGetMaxY(rect));
    CGContextStrokePath(context);
    UIGraphicsPopContext();
}
//动态添加线---相对布局
- (void)addLineWithLineStyle:(LineStyle)style
{
    [self addLineWithLineStyle:style lineColor:[UIColor grayColor]];
}

- (void)addLineWithLineStyle:(LineStyle)style lineColor:(UIColor *)color
{
    [self addLineWithLineStyle:style lineColor:color size:0.5];
}

//size 线条大小
- (void)addLineWithLineStyle:(LineStyle)style lineColor:(UIColor *)color size:(CGFloat)size
{
    [self addLineWithLineStyle:style lineColor:color size:size onePadding:0];
}

//style== LineStyleTop||LineStyleBottom  onePadding左 twoPadding右 style== LineStyleLeft||LineStyleRight  onePadding上 twoPadding下
- (void)addLineWithLineStyle:(LineStyle)style lineColor:(UIColor *)color  size:(CGFloat)size onePadding:(CGFloat)onePadding
{
    [self addLineWithLineStyle:style lineColor:color size:size onePadding:onePadding twoPadding:0];
}

//style== LineStyleTop||LineStyleBottom  onePadding左 twoPadding右 style== LineStyleLeft||LineStyleRight  onePadding上 twoPadding下
- (void)addLineWithLineStyle:(LineStyle)style lineColor:(UIColor *)color size:(CGFloat)size onePadding:(CGFloat)onePadding twoPadding:(CGFloat)twoPadding
{
    UIView *line = [[UIView alloc] init];
    [self addSubview:line];
    line.backgroundColor = color;
    switch (style)
    {
        case LineStyleTop:
        {
            [line mas_makeConstraints:^(MASConstraintMaker *make)
            {
                make.top.mas_equalTo(self.mas_top);
                make.height.mas_equalTo(size);
                make.left.mas_equalTo(self.mas_left).mas_offset(onePadding);
                make.right.mas_equalTo(self.mas_right).mas_offset(-twoPadding);
            }];
        }
            break;
            case LineStyleBottom:
        {
            [line mas_makeConstraints:^(MASConstraintMaker *make)
             {
                 make.bottom.mas_equalTo(self.mas_bottom);
                 make.height.mas_equalTo(size);
                 make.left.mas_equalTo(self.mas_left).mas_offset(onePadding);
                 make.right.mas_equalTo(self.mas_right).mas_offset(-twoPadding);
             }];
        }
            break;
            case LineStyleLeft:
        {
            [line mas_makeConstraints:^(MASConstraintMaker *make)
             {
                 make.left.mas_equalTo(self.mas_left);
                 make.width.mas_equalTo(size);
                 make.top.mas_equalTo(self.mas_top).mas_offset(onePadding);
                 make.bottom.mas_equalTo(self.mas_bottom).mas_offset(-twoPadding);
             }];

        }
            break;
            case LineStyleRight:
        {
            [line mas_makeConstraints:^(MASConstraintMaker *make)
             {
                 make.right.mas_equalTo(self.mas_right);
                 make.width.mas_equalTo(size);
                 make.top.mas_equalTo(self.mas_top).mas_offset(onePadding);
                 make.bottom.mas_equalTo(self.mas_bottom).mas_offset(-twoPadding);
             }];

        }
            break;
        default:
            break;
    }
   
}
@end
