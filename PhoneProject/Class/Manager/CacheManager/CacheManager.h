//
//  CacheManager.h
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/24.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CacheManager : NSObject

//清除沙盒缓存
+(void)myClearCacheAction;

/**
 *  获取沙盒缓存大小
 *
 *  @return 沙盒缓存大小
 */
+(long long)getNSCachesDirectoryCache;


/**
 *  获取缓存文件大小
 *
 *  @param folderPath 文件路径
 *
 *  @return 文件大小
 */
+ (CGFloat)folderSizeAtPath:(NSString *)folderPath;


@end
