//
//  QYSInterstitialAdDelegate.h
//  QYSMobSDK
//
//  Created by quys on 2020/11/2.
//  Copyright © 2020 Quys. All rights reserved.
//

#import <Foundation/Foundation.h>
@class QYSInterstitialAd;

NS_ASSUME_NONNULL_BEGIN
/**
* 插屏广告协议
*/
@protocol QYSInterstitialAdDelegate <NSObject>

@optional

/**
* 广告请求成功回调
*/
- (void)quys_InterstitialRequestSuccess:(QYSInterstitialAd *)interstitialAd;

/**
* 广告请求失败回调
*/
- (void)quys_InterstitialRequestFail:(QYSInterstitialAd *)interstitialAd error:(NSError*)error;

/**
* 广告曝光回调
*/
- (void)quys_InterstitialExposured:(QYSInterstitialAd *)interstitialAd;

/**
* 广告点击回调
*/
- (void)quys_InterstitialClicked:(QYSInterstitialAd *)interstitialAd;

/**
* 广告关闭回调
*/
- (void)quys_InterstitialClosed:(QYSInterstitialAd *)interstitialAd;

@end

NS_ASSUME_NONNULL_END
