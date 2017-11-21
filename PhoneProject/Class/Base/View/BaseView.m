//
//  BaseProjectView.m
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/18.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView

+ (CGFloat)configViewHeightWithDataSource:(id)dataSource
{
    return 100.0;
}
+ (CGFloat)configViewHeight
{
    return 100.0;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self)
    {
        [self configView];
    }
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    [self configLayoutSubviews];

}
- (void)configView
{
    
}
- (void)configLayoutSubviews
{
    
}
- (void)configViewWithDataSource:(id)dataSource
{
    
}

@end
