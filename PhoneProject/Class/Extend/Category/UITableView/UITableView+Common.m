//
//  UITableView+Common.m
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/21.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "UITableView+Common.h"

@implementation UITableView (Common)

//快速创建
+ (UITableView*)initTableView
{
    return [self initTableViewWithStyle:UITableViewStylePlain];
}

+ (UITableView*)initTableViewWithStyle:(UITableViewStyle)style
{
    return [self initTableViewWithStyle:style rect:CGRectZero];
}

+ (UITableView*)initTableViewWithStyle:(UITableViewStyle)style rect:(CGRect)rect
{
    UITableView *tableView=[[UITableView alloc]initWithFrame:rect style:style];
    return tableView;
}

@end
