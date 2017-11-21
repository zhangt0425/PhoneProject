//
//  AllViewController.m
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/22.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "AllViewController.h"

@interface AllViewController ()

@end

@implementation AllViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configTitle:@"全部"];
}

- (void)configView
{
    [[APPConfigManager sharedAPPConfigManager] printsAppConfigInfo];
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
