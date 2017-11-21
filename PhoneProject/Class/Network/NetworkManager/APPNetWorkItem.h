//
//  APPNetWorkItem.h
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/25.
//  Copyright © 2017年 张涛. All rights reserved.
//
/*
 * 网络相关一些公共API 都统一放在这里 
 */

#import <Foundation/Foundation.h>
#import "BaseNetWorkItem.h"
#import "APPNetWorkURLS.h"

@interface APPNetWorkItem : BaseNetWorkItem

/**
 *  创建一个网络请求项，开始请求网络
 *
 *  @param networkType  网络请求方式
 *  @param url          网络请求URL
 *  @param params       网络请求参数
 *  @param delegate     网络请求的委托，如果没有取消网络请求的需求，可传nil
 *  @param hashValue    网络请求的委托delegate的唯一标示
 *  @param showHUD      是否显示HUD
 *  @param shouldCache  是否启用缓存
 *  @param successBlock 请求成功后的block
 *  @param failureBlock 请求失败后的block
 *
 *  @return BMNetworkItem对象
 */
- (APPNetWorkItem *) initWithtype:(NetWorkType) networkType
                              url:(NSString *) url
                           params:(NSDictionary *) params
                         delegate:(id) delegate
                        hashValue:(NSUInteger) hashValue
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
 *  @param hashValue    网络请求的委托delegate的唯一标示
 *  @param showHUD      是否显示HUD
 *  @param successBlock 请求成功后的block
 *  @param failureBlock 请求失败后的block
 *
 *  @return BMNetworkItem对象
 */
- (APPNetWorkItem *) initWithtype:(NetWorkType) networkType
                              url:(NSString *) url
                           params:(NSDictionary *) params
                           images:(NSDictionary *) images
                         delegate:(id) delegate
                        hashValue:(NSUInteger) hashValue
                          showHUD:(BOOL) showHUD
                     successBlock:(APPSuccessBlock) successBlock
                     failureBlock:(APPFailureBlock) failureBlock;

/**
 *  创建一个下载的网络请求项，开始请求网络
 *
 *  @param networkType  网络请求方式
 *  @param url          网络请求URL
 *  @param delegate     网络请求的委托，如果没有取消网络请求的需求，可传nil
 *  @param hashValue    网络请求的委托delegate的唯一标示
 *  @param startBlock   请求开始后的block
 *  @param successBlock 请求成功后的block
 *  @param failureBlock 请求失败后的block
 *
 *  @return BMNetworkItem对象
 */
- (APPNetWorkItem *) initDownloadWithtype:(NetWorkType) networkType
                                      url:(NSString *) url
                                 delegate:(id) delegate
                                hashValue:(NSUInteger) hashValue
                            progressBlock:(APPProgressBlock) progressBlock
                               startBlock:(APPStartBlock) startBlock
                             successBlock:(APPSuccessBlock) successBlock
                             failureBlock:(APPFailureBlock) failureBlock;

@end
