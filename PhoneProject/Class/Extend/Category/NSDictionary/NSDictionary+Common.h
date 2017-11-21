//
//  NSDictionary+Common.h
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/21.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Common)

/**
 *  代替原NSDictionary里的objectForKey方法
 *
 *  @param pKey 传入key
 *
 *  @return 返回key对应的value
 */
- (id)objectForPKey:(id)pKey;


@end
