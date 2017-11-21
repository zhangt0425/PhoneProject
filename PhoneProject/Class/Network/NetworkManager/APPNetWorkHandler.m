//
//  APPNetWorkHandler.m
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/25.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "APPNetWorkHandler.h"
#import "APPNetWorkItem.h"

@implementation APPNetWorkHandler

+ (APPNetWorkHandler *) sharedInstance
{
    static APPNetWorkHandler * handler = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        handler = [[APPNetWorkHandler alloc] init];
    });
    
    return handler;
}

/**
 *  拼接完整URL
 */
- (NSString *)appServerAddress:(NSString *)methodName
{
    NSString *address=[NSString stringWithFormat:@"%@/%@/%@",APPServiceISOnline?APPServerAddress_online:APPServerAddress_offline,APPServiceISOnline?APPVersion_online:APPVersion_offline,methodName];
    return address;
}
- (void)cancelAllDelegate
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.operationQueue cancelAllOperations];
    _showHUDReqCount = 0;
    [self.networkItems removeAllObjects];
}

- (BOOL)cancelForDelegate:(id)delelgate
{
    NSUInteger hashValue = [delelgate hash];
    
    BOOL flag = NO;
    
    for (APPNetWorkItem *item in self.networkItems)
    {
        if (item.hashValue == hashValue)
        {
            [self removeItem:item];
            flag = YES;
        }
    }
    
    return flag;
}

- (void)addItem:(APPNetWorkItem *)networkItem
{
    if (networkItem.showHUD)
    {
        _showHUDReqCount++;
        
        if (_showHUDReqCount == 1)
        {
            //网络请求处理开始 菊花处理逻辑 在这里加载菊花
        }
    }
    
    [self.networkItems addObject:networkItem];
}

- (void)removeItem:(APPNetWorkItem *)networkItem
{
    if (networkItem.showHUD)
    {
        _showHUDReqCount--;
        
        if (_showHUDReqCount == 0)
        {
            //网络请求处理完毕 菊花处理逻辑 在这里隐藏菊花
        }
    }
    
    [self.networkItems removeObject:networkItem];
}


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
        failureBlock:(APPFailureBlock) failureBlock
{
    url=[self appServerAddress:url];
    DEF_DEBUG(@"APP网络请求接口:%@", url);
    DEF_DEBUG(@"APP网络请求参数:%@", params);
    
    NSMutableString *requestStr=[[NSMutableString alloc]init];
    id paramKey = nil;
    NSEnumerator *enumerator = [params keyEnumerator];
    if ((paramKey = [enumerator nextObject]))
    {
        [requestStr appendFormat:@"?%@=%@",paramKey,[params objectForKey:paramKey]];
    }
    while ((paramKey = [enumerator nextObject]))
    {
        [requestStr appendFormat:@"&%@=%@",paramKey,[params objectForKey:paramKey]];
    }
    DEF_DEBUG(@"APP请求接口URL====\n\n%@%@\n\n",url,requestStr);
    NSUInteger hashValue = [delegate hash];
    APPNetWorkItem *item = [[APPNetWorkItem alloc] initWithtype:networkType
                                                          url:url
                                                       params:params
                                                     delegate:delegate
                                                    hashValue:hashValue
                                                      showHUD:showHUD
                                                  shouldCache:shouldCache
                                                 successBlock:successBlock
                                                 failureBlock:failureBlock];
    return item.hashValue;

}

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
        failureBlock:(APPFailureBlock) failureBlock
{
    url=[self appServerAddress:url];
    DEF_DEBUG(@"APP网络请求接口:%@", url);
    DEF_DEBUG(@"APP网络请求参数:%@", params);
    
    NSMutableString *requestStr=[[NSMutableString alloc]init];
    id paramKey = nil;
    NSEnumerator *enumerator = [params keyEnumerator];
    if ((paramKey = [enumerator nextObject]))
    {
        [requestStr appendFormat:@"?%@=%@",paramKey,[params objectForKey:paramKey]];
    }
    while ((paramKey = [enumerator nextObject]))
    {
        [requestStr appendFormat:@"&%@=%@",paramKey,[params objectForKey:paramKey]];
    }
    DEF_DEBUG(@"APP请求接口URL====\n\n%@%@\n\n",url,requestStr);
    NSUInteger hashValue = [delegate hash];
    APPNetWorkItem *item = [[APPNetWorkItem alloc] initWithtype:networkType
                                                            url:url
                                                         params:params
                                                         images:images
                                                       delegate:delegate
                                                      hashValue:hashValue
                                                        showHUD:showHUD
                                                   successBlock:successBlock
                                                   failureBlock:failureBlock];
    return item.hashValue;

}

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
             failureBlock:(APPFailureBlock) failureBlock
{
    url=[self appServerAddress:url];
    DEF_DEBUG(@"下载地址:%@", url);

    NSUInteger hashValue = [delegate hash];
    APPNetWorkItem *item = [[APPNetWorkItem alloc] initDownloadWithtype:NetWorkPOST
                                                                    url:url
                                                               delegate:delegate
                                                              hashValue:hashValue
                                                          progressBlock:(APPProgressBlock) progressBlock
                                                             startBlock:startBlock
                                                           successBlock:successBlock
                                                           failureBlock:failureBlock];
    return item.hashValue;
}


@end
