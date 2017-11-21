//
//  BaseNetWorkItem.h
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/25.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APPNetWorHeader.h"
#import "AFNetworking.h"

/**
 *  网络请求
 */
@interface BaseNetWorkItem : NSObject


/**
 *  网络请求方式
 */
@property (nonatomic, assign) NetWorkType networkType;

/**
 *  网络请求URL
 */
@property (nonatomic, strong) NSString *url;

/**
 *  网络请求参数
 */
@property (nonatomic, strong) id params;

/**
 *  网络请求的委托
 */
@property (nonatomic, assign) id delegate;

/**
 *  网络请求的委托delegate的唯一标示，因为delegate不能直接作为Key，所以转化了一步，用hashValue代替
 */
@property (nonatomic, assign) NSUInteger hashValue;


/**
 *  NWConnItem对象中封装的ASIHTTPRequest成员变量
 */
@property (nonatomic, strong) AFHTTPRequestOperation *httpRequest;

/**
 *  请求成功后的block
 */
@property (nonatomic, strong) APPSuccessBlock successBlock;

/**
 *  请求失败后的block
 */
@property (nonatomic, strong) APPFailureBlock failureBlock;

/**
 *  上传进度的block
 */
@property (nonatomic, copy) APPProgressBlock uploadProgressBlock;

/**
 *  下载开始的block
 */
@property (nonatomic, copy) APPStartBlock startBlock;

/**
 *  下载进度的block
 */
@property (nonatomic, copy) APPProgressBlock downloadProgressBlock;

/**
 *  是否显示HUD
 */
@property (nonatomic, assign) BOOL showHUD;

/**
 *  是否启用缓存
 */
@property (nonatomic, assign) BOOL shouldCache;


@end
