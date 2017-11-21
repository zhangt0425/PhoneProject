//
//  RootTabBarController.m
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/21.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "RootTabBarController.h"
#import "HomeViewController.h"
#import "AllViewController.h"
#import "PersonalCenterViewController.h"
@interface RootTabBarController ()<UITabBarControllerDelegate>

@end

@implementation RootTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.delegate = self;
    //设置选中颜色
    [self.tabBar setTintColor:[UIColor colorWithRed:0.52 green:0.71 blue:0.87 alpha:1]];
    //设置透明
    self.tabBar.opaque = YES;
    
    [self configTableControllers];
}
-(void)configTableControllers
{
    //添加controller数据
    NSMutableArray *info = [[NSMutableArray alloc]init];
    [info addObject:[[NSDictionary alloc] initWithObjects:@[[UIImage imageNamed:@"item-icon-1"],[UIImage imageNamed:@"item-icon-4"],@"首页",[HomeViewController new]] forKeys:@[@"icon",@"selectedicon",@"title",@"controller"]]];
    [info addObject:[[NSDictionary alloc] initWithObjects:@[[UIImage imageNamed:@"item-icon-2"],[UIImage imageNamed:@"item-icon-5"],@"全部",[AllViewController new]] forKeys:@[@"icon",@"selectedicon",@"title",@"controller"]]];
    [info addObject:[[NSDictionary alloc] initWithObjects:@[[UIImage imageNamed:@"item-icon-3"],[UIImage imageNamed:@"item-icon-6"],@"个人中心",[PersonalCenterViewController new]] forKeys:@[@"icon",@"selectedicon",@"title",@"controller"]]];
    [self configController:info];
    
}


- (void)configController:(NSMutableArray *)controllerInfo
{
    
    NSMutableArray *controllerArray = [NSMutableArray array];
    
    for (int i = 0; i < controllerInfo.count; i++)
    {
        BaseUINavigationController *navController = [[BaseUINavigationController alloc]initWithRootViewController:[[controllerInfo objectAtIndex:i] objectForKey:@"controller"]];
        //设置title
        [navController.tabBarItem setTitle:[[controllerInfo objectAtIndex:i] objectForKey:@"title"]];
        NSDictionary *normaldict = @{NSForegroundColorAttributeName:[UIColor grayColor]};
        NSDictionary *selecteddict = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor redColor],NSForegroundColorAttributeName, nil];
        [navController.tabBarItem setTitleTextAttributes:normaldict forState:UIControlStateNormal];
        [navController.tabBarItem setTitleTextAttributes:selecteddict forState:UIControlStateSelected];
        //设置图标
        UIImage *selectedImage=[[controllerInfo objectAtIndex:i] objectForKey:@"selectedicon"];
        selectedImage=[selectedImage drawImageWithColor:[UIColor redColor]];
        selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIImage *image=[[controllerInfo objectAtIndex:i] objectForKey:@"icon"];
        image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        image=[image drawImageWithColor:[UIColor grayColor]];
        navController.tabBarItem.image=image;
        navController.tabBarItem.selectedImage=selectedImage;
       
        [controllerArray addObject:navController];
        
    }
    self.viewControllers = controllerArray;
    
}
//
//- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
//
//    BaseNavigationController * nav = (BaseNavigationController *)viewController;
//    BOOL isSetting = [nav.topViewController isKindOfClass:[SettingViewController class]];
//    if (isSetting) {
//
//        [UnityLHClass showHUDWithStringAndTime:@"功能正在开发中，敬请期待"];
//    }
//    return !isSetting;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
