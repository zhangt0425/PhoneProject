//
//  APPChoosePhotosManager.m
//  PhoneProject
//
//  Created by 涛涛 on 2017/10/31.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "APPChoosePhotosManager.h"
@interface APPChoosePhotosManager()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (nonatomic, strong) ChoosePhotoBlock choosePhoto;

@end

@implementation APPChoosePhotosManager

+ (instancetype)sharedAPPChoosePhotosManager
{
    APPChoosePhotosManager *manager = [[APPChoosePhotosManager alloc] init];
    return manager;
}
//选择照片
- (void)choosePhotoBlock:(ChoosePhotoBlock)choosePhotoBlock
{
    [self callImagePickerPhotoBlock:choosePhotoBlock];
}
// 调用图片选择器
- (void)callImagePickerPhotoBlock:(ChoosePhotoBlock)choosePhotoBlock
{
    UIAlertController *alertController=[UIAlertController alertControllerWithTitle:@"选择照片" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *actionOne=[UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self openCameraChoosePhotoBlock:choosePhotoBlock];
    }];
    UIAlertAction *actionTwo=[UIAlertAction actionWithTitle:@"从手机相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self openPhotoChoosePhotoBlock:choosePhotoBlock];
    }];
    UIAlertAction *actionThree=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [alertController dismissViewControllerAnimated:YES completion:nil];
    }];
    [alertController addAction:actionOne];
    [alertController addAction:actionTwo];
    [alertController addAction:actionThree];
    [DEF_KAPPDELEGATE.window.rootViewController presentViewController:alertController animated:YES completion:nil];
    
}

- (void)openCameraChoosePhotoBlock:(ChoosePhotoBlock)choosePhotoBlock
{
    if(![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"提示" message:[NSString stringWithFormat:@"摄像机不可用！"] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    if (choosePhotoBlock)
    {
        self.choosePhoto = [choosePhotoBlock copy];
    }
    // 跳转到相机
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.delegate = self;
    imagePickerController.allowsEditing = YES;
    imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    [DEF_KAPPDELEGATE.window.rootViewController presentViewController:imagePickerController animated:YES completion:nil];
    
}
- (void)openPhotoChoosePhotoBlock:(ChoosePhotoBlock)choosePhotoBlock
{
    if (choosePhotoBlock)
    {
        self.choosePhoto = [choosePhotoBlock copy];
    }
    // 跳转到相册
    //设置状态栏
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.delegate = self;
    imagePickerController.allowsEditing = YES;
    imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [DEF_KAPPDELEGATE.window.rootViewController presentViewController:imagePickerController animated:YES completion:nil];
//    [[UIBarButtonItem appearance] setTintColor:[UIColor whiteColor]];
//    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:17.0]}];
//    [[UINavigationBar appearance] setShadowImage:[UIImage new]];
//    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageWithColor:[UIColorManager ThemeNavigationBarColor]] forBarMetrics:UIBarMetricsDefault];

}
#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
    //设置状态栏
//    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    [picker dismissViewControllerAnimated:YES completion:^{
        if (self.choosePhoto)
        {
            self.choosePhoto(image);
        }
    }];
    
}


@end
