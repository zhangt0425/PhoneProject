//
//  HomeViewController.m
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/21.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configTitle:@"首页"];
}
- (void)configView 
{
    TouchIDManager *touch = [[TouchIDManager alloc] checkTouchIDWithMessage:@"请验证指纹" backTitle:@"密码验证"];
    
    [touch startCheckWithResultBlock:^(NSInteger codeNumber) {
        //执行自己的操作
        [NSObject showAlertView:[NSString stringWithFormat:@"%d",codeNumber]];
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
