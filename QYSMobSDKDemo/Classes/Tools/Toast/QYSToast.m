//
//  QYSToast.m
//  QuysMobSDKTest
//
//  Created by quys on 2020/11/27.
//  Copyright © 2020 Quys. All rights reserved.
//

#import "QYSToast.h"
#import "UIView+Toast.h"

@implementation QYSToast
+ (void) showSuccess:(NSString*) title msg:(NSString*) msg
{
    CSToastStyle* style = [[CSToastStyle alloc] initWithDefaultStyle];
    style.imageSize = CGSizeMake(16, 16);
    [[UIApplication sharedApplication].keyWindow
     makeToast:msg
     duration:3.0
     position:CSToastPositionCenter
     title:title
     image:[UIImage imageNamed:@"data_success"]
     style:style
     completion:^(BOOL didTap) {
     }];
}

+ (void) showError:(NSString*) title msg:(NSString*) msg
{
    CSToastStyle* style = [[CSToastStyle alloc] initWithDefaultStyle];
    style.imageSize = CGSizeMake(16, 16);
    [[UIApplication sharedApplication].keyWindow
     makeToast:msg//@"appId 或者 posId 为空 , 请填写完整的appId 和 posId。"
     duration:3.0
     position:CSToastPositionCenter
     title:title//@"数据错误"
     image:[UIImage imageNamed:@"data_error"]
     style:style
     completion:^(BOOL didTap) {
     }];
}

+ (void) showMsg:(NSString*) msg{
    if (msg.length > 0) {
        [[UIApplication sharedApplication].keyWindow makeToast:msg];
    }
}

@end
