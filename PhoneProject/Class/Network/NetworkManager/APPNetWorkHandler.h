//
//  APPNetWorkHandler.h
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/25.
//  Copyright © 2017年 张涛. All rights reserved.
//


/**
 * 请求管理，管理网络请求开始，结束。。。
 *
 */

#import <Foundation/Foundation.h>
#import "APPNetWorHeader.h"

@class APPNetWorkItem;

@interface APPNetWorkHandler : NSObject

/**
 *  单例
 *
 *  @return BMNetworkHandler的单例对象
 */
+ (APPNetWorkHandler *) sharedInstance;

/**
 *  网络请求项的数组，储存当前正在请求中的那些网络请求项
 */
@property (nonatomic, strong) NSMutableArray *networkItems;

/**
 *  需要显示HUD的网络请求的个数
 */
@property (nonatomic, readonly) NSUInteger showHUDReqCount;


/**
 *  拼接完整URL
 */
- (NSString *)appServerAddress:(NSString *)methodName;

/**
 *  取消当前所有
 */
- (void)cancelAllDelegate;

/**
 *  取消单个请求
 *
 *  @param delelgate 网络请求的委托
 *
 *  @return 是否取消成功
 */
- (BOOL)cancelForDelegate:(id)delelgate;

/**
 *  添加一个网络请求项
 *
 *  @param networkItem 网络请求的委托
 */
- (void)addItem:(APPNetWorkItem *)networkItem;

/**
 *  移除一个网络请求项
 *
 *  @param networkItem 网络请求的委托
 */
- (void)removeItem:(APPNetWorkItem *)networkItem;

/**
 *  创建一个网络请求项
 *
 *  @param url          网络请求URL
 *  @param networkType  网络请求方式
 *  @param params       网络请求参数
 *  @param delegate     网络请求的委托，如果没有取消网络请求的需求，可传nil
 *  @param showHUD      是否显示HUD
 *  @param shouldCache  是否启用缓存
 *  @param successBlock 请求成功后的block
 *  @param failureBlock 请求失败后的block
 *
 *  @return 根据网络请求的委托delegate而生成的唯一标示
 */
- (NSUInteger)conURL:(NSString *) url
         networkType:(NetWorkType) networkType
              params:(NSMutableDictionary *) params
            delegate:(id) delegate
             showHUD:(BOOL) showHUD
         shouldCache:(BOOL) shouldCache
        successBlock:(APPSuccessBlock) successBlock
        failureBlock:(APPFailureBlock) failureBlock;

/**
 *  创建一个网络请求项，开始上传图片
 *
 *  @param networkType  网络请求方式
 *  @param url          网络请求URL
 *  @param params       网络请求参数
 *  @param images       图片二进制数组
 *  @param delegate     网络请求的委托，如果没有取消网络请求的需求，可传nil
 *  @param showHUD      是否显示HUD
 *  @param successBlock 请求成功后的block
 *  @param failureBlock 请求失败后的block
 *
 *  @return BMNetworkItem对象
 */
- (NSUInteger)conURL:(NSString *) url
         networkType:(NetWorkType) networkType
              params:(NSMutableDictionary *) params
              images:(NSDictionary *) images
            delegate:(id) delegate
             showHUD:(BOOL) showHUD
        successBlock:(APPSuccessBlock) successBlock
        failureBlock:(APPFailureBlock) failureBlock;

/**
 *  创建一个下载的网络请求项
 *
 *  @param url              下载地址URL
 *  @param delegate         网络请求的委托，如果没有取消网络请求的需求，可传nil
 *  @param progressBlock    请求开始后下载进度的block
 *  @param startBlock       请求开始后的block
 *  @param successBlock     请求成功后的block
 *  @param failureBlock     请求失败后的block
 *
 *  @return 根据网络请求的委托delegate而生成的唯一标示
 */
- (NSUInteger)downloadURL:(NSString *) url
                 delegate:(id) delegate
            progressBlock:(APPProgressBlock) progressBlock
               startBlock:(APPStartBlock) startBlock
             successBlock:(APPSuccessBlock) successBlock
             failureBlock:(APPFailureBlock) failureBlock;



@end
