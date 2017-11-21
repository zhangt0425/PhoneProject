//
//  APPRefreshDataManager.h
//  PhoneProject
//
//  Created by 涛涛 on 2017/11/3.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJRefresh.h"

typedef NS_ENUM(NSInteger, RefreshType)
{
    RefreshTypeDropDown = 0,  //只支持下拉刷新
    RefreshTypeUpDrop = 1,    //只支持上拉加载更多
    RefreshTypeDouble = 2,    //支持上拉和下拉
};

@interface APPRefreshDataManager : NSObject

/*加载第几页**/
@property(nonatomic,assign) NSInteger pageIndex;
/*每页数据加载数量**/
@property(nonatomic,assign) NSInteger pageSize;


+ (instancetype)RefreshDataManager;

/*加载数据**/
- (void)loadData;
/*加载第一页数据**/
- (void)loadfirstData;
/*加载下一页数据**/
- (void)loadNextData;
/*加载拿到的数据判读是否可以加载更多**/
- (NSMutableArray*)loadDataWithDataSource:(NSArray *)dataSource;

//结束刷新状态
- (void)endAPPRefresh;
//没有更多数据了状态
- (void)endRefreshingWithNoMoreData;
//重置更多数据了状态
- (void)resetNoMoreData;

//正常模式下拉刷新---不支持beginRefreshing刷新
- (void)normalAPPRefresh:(UIScrollView *)scrollView dropDownBlock:(MJRefreshComponentRefreshingBlock)dropDownBlock;

//正常模式上拉加载更多---不支持beginRefreshing刷新
- (void)normalAPPRefresh:(UIScrollView *)scrollView  upDropBlock:(MJRefreshComponentRefreshingBlock)upDropBlock;

//正常模式上拉下拉刷新---支持beginRefreshing刷新
- (void)normalAPPRefresh:(UIScrollView *)scrollView dropDownBlock:(MJRefreshComponentRefreshingBlock)dropDownBlock upDropBlock:(MJRefreshComponentRefreshingBlock)upDropBlock;

//正常模式下拉刷新
- (void)normalAPPRefresh:(UIScrollView *)scrollView firstRefresh:(BOOL)firstRefresh dropDownBlock:(MJRefreshComponentRefreshingBlock)dropDownBlock;
//正常模式上拉加载更多
- (void)normalAPPRefresh:(UIScrollView *)scrollView firstRefresh:(BOOL)firstRefresh upDropBlock:(MJRefreshComponentRefreshingBlock)upDropBlock;

//正常模式上拉下拉刷新
- (void)normalAPPRefresh:(UIScrollView *)scrollView firstRefresh:(BOOL)firstRefresh dropDownBlock:(MJRefreshComponentRefreshingBlock)dropDownBlock upDropBlock:(MJRefreshComponentRefreshingBlock)upDropBlock;

//正常模式上拉下拉刷新
/**
 refreshType            mj刷新type
 firstRefresh           是否beginRefreshing刷新
 timeLabHidden          否隐藏时间
 stateLabHidden         否隐藏状态
 dropDownBlock          下拉刷新回调
 upDropBlock            上拉加载更多回调
 */
- (void)normalAPPRefresh:(UIScrollView *)scrollView refreshType:(RefreshType)refreshType firstRefresh:(BOOL)firstRefresh timeLabHidden:(BOOL)timeLabHidden stateLabHidden:(BOOL)stateLabHidden dropDownBlock:(MJRefreshComponentRefreshingBlock)dropDownBlock upDropBlock:(MJRefreshComponentRefreshingBlock)upDropBlock;

@end

