//
//  NSObject+Block.h
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/21.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Block)

// 在主线程中执行block1，在后台完成后执行block2
+ (void)perform:(void(^)())block1 withCompletionHandler:(void (^)())block2;
- (void)perform:(void(^)())block1 withCompletionHandler:(void (^)())block2;


// 使用 CommonObject 传递参数(retain)
- (void)setCommonObject:(id)obj;
- (id)getCommonObject;


// 默认block回调 key:CommonDefaultEventHandler
- (void)handlerDefaultEventWithBlock:(id)block;
- (id)blockForDefaultEvent;

// 设置一个block作为回调
- (void)handlerEventWithBlock:(id)block withIdentifier:(NSString *)identifier;
- (id)blockForEventWithIdentifier:(NSString *)identifier;


// 数据的回传
// send object
// handle block with default identifier is @"CommonObjectSingleObjectDictionary".
- (void)receiveObject:(void(^)(id object))sendObject;
- (void)sendObject:(id)object;

// tag can't be nil
- (void)receiveObject:(void(^)(id object))sendObject withIdentifier:(NSString *)identifier;
- (void)sendObject:(id)object withIdentifier:(NSString *)identifier;


@end
