//
//  BlockHeader.h
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/21.
//  Copyright © 2017年 张涛. All rights reserved.
//

#ifndef BlockHeader_h
#define BlockHeader_h

#import "UIControl+Block.h"
#import "UIView+Block.h"
#import "NSObject+Block.h"

#endif /* BlockHeader_h */


/**
 *  为UIAlertView、UIActionSheet、UIControl的所有子类（UIButton,UIDataPicker 等等）添加使用 Block 的回调
 *  代替delegate和target 和 selector
 */


#pragma mark - 数据传输的block用法
/** 数据传输的block用法
 
 // A类里 //
 
 UIViewController *b = [[UIViewController alloc] init];
 
 // 把数据传到B类里
 [b setMHObject:@"把数据传递到B类里"];
 
 // 接收B类里回传的数据
 [b receiveObject:^(id object) {
 
 NSLog(@"[menghuan] receive : %@", object);
 
 } withIdentifier:@"menghuan"];
 
 // 自定义block的方式
 [b handlerEventWithBlock:^(NSString *value1,NSString *value2){
 
 NSLog(@"%@",value1);
 NSLog(@"%@",value2);
 
 } withIdentifier:@"custom block"];
 
 
 // B类里 //
 
 // 在B类里获取传递过来的数据
 NSLog(@"传递过来的数据: %@", [b getMHObject]);
 
 // 回传数据到A类里
 [self sendObject:@"hahaha" withIdentifier:@"menghuan"];
 
 // 自定义block的方式回传数据到A类里
 void(^block)(NSString *, NSString *) = [self blockForEventWithIdentifier:@"custom block"];
 block(@"I'm the first value", @"I'm the second value");
 
 */


#pragma mark - 点击事件的block用法
/** 点击事件的block用法
 
 UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
 [self.view addSubview:button];
 
 // UIButton的block点击
 [button handleControlEvent:UIControlEventTouchUpInside withBlock:^(id sender) {
 
 UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"alert"
 message:nil
 delegate:nil
 cancelButtonTitle:@"ok"
 otherButtonTitles:@"other",nil];
 [alert showWithCompletionHandler:^(NSInteger buttonIndex) {
 NSLog(@"UIAlertView的block点击: %d",buttonIndex);
 }];
 
 }];
 
 UIButton *button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
 [self.view addSubview:button2];
 
 [button2 handleControlEvent:UIControlEventTouchUpInside withBlock:^(id sender) {
 UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:nil
 delegate:nil
 cancelButtonTitle:@"cancel"
 destructiveButtonTitle:nil
 otherButtonTitles:@"item1",@"item2",nil];
 [sheet showInView:self.view withCompletionHandler:^(NSInteger buttonIndex) {
 NSLog(@"UIActionSheet的block点击: %d",buttonIndex);
 }];
 }];
 
 // UISwitch的block点击
 UISwitch *swithControl = [[UISwitch alloc] initWithFrame:CGRectMake(50, 10, 0, 0)];
 [self.view addSubview:swithControl];
 [swithControl handleControlEvent:UIControlEventValueChanged withBlock:^(id sender) {
 UISwitch *s = sender;
 NSLog(@"value:%@",s.isOn?@"on":@"off");
 }];
 
 // UISlider的block点击
 UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(140, 11, 130, 0)];
 [self.view addSubview:slider];
 [slider handleControlEvent:UIControlEventValueChanged withBlock:^(id sender) {
 UISlider *slider = sender;
 NSLog(@"slider:%f",slider.value);
 }];
 
 // UISegmentedControl的block点击
 UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:@[@"item1",@"item2",@"item3"]];
 segment.frame = CGRectMake(50, 110, 220, 44);
 [self.view addSubview:segment];
 [segment handleControlEvent:UIControlEventValueChanged withBlock:^(id sender) {
 UISegmentedControl *segment = sender;
 NSLog(@"segment change to %d",segment.selectedSegmentIndex);
 }];
 
 // UIDatePicker的block点击
 UIDatePicker *datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 160, 0, 0)];
 [self.view addSubview:datePicker];
 [datePicker handleControlEvent:UIControlEventValueChanged withBlock:^(id sender) {
 UIDatePicker *picker = sender;
 NSLog(@"date:%@",picker.date);
 }];
 */

