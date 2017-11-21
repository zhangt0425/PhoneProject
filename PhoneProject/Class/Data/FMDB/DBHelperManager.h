//
//  DBHelperManager.h
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/21.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"

@interface DBHelperManager : NSObject


@property (nonatomic, retain, readonly) FMDatabaseQueue *dbQueue;

+ (DBHelperManager *)shareInstance;

+ (NSString *)dbPath;

- (BOOL)changeDBWithDirectoryName:(NSString *)directoryName;


@end
