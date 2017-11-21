//
//  APPLogHeader.h
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/21.
//  Copyright © 2017年 张涛. All rights reserved.
//

#ifndef APPLogHeader_h
#define APPLogHeader_h

#ifdef DEBUG
// DEBUG模式下进行调试打印

// 输出结果标记出所在类方法与行数
#define DEF_DEBUG(fmt, ...)   fprintf(stderr,"%s:%d\n%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:fmt, ##__VA_ARGS__] UTF8String]);

#else

#define DEF_DEBUG(...)   {}

#endif

#endif /* APPLogHeader_h */
