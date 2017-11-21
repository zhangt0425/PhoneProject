//
//  APPCacheManager.m
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/29.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "APPCacheManager.h"

@interface APPCacheManager ()

@property (nonatomic, strong) NSCache *cache;

@end

@implementation APPCacheManager

singleton_for_class(APPCacheManager)

#pragma mark - public method
- (BOOL)hasCacheWithServiceIdentifier:(NSString *)serviceIdentifier
{
  id data=  [self fetchCachedDataWithServiceIdentifier:serviceIdentifier];
  if (data)
  {
    return YES;
  }
   return NO;
}

- (void)saveCacheWithData:(id)responseData serviceIdentifier:(NSString *)serviceIdentifier
{
    [self saveCacheWithData:responseData key:serviceIdentifier];
}

- (id)fetchCachedDataWithServiceIdentifier:(NSString *)serviceIdentifier
{
    return [self fetchCachedDataWithKey:serviceIdentifier];
}

- (void)deleteCachedDataWithServiceIdentifier:(NSString *)serviceIdentifier
{
    [self deleteCacheWithKey:serviceIdentifier];
}

- (void)clean
{
    [self.cache removeAllObjects];
}

- (void)saveCacheWithData:(id)data key:(NSString *)key
{
    key=[key urlCodingToUTF8];
    APPCacheObject *cacheObject = [self.cache objectForKey:key];
    if (!cacheObject)
    {
        cacheObject = [[APPCacheObject alloc] init];
    }
    
    [cacheObject updateContent:data];
    [self.cache setObject:cacheObject forKey:key];
}

- (id)fetchCachedDataWithKey:(NSString *)key
{
    key=[key urlCodingToUTF8];
    APPCacheObject *cacheObject = [self.cache objectForKey:key];
    if (!cacheObject || cacheObject.isOutdated || cacheObject.isEmpty)
    {
        return nil;
    }
    else
    {
        return cacheObject.content;
    }
}

- (void)deleteCacheWithKey:(NSString *)key
{
    [self.cache removeObjectForKey:key];
}

#pragma mark - getters and setters
- (NSCache *)cache
{
    if (!_cache)
    {
        _cache = [[NSCache alloc] init];
        _cache.countLimit = APPCacheCountLimit;
    }
    return _cache;
}

@end


@interface APPCacheObject ()

@property (nonatomic, copy, readwrite) id content;
@property (nonatomic, strong, readwrite) NSDate *lastUpdateTime;

@end

@implementation APPCacheObject

- (instancetype)initWithContent:(id)content
{
    self = [super init];
    if (self)
    {
        self.content = content;
    }
    return self;
}

#pragma mark - public method
- (void)updateContent:(id)content
{
    self.content = content;
}

#pragma mark - getters and setters
- (void)setContent:(id)content
{
    _content = [content copy];
    self.lastUpdateTime = [NSDate dateWithTimeIntervalSinceNow:0];
}

- (BOOL)isOutdated
{
    NSTimeInterval timeInterval = [[NSDate date] timeIntervalSinceDate:self.lastUpdateTime];
    return timeInterval > APPCacheOutdateTimeSeconds;
}

- (BOOL)isEmpty
{
    return self.content == nil;
}
@end

