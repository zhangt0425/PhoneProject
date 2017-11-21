//
//  APPRefreshDataManager.m
//  PhoneProject
//
//  Created by 涛涛 on 2017/11/3.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "APPRefreshDataManager.h"

@interface APPRefreshDataManager()<DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>

@property(nonatomic,strong)UIScrollView *scrollView;

@property(nonatomic,strong)MJRefreshComponentRefreshingBlock dropDownBlock;//下拉
@property(nonatomic,strong)MJRefreshComponentRefreshingBlock upDropBlock;//上拉

@property(nonatomic,strong)NSMutableArray *dataSource;
@property(nonatomic,strong)NSMutableArray *tempSource;


@end

@implementation APPRefreshDataManager

+ (instancetype)RefreshDataManager
{
    APPRefreshDataManager *cmp = [[self alloc] init];
    return cmp;
    
}
- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.pageIndex=1;
        self.pageSize=10;
        self.tempSource=[[NSMutableArray alloc]init];
        self.dataSource=[[NSMutableArray alloc]init];
    }
    return self;
}
/*加载数据**/
- (void)loadData
{
    [self loadfirstData];
}
/*加载第一页数据**/
- (void)loadfirstData
{
    [self.tempSource removeAllObjects];
    [self.dataSource removeAllObjects];
    self.pageIndex=1;
    [self resetNoMoreData];
    if (self.dropDownBlock) {
        self.dropDownBlock();
    }
}

/*加载下一页数据**/
- (void)loadNextData
{
    if (self.tempSource.count==self.pageSize)
    {
        //判读这一页数据等于pageSize 说明还有更多数据
        [self resetNoMoreData];
        self.pageIndex++;
    }
    else
    {
        [self endRefreshingWithNoMoreData];
    }
    if (self.upDropBlock) {
        self.upDropBlock();
    }
}
/*加载拿到的数据判读是否可以加载更多**/
- (NSMutableArray *)loadDataWithDataSource:(NSArray *)dataSource
{
    [self endAPPRefresh];
    [self.tempSource removeAllObjects];
    [self.tempSource addObjectsFromArray:dataSource];
    [self.dataSource addObjectsFromArray:self.tempSource];
    if (dataSource.count<self.pageSize&&self.dataSource.count!=0&&self.pageIndex==1)
    {
        //没有更多数据---不是第一页并且列表有数据
        [self.scrollView reloadEmptyDataSet];
        [self endRefreshingWithNoMoreData];
        if (self.scrollView.mj_footer) {
            [(MJRefreshAutoNormalFooter *)self.scrollView.mj_footer  setTitle:@"----没有更多内容啦----" forState:MJRefreshStateNoMoreData];
        }
    }
    else if (self.dataSource.count==0&&self.pageIndex==1)
    {
        //没有数据数据---空状态
        [self.scrollView  reloadEmptyDataSet];
        [self endRefreshingWithNoMoreData];
        if (self.scrollView.mj_footer) {
            [(MJRefreshAutoNormalFooter *)self.scrollView.mj_footer  setTitle:@"" forState:MJRefreshStateNoMoreData];
        }
    }
    else
    {
        [self resetNoMoreData];
    }
    return self.dataSource;
}
//结束刷新状态
- (void)endAPPRefresh
{
    if ([self.scrollView.mj_header isRefreshing]) {
        [self.scrollView.mj_header endRefreshing];
    }
    if ([self.scrollView.mj_footer isRefreshing]) {
        [self.scrollView.mj_footer endRefreshing];
    }
}

//没有更多数据了状态
- (void)endRefreshingWithNoMoreData
{
    [self.scrollView.mj_footer endRefreshingWithNoMoreData];
}
//重置更多数据了状态
- (void)resetNoMoreData
{
    [self.scrollView.mj_footer resetNoMoreData];
}
//正常模式下拉刷新---不支持beginRefreshing刷新
- (void)normalAPPRefresh:(UIScrollView *)scrollView dropDownBlock:(MJRefreshComponentRefreshingBlock)dropDownBlock
{
    [self normalAPPRefresh:scrollView firstRefresh:NO dropDownBlock:dropDownBlock];
}
//正常模式上拉加载更多---不支持beginRefreshing刷新
- (void)normalAPPRefresh:(UIScrollView *)scrollView  upDropBlock:(MJRefreshComponentRefreshingBlock)upDropBlock
{
    [self normalAPPRefresh:scrollView firstRefresh:NO upDropBlock:upDropBlock];
}
//正常模式上拉下拉刷新
- (void)normalAPPRefresh:(UIScrollView *)scrollView dropDownBlock:(MJRefreshComponentRefreshingBlock)dropDownBlock upDropBlock:(MJRefreshComponentRefreshingBlock)upDropBlock
{
    [self normalAPPRefresh:scrollView refreshType:RefreshTypeDouble firstRefresh:YES timeLabHidden:NO stateLabHidden:NO dropDownBlock:dropDownBlock upDropBlock:upDropBlock];
}
//正常模式下拉刷新
- (void)normalAPPRefresh:(UIScrollView *)scrollView firstRefresh:(BOOL)firstRefresh dropDownBlock:(MJRefreshComponentRefreshingBlock)dropDownBlock
{
    [self normalAPPRefresh:scrollView refreshType:RefreshTypeDropDown firstRefresh:firstRefresh timeLabHidden:NO stateLabHidden:NO dropDownBlock:dropDownBlock upDropBlock:nil];
}

