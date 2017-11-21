//
//  APPCacheManager.h
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/29.
//  Copyright © 2017年 张涛. All rights reserved.
//

//缓存数据

#import <Foundation/Foundation.h>

@class APPCacheObject;
@interface APPCacheManager : NSObject

singleton_for_header(APPCacheManager)

/*
 * 是否有缓存数据
 */
- (BOOL)hasCacheWithServiceIdentifier:(NSString *)serviceIdentifier;
/*
 * 保存缓存
 */
- (void)saveCacheWithData:(id)responseData serviceIdentifier:(NSString *)serviceIdentifier;
/*
 * 获取缓存
 */
- (id)fetchCachedDataWithServiceIdentifier:(NSString *)serviceIdentifier;
/*
 * 删除缓存
 */
- (void)deleteCachedDataWithServiceIdentifier:(NSString *)serviceIdentifier;
/*
 * 清除缓存
 */
- (void)clean;

@end


@interface APPCacheObject : NSObject

@property (nonatomic, copy, readonly) id content;
@property (nonatomic, strong, readonly) NSDate *lastUpdateTime;

@property (nonatomic, assign, readonly) BOOL isOutdated;
@property (nonatomic, assign, readonly) BOOL isEmpty;

- (instancetype)initWithContent:(id)content;

- (void)updateContent:(id)content;

@end
