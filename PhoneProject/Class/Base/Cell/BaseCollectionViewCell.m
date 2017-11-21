//
//  BaseCollectionViewCell.m
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/18.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "BaseCollectionViewCell.h"

@implementation BaseCollectionViewCell
//获取UICollectionView的cell

+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath
{
    BaseCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:[BaseCollectionViewCell configReuseIdentifier] forIndexPath:indexPath];
    return cell;
    
}
+ (CGFloat)configCellHightWithDataSource:(id)dataSource
{
    return 88.0;
}
+ (CGFloat)configCellHeight
{
    return 88.0;
}
+ (NSString *)configReuseIdentifier
{
    return @"BaseCollectionViewCell";
}
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        UIView* selectedBGView = [[UIView alloc] initWithFrame:self.bounds];
        self.selectedBackgroundView = selectedBGView;
        self.selectionStyle=UICollectionViewCellSelectionStyleNone;
        [self configCell];
    }
    
    return  self;
}
-(void)setSelectionStyle:(UICollectionViewCellSelectionStyle)selectionStyle
{
    _selectionStyle=selectionStyle;
    if (selectionStyle==UICollectionViewCellSelectionStyleGray)
    {
        self.selectedBackgroundView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    else
    {
        self.selectedBackgroundView.backgroundColor = [UIColor clearColor];
    }
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
-(void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
}

@end