//正常模式上拉加载更多
- (void)normalAPPRefresh:(UIScrollView *)scrollView firstRefresh:(BOOL)firstRefresh upDropBlock:(MJRefreshComponentRefreshingBlock)upDropBlock
{
    [self normalAPPRefresh:scrollView refreshType:RefreshTypeUpDrop firstRefresh:firstRefresh timeLabHidden:NO stateLabHidden:NO dropDownBlock:nil upDropBlock:upDropBlock];
}
//正常模式上拉下拉刷新
- (void)normalAPPRefresh:(UIScrollView *)scrollView firstRefresh:(BOOL)firstRefresh dropDownBlock:(MJRefreshComponentRefreshingBlock)dropDownBlock upDropBlock:(MJRefreshComponentRefreshingBlock)upDropBlock
{
    [self normalAPPRefresh:scrollView refreshType:RefreshTypeDouble firstRefresh:firstRefresh timeLabHidden:NO stateLabHidden:NO dropDownBlock:dropDownBlock upDropBlock:upDropBlock];
}
//正常模式上拉下拉刷新
- (void)normalAPPRefresh:(UIScrollView *)scrollView refreshType:(RefreshType)refreshType firstRefresh:(BOOL)firstRefresh timeLabHidden:(BOOL)timeLabHidden stateLabHidden:(BOOL)stateLabHidden dropDownBlock:(MJRefreshComponentRefreshingBlock)dropDownBlock upDropBlock:(MJRefreshComponentRefreshingBlock)upDropBlock
{
    self.scrollView=scrollView;
    self.upDropBlock=upDropBlock;
    self.dropDownBlock = dropDownBlock;
    self.scrollView.emptyDataSetSource = self;
    self.scrollView.emptyDataSetDelegate = self;
    
    if (refreshType == RefreshTypeDropDown)
    {
        //只支持下拉
        //初始化
        MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadfirstData)];
        //是否隐藏上次更新的时间
        header.lastUpdatedTimeLabel.hidden = timeLabHidden;
        //是否隐藏刷新状态label
        header.stateLabel.hidden = stateLabHidden;
        header.automaticallyChangeAlpha=YES;
        scrollView.mj_header = header;
        //首次进来是否需要刷新
        if (firstRefresh)
        {
            [scrollView.mj_header beginRefreshing];
        }
        else
        {
            [self loadfirstData];
        }
     
    }else if (refreshType == RefreshTypeUpDrop)
    {
        //只支持上拉
        //初始化并指定方法
        MJRefreshAutoNormalFooter *footer  = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadNextData)];
        //指定数据加载完毕的文字
        scrollView.mj_footer =footer;
        //首次进来是否需要刷新
        if (firstRefresh)
        {
            [scrollView.mj_header beginRefreshing];
        }
        else
        {
            [self loadfirstData];
        }
    }else if (refreshType == RefreshTypeDouble)
    {
        //上拉和下拉都持支持
        //下拉
        //初始化
        MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadfirstData)];
        header.automaticallyChangeAlpha=YES;
        //是否隐藏上次更新的时间
        header.lastUpdatedTimeLabel.hidden = timeLabHidden;
        //是否隐藏刷新状态label
        header.stateLabel.hidden = stateLabHidden;
        scrollView.mj_header = header;
      
        //上拉
        //初始化并指定方法
        MJRefreshAutoNormalFooter *footer  = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadNextData)];
        //指定数据加载完毕的文字
        scrollView.mj_footer =footer;
        
        //首次进来是否需要刷新
        if (firstRefresh)
        {
            [scrollView.mj_header beginRefreshing];
        }
        else
        {
            [self loadfirstData];
        }
    }
    
}

#pragma mark - DZNEmptyDataSetSource
// 改变垂直上离中心点的距离
- (CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView
{
    return -54.0;
}
- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView
{
    return [UIImage imageNamed:@"EmptyData_one"];
}
- (CAAnimation *)imageAnimationForEmptyDataSet:(UIScrollView *)scrollView
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath: @"transform"];
    
    animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    animation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI_2, 0.0, 0.0, 1.0)];
    animation.duration = 0.25;
    animation.cumulative = YES;
    animation.repeatCount = MAXFLOAT;
    
    return animation;
}

- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView
{
    NSString *text = @"暂无数据";
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:18.0f],
                                 NSForegroundColorAttributeName: [UIColorManager ThemeLightGrayColorColor]};
    
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}

- (UIColor *)backgroundColorForEmptyDataSet:(UIScrollView *)scrollView
{
    return [UIColorManager ThemeBackgroundColor];
}

#pragma mark - DZNEmptyDataSetDelegate
- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView
{
    return YES;
}

@end
