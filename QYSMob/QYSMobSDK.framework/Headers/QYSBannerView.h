//
//  QYSBannerView.h
//  QYSMobSDK
//
//  Created by quys on 2020/11/2.
//  Copyright © 2020 Quys. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#if __has_include(<QYSMobSDK/QYSBannerViewDelegate.h>)
    #import <QYSMobSDK/QYSBannerViewDelegate.h>
#else
    #import "QYSBannerViewDelegate.h"
#endif

NS_ASSUME_NONNULL_BEGIN
/**
 *  横幅广告
 */
@interface QYSBannerView : UIView
/**
 *  委托对象
 */
@property (nonatomic, weak) id <QYSBannerViewDelegate>delegate;

/**
 *  构造方法
 *  详解：placementId - 广告位 ID
 *           controller - 视图控制器
 * Banner 比例 640:100 最大高度为设备屏幕宽度/6.4
 */
- (instancetype)initWithFrame:(CGRect)frame
                   placementId:(NSString *)placementId rootViewController:(UIViewController*)controller;
/**
 *  拉取并展示广告
 */
- (void)loadAdAndShow;


@end

NS_ASSUME_NONNULL_END
