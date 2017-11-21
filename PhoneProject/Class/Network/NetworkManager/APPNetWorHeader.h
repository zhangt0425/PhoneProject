//
//  APPNetWorHeader.h
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/25.
//  Copyright © 2017年 张涛. All rights reserved.
//

#ifndef APPNetWorHeader_h
#define APPNetWorHeader_h

/**
 *  请求类型
 */
typedef enum
{
    NetWorkGET,       /**< GET请求 */
    NetWorkPOST       /**< POST请求 */
} NetWorkType;


#if NS_BLOCKS_AVAILABLE

/**
 *  请求开始的回调（下载时用到）
 */
typedef void (^APPStartBlock)(void);

/**
 *  请求成功回调
 *
 *  @param returnData 回调block
 */
typedef void (^APPSuccessBlock)(id returnData);

/**
 *  请求失败回调
 *
 *  @param error 回调block
 */
typedef void (^APPFailureBlock)(NSError *error);


/**
 *  请求进度回调
 *
 *  @param progress 回调block
 */

typedef void (^APPProgressBlock)(NSProgress * progress);

#endif



#endif /* APPNetWorHeader_h */
