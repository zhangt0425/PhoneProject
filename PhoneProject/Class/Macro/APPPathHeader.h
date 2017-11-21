//
//  APPPathHeader.h
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/21.
//  Copyright © 2017年 张涛. All rights reserved.
//

#ifndef APPPathHeader_h
#define APPPathHeader_h

// 获取沙盒主目录路径
#define DEF_Sandbox_HomeDir     NSHomeDirectory()


// 获取tmp目录路径
#define DEF_TmpDir              NSTemporaryDirectory()


// 获取Documents目录路径
#define DEF_DocumentsDir        [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]


// 获取Caches目录路径
#define DEF_CachesDir           [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0]


// 获取当前程序包中一个图片资源（apple.png）路径
#define DEF_IMAGE_PATH(_name)   [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:_name]


/**
 
 NSFileManager *fm = [NSFileManager defaultManager];
 if (![fm fileExistsAtPath:[self dataFilePath]]) {
 
 // 下面是对该文件进行制定路径的保存
 [fm createDirectoryAtPath:[self dataFilePath] withIntermediateDirectories:YES attributes:nil error:nil];
 
 // 取得一个目录下得所有文件名
 NSArray *files = [fm subpathsAtPath:[self dataFilePath]];
 
 // 读取某个文件
 NSData *data = [fm contentsAtPath:[self dataFilePath]];
 
 // 或者
 NSData *data = [NSData dataWithContentOfPath:[self dataFilePath]];
 }
 
 */


#endif /* APPPathHeader_h */
