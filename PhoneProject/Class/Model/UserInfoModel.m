//
//  UserInfoModel.m
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/24.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "UserInfoModel.h"

@implementation UserInfoModel

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.userName forKey:@"userName"];
    [aCoder encodeObject:self.mobile forKey:@"mobile"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super init]))
    {
        self.userName = [aDecoder decodeObjectForKey:@"userName"];
        self.mobile = [aDecoder decodeObjectForKey:@"mobile"];
    }
    return self;
}


@end
