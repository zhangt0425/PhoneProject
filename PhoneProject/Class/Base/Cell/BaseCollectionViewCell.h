//
//  BaseCollectionViewCell.h
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/18.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, UICollectionViewCellSelectionStyle)
{
    UICollectionViewCellSelectionStyleNone,//默认
    UICollectionViewCellSelectionStyleGray,//灰色
};

@interface BaseCollectionViewCell : UICollectionViewCell

@property(nonatomic,assign)UICollectionViewCellSelectionStyle selectionStyle;

//获取UICollectionView的cell
+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath;

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
