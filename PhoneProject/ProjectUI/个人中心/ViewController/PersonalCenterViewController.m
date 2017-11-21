//
//  PersonalCenterViewController.m
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/22.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "PersonalCenterViewController.h"

@interface PersonalCenterViewController ()

@end

@implementation PersonalCenterViewController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self appServices];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configTitle:@"个人中心"];
}

- (void)appServices
{
    [APPServices
     getareaInfoWithSuccessBlock:^(id returnData)
     {
         [NSObject showHudTipStr:returnData[@"msg"]];
    }
     failureBlock:^(NSError *error)
     {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
