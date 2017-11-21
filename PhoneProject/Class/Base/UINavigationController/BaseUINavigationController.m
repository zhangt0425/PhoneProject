//
//  BaseUINavigationController.m
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/18.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "BaseUINavigationController.h"
#import "BaseProjectViewController.h"
@interface BaseUINavigationController ()

@end

@implementation BaseUINavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count > 0 )
    {
        if ([viewController isKindOfClass:[BaseProjectViewController class]])
        {
            [(BaseProjectViewController *)viewController configLeftItem];
        }
        else
        {
            UIImage *image = [[UIImage imageNamed:@"back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:image
                                                                     style:UIBarButtonItemStyleDone
                                                                    target:self
                                                                    action:@selector(back)];
            viewController.navigationItem.leftBarButtonItem = item;
 
        }
        [viewController setHidesBottomBarWhenPushed:YES];
    }
    // 统一设置优先级低于 控制器类中的自定义设置 super放后面
    [super pushViewController:viewController animated:animated];
}

- (void)back
{
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
    [self popViewControllerAnimated:YES];
}




@end
