//
//  APPSingletonHeader.h
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/23.
//  Copyright © 2017年 张涛. All rights reserved.
//

/**
 *  使用方法
 *  1，在.h里调用 singleton_for_header(类名)
 *  2，在.m里调用 singleton_for_class(类名)
 */

#ifndef APPSingletonHeader_h
#define APPSingletonHeader_h


// .h 调用
#define singleton_for_header(className) \
\
+ (className *)shared##className;

// .m 调用
#if __has_feature(objc_arc)
// ARC default

#define singleton_for_class(className) \
\
+ (className *)shared##className { \
    static className *shared##className = nil; \
    static dispatch_once_t onceToken; \
    dispatch_once(&onceToken, ^{ \
    shared##className = [[self alloc] init]; \
    }); \
    return shared##className; \
}


#else
// MRC

#define singleton_for_class(className) \
\
static className *shared##className = nil; \
\
+ (className *)shared##className \
{ \
    @synchronized(self) \
    { \
        if (shared##className == nil) \
        { \
            shared##className = [[self alloc] init]; \
        } \
    } \
    \
    return shared##className; \
} \
\
+ (id)allocWithZone:(NSZone *)zone \
{ \
    @synchronized(self) \
    { \
        if (shared##className == nil) \
        { \
            shared##className = [super allocWithZone:zone]; \
            return shared##className; \
        } \
    } \
    \
    return nil; \
} \
\
- (id)copyWithZone:(NSZone *)zone \
{ \
    return self; \
} \
\
- (id)retain \
{ \
    return self; \
} \
\
- (NSUInteger)retainCount \
{ \
    return NSUIntegerMax; \
} \
\
- (void)release \
{ \
} \
\
- (id)autorelease \
{ \
    return self; \
}


#endif


#endif /* APPSingletonHeader_h */
