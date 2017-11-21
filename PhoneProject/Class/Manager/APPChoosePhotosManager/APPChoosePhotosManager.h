//
//  APPChoosePhotosManager.h
//  PhoneProject
//
//  Created by 涛涛 on 2017/10/31.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^ChoosePhotoBlock)(UIImage *image);

@interface APPChoosePhotosManager : NSObject

+ (instancetype)sharedAPPChoosePhotosManager;

//选择照片
- (void)choosePhotoBlock:(ChoosePhotoBlock)choosePhotoBlock;
//相机选择照片
- (void)openCameraChoosePhotoBlock:(ChoosePhotoBlock)choosePhotoBlock;
//相册选择照片
- (void)openPhotoChoosePhotoBlock:(ChoosePhotoBlock)choosePhotoBlock;

@end
