//
//  QYSSplashAdDelegate.h
//  QYSMobSDK
//
//  Created by quys on 2020/11/2.
//  Copyright © 2020 Quys. All rights reserved.
//

#import <Foundation/Foundation.h>
@class QYSSplashAd;

NS_ASSUME_NONNULL_BEGIN
/**
* 开屏广告协议
*/
@protocol QYSSplashAdDelegate <NSObject>

@optional

/**
* 广告请求成功回调
*/
- (void)quys_SplashRequestSuccess:(QYSSplashAd *)splashAd;

/**
* 广告请求失败回调
*/
- (void)quys_SplashRequestFail:(QYSSplashAd *)splashAd error:(NSError*)error;

/**
* 广告曝光回调
*/
- (void)quys_SplashExposured:(QYSSplashAd *)splashAd;

/**
* 广告点击回调
*/
- (void)quys_SplashClicked:(QYSSplashAd *)splashAd;

/**
* 广告关闭回调
*/
- (void)quys_SplashClosed:(QYSSplashAd *)splashAd;




@end

NS_ASSUME_NONNULL_END
