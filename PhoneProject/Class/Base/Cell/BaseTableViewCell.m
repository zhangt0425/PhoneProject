//
//  BaseTableViewCell.m
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/18.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "BaseTableViewCell.h"

@implementation BaseTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    BaseTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:[BaseTableViewCell configReuseIdentifier]];
    if (!cell)
    {
        cell=[[BaseTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:[BaseTableViewCell configReuseIdentifier]];
    }
    return cell;
}
+ (instancetype)cellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath
{
    BaseTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:[BaseTableViewCell configReuseIdentifier] forIndexPath:indexPath];
    if (!cell)
    {
        cell=[[BaseTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:[BaseTableViewCell configReuseIdentifier]];
    }
    return cell;
}
+ (CGFloat)configCellHightWithDataSource:(id)dataSource
{
    return 44.0;
}
+ (CGFloat)configCellHeight
{
    return 44.0;
}
+ (NSString *)configReuseIdentifier
{
    return @"BaseTableViewCell";
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.selectionStyle = UITableViewCellSelectionStyleGray;
        UIView *selectedBackgroundView=[[UIView alloc]initWithFrame:self.bounds];
        selectedBackgroundView.backgroundColor=[UIColor groupTableViewBackgroundColor];
        self.selectedBackgroundView=selectedBackgroundView;
        [self configCell];
    }
    
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    [self configLayoutSubviews];
    
}
- (void)configCell
{
    
}
- (void)configLayoutSubviews
{
    
}
- (void)configCellWithDataSource:(id)dataSource
{
    
}
- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

@end
