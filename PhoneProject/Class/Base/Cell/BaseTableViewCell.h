//
//  BaseTableViewCell.h
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/18.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTableViewCell : UITableViewCell

//获取tableView的cell
+ (instancetype)cellWithTableView:(UITableView *)tableView;
+ (instancetype)cellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath;

//获取cell的cellHeight
+ (CGFloat)configCellHightWithDataSource:(id)dataSource;
+ (CGFloat)configCellHeight;

//获取cell的reuseIdentifier
+ (NSString *)configReuseIdentifier;

//加载cell
- (void)configCell;
//加载视图布局
- (void)configLayoutSubviews;
//加载数据
- (void)configCellWithDataSource:(id)dataSource;

@end
