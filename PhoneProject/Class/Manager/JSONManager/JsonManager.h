//
//  JsonManager.h
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/23.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JsonManager : NSObject

// json字符串字转字典或数组|或者|字典或数组转json字符串
+ (id)JSONObjectWithValue:(id)value;

@end
