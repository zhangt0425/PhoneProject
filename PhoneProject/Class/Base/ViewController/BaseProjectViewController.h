//
//  BaseProjectViewController.h
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/18.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseProjectViewController : UIViewController

/**
 *  内容视图，所有的view都加载contentView上，而不再是self.view上
 */
@property (nonatomic, strong) UIScrollView *contentView;

//是否隐藏导航栏
- (BOOL)navigationBarHidden;

/**
 *  加载视图，所有的view都在configView加载
 */
- (void)configView;

/**
 *  加载视图布局
 */
- (void)configLayoutSubviews;

/**
 *  添加子视图，以后所有添加子视图的操作,
 *  都使用[self addSubview:...];
 *  而不再用[self.view addSubview:...]
 *
 *  @param view 子视图
 */
- (void)addSubview:(UIView *)view;

/**
 *  显示系统自带的导航栏
 *
 *  @param title 标题
 */
- (void)configTitle:(NSString *)title;

/**
 *  显示系统自带的导航栏
 *
 *  @param view 自定义的view
 */
- (void)configTitleView:(UIView *)view;

// 单独设置导航栏的返回按钮
- (void)configLeftItem;

// 添加左侧文字按钮
- (void)configLeftItemWithTitle:(NSString *)title;

// 添加左侧图片按钮
- (void)configLeftItemWithImage:(UIImage *)image;

// 返回按钮默认方法，根据需求，可自行重写
- (void)configLeftItemWithCustomView:(UIView *)customView;

// 添加右侧文字按钮
- (void)configRightItemWithTitle:(NSString *)title;

// 添加右侧图片按钮
- (void)configRightItemWithImage:(UIImage *)image;

// 右侧按钮默认方法，根据需求，可自行重写
- (void)configRightItemWithCustomView:(UIView *)customView;

//左侧Item事件
- (void)leftItemAction;

//右侧Item事件
- (void)rightItemAction;

@end
