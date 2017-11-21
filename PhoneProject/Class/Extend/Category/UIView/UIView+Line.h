//
//  UIView+Line.h
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/21.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    LineStyleTop,
    LineStyleLeft,
    LineStyleBottom,
    LineStyleRight
} LineStyle;

@interface UIView (Line)

// 添加线--相对frame布局
- (void)addLine:(CGRect)rect;
- (void)addLine:(UIColor *)color inRect:(CGRect)rect;

//动态添加线---相对布局
- (void)addLineWithLineStyle:(LineStyle)style;

- (void)addLineWithLineStyle:(LineStyle)style lineColor:(UIColor *)color;

//size 线条大小
- (void)addLineWithLineStyle:(LineStyle)style lineColor:(UIColor *)color size:(CGFloat)size;

//style== LineStyleTop||LineStyleBottom  onePadding左 twoPadding右 style== LineStyleLeft||LineStyleRight  onePadding上 twoPadding下
- (void)addLineWithLineStyle:(LineStyle)style lineColor:(UIColor *)color  size:(CGFloat)size onePadding:(CGFloat)onePadding;

//style== LineStyleTop||LineStyleBottom  onePadding左 twoPadding右 style== LineStyleLeft||LineStyleRight  onePadding上 twoPadding下
- (void)addLineWithLineStyle:(LineStyle)style lineColor:(UIColor *)color size:(CGFloat)size onePadding:(CGFloat)onePadding twoPadding:(CGFloat)twoPadding;


@end
