//
//  BaseProjectViewController.m
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/18.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "BaseProjectViewController.h"

@interface BaseProjectViewController ()

@end

@implementation BaseProjectViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    BOOL hide = [self navigationBarHidden];
    [self.navigationController setNavigationBarHidden:hide animated:YES];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    BOOL hide = [self navigationBarHidden];
    self.fd_prefersNavigationBarHidden = hide;
    self.navigationController.navigationBarHidden = hide;
    //顶部屏幕适配
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)])
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    [self.view addSubview:self.contentView];
    [self addPopGesture];
    [self configView];

}
- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    [self configLayoutSubviews];

}
#pragma mark - 是否隐藏导航栏
- (BOOL)navigationBarHidden
{
    return NO;
}
#pragma mark - base方法
/**
 *  加载视图，所有的view都在configView加载
 */
- (void)configView
{
    
}

/**
 *  加载视图布局
 */
- (void)configLayoutSubviews
{
    self.contentView.frame = self.view.bounds;
    [self.contentView setNeedsLayout];
}

/**
 *  添加子视图，以后所有添加子视图的操作,
 *  都使用[self addSubview:...];
 *  而不再用[self.view addSubview:...]
 *
 *  @param view 子视图
 */
- (void)addSubview:(UIView *)view
{
    [self.contentView addSubview:view];
}

/**
 *  显示系统自带的导航栏
 *
 *  @param title 标题
 */
- (void)configTitle:(NSString *)title
{
    self.navigationItem.title=title;
}

/**
 *  显示系统自带的导航栏
 *
 *  @param view 自定义的view
 */
- (void)configTitleView:(UIView *)view
{
    self.navigationItem.titleView=view;

}

// 单独设置导航栏的返回按钮
- (void)configLeftItem
{
    
}

// 添加左侧文字按钮
- (void)configLeftItemWithTitle:(NSString *)title
{
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:title
                                                             style:UIBarButtonItemStyleDone
                                                            target:self
                                                            action:@selector(leftItemAction)];
    self.navigationItem.leftBarButtonItem = item;
}

// 添加左侧图片按钮
- (void)configLeftItemWithImage:(UIImage *)image
{
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:image
                                                             style:UIBarButtonItemStyleDone
                                                            target:self
                                                            action:@selector(leftItemAction)];
    self.navigationItem.leftBarButtonItem = item;

}

// 返回按钮默认方法，根据需求，可自行重写
- (void)configLeftItemWithCustomView:(UIView *)customView
{
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:customView];
    self.navigationItem.leftBarButtonItem = item;
}

// 添加右侧文字按钮
- (void)configRightItemWithTitle:(NSString *)title
{
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:title
                                                             style:UIBarButtonItemStyleDone
                                                            target:self
                                                            action:@selector(rightItemAction)];
    self.navigationItem.rightBarButtonItem = item;
}

// 添加右侧图片按钮
- (void)configRightItemWithImage:(UIImage *)image
{
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:image
                                                             style:UIBarButtonItemStyleDone
                                                            target:self
                                                            action:@selector(rightItemAction)];
    self.navigationItem.rightBarButtonItem = item;
}

// 右侧按钮默认方法，根据需求，可自行重写
- (void)configRightItemWithCustomView:(UIView *)customView
{
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:customView];
    self.navigationItem.rightBarButtonItem = item;
}
//左侧Item事件
- (void)leftItemAction
{
    
}
//右侧Item事件
- (void)rightItemAction
{
    
}

#pragma mark - 界面push之后，添加界面的手势侧滑Pop效果
/**
 *  界面push之后，添加界面的手势侧滑Pop效果
 *  在需要的界面里调用此方法
 */
- (void)addPopGesture
{
    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
}

// 移除pop手势
- (void)removePopGesture
{
    self.navigationController.interactivePopGestureRecognizer.delegate = nil;
}


#pragma mark - 支持重力感应，屏幕旋转
- (UIInterfaceOrientationMask)application:(UIApplication *)application
  supportedInterfaceOrientationsForWindow:(UIWindow *)window
{
    // 根据旋转状态做处理，具体默认旋转的状态根据实际情况而定
    return UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskLandscapeRight;
}

#pragma mark - setter getter方法
- (UIScrollView *)contentView
{
    if (!_contentView)
    {
        _contentView=[[UIScrollView alloc]init];
        _contentView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    return _contentView;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
