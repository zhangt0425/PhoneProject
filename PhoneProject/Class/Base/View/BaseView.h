//
//  BaseProjectView.h
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/18.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseView : UIView

//获取view的Height
+ (CGFloat)configViewHeightWithDataSource:(id)dataSource;
+ (CGFloat)configViewHeight;

//加载视图
- (void)configView;
//加载视图布局
- (void)configLayoutSubviews;
//加载数据
- (void)configViewWithDataSource:(id)dataSource;

@end
