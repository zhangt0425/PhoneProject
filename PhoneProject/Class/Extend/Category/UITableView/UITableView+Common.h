//
//  UITableView+Common.h
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/21.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (Common)

//快速创建
+ (UITableView*)initTableView;

+ (UITableView*)initTableViewWithStyle:(UITableViewStyle)style;

+ (UITableView*)initTableViewWithStyle:(UITableViewStyle)style rect:(CGRect)rect;

@end
