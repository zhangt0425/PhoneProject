//
//  UserInfoModel.h
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/24.
//  Copyright © 2017年 张涛. All rights reserved.
//


/**
 * 用户基本信息 可以在此作持久化处理
 */

#import <Foundation/Foundation.h>

@interface UserInfoModel : NSObject<NSCoding>

//用户名
@property (nonatomic,strong) NSString *userName;

//手机号
@property (nonatomic,strong) NSString *mobile;

@end
