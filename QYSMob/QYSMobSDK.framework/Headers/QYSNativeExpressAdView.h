//
//  QYSNativeExpressAdView.h
//  QYSMobSDK
//
//  Created by quys on 2020/11/6.
//  Copyright © 2020 Quys. All rights reserved.
//

#import <UIKit/UIKit.h>

#if __has_include(<QYSMobSDK/QYSNativeExpressAdDelegate.h>)
    #import <QYSMobSDK/QYSNativeExpressAdDelegate.h>
#else
    #import "QYSNativeExpressAdDelegate.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface QYSNativeExpressAdView : UIView

/*
 *  viewControllerForPresentingModalView
 *  详解：[必选]开发者需传入用来弹出目标页的ViewController，一般为当前ViewController
 */
@property (nonatomic, weak) UIViewController *controller;

/**
 *[必选]
 *原生模板广告渲染
 */
- (void)render;

/**
 * 是否渲染完毕
 */
@property (nonatomic, assign, readonly) BOOL isReady;

/**
 * 是否是视频模板广告
 */
@property (nonatomic, assign, readonly) BOOL isVideoAd;


/**
 * 视频模板广告时长，单位 ms
 */
- (CGFloat)videoDuration;

/**
 * 视频模板广告已播放时长，单位 ms
 */
- (CGFloat)videoPlayTime;


@end

NS_ASSUME_NONNULL_END
