//
//  NSObject+Block.m
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/21.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "NSObject+Block.h"
#import <objc/runtime.h>

@implementation NSObject (Block)


#pragma mark - 在主线程中执行block1，在后台完成后执行block2
+ (void)perform:(void(^)())block1 withCompletionHandler:(void (^)())block2
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        block1();
        dispatch_async(dispatch_get_main_queue(),^{
            block2();
        });
    });
}

- (void)perform:(void(^)())block1 withCompletionHandler:(void (^)())block2
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        block1();
        dispatch_async(dispatch_get_main_queue(),^{
            block2();
        });
    });
}


#pragma mark - 使用 CommonObject 传递参数(retain)
const char CommonObjectStoreKey;

- (void)setCommonObject:(id)obj
{
    objc_setAssociatedObject(self, &CommonObjectStoreKey, obj, OBJC_ASSOCIATION_RETAIN);
}

- (id)getCommonObject
{
    return objc_getAssociatedObject(self, &CommonObjectStoreKey);
}


#pragma mark - 默认block回调
const char commonObjectEventHandlerDictionary;

- (void)handlerDefaultEventWithBlock:(id)block
{
    [self handlerEventWithBlock:block withIdentifier:@"commonDefaultEventHandler"];
}

- (id)blockForDefaultEvent
{
    return [self blockForEventWithIdentifier:@"commonDefaultEventHandler"];
}

- (void)handlerEventWithBlock:(id)block withIdentifier:(NSString *)identifier
{
    NSAssert(identifier != nil, @"identifier can't be nil.");
    NSMutableDictionary *eventHandlerDictionary = objc_getAssociatedObject(self,&commonObjectEventHandlerDictionary);
    if(eventHandlerDictionary == nil)
    {
        eventHandlerDictionary = [[NSMutableDictionary alloc] init];
        objc_setAssociatedObject(self, &commonObjectEventHandlerDictionary, eventHandlerDictionary, OBJC_ASSOCIATION_RETAIN);
    }
    
    [eventHandlerDictionary setObject:block forKey:identifier];
}

- (id)blockForEventWithIdentifier:(NSString *)identifier
{
    NSAssert(identifier != nil, @"identifier can't be nil.");
    NSDictionary *eventHandlerDictionary = objc_getAssociatedObject(self,&commonObjectEventHandlerDictionary);
    if(eventHandlerDictionary == nil) return nil;
    return [eventHandlerDictionary objectForKey:identifier];
}


#pragma mark - 数据的回传
const char CommonObjectSingleObjectDictionary;

- (void)receiveObject:(void(^)(id object))sendObject
{
    [self receiveObject:sendObject withIdentifier:@"commonObjectSingleObjectDictionary"];
}

- (void)sendObject:(id)object
{
    [self sendObject:object withIdentifier:@"commonObjectSingleObjectDictionary"];
}

- (void)receiveObject:(void(^)(id object))sendObject withIdentifier:(NSString *)identifier
{
    NSAssert(identifier != nil, @"identifier can't be nil.");
    NSMutableDictionary *eventHandlerDictionary = objc_getAssociatedObject(self,&CommonObjectSingleObjectDictionary);
    if(eventHandlerDictionary == nil)
    {
        eventHandlerDictionary = [[NSMutableDictionary alloc] init];
        objc_setAssociatedObject(self, &CommonObjectSingleObjectDictionary, eventHandlerDictionary, OBJC_ASSOCIATION_RETAIN);
    }
    
    [eventHandlerDictionary setObject:sendObject forKey:identifier];
}

- (void)sendObject:(id)object withIdentifier:(NSString *)identifier
{
    NSAssert(identifier != nil, @"identifier can't be nil.");
    
    NSDictionary *eventHandlerDictionary = objc_getAssociatedObject(self,&CommonObjectSingleObjectDictionary);
    if(eventHandlerDictionary == nil)
        return;
    
    void(^block)(id object) = [eventHandlerDictionary objectForKey:identifier];
    block(object);
}

@end
