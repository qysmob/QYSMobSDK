//
//  QYSNativeExpressAdDelegate.h
//  QYSMobSDK
//
//  Created by quys on 2020/11/2.
//  Copyright © 2020 Quys. All rights reserved.
//

#import <Foundation/Foundation.h>
@class QYSNativeExpressAd;
@class QYSNativeExpressAdView;

NS_ASSUME_NONNULL_BEGIN
/**
* 信息流广告协议
*/
@protocol QYSNativeExpressAdDelegate <NSObject>

@optional

/**
* 信息流广告请求成功回调
*/
- (void)quys_nativeExpressRequestSuccess:(QYSNativeExpressAd *)nativeExpressAd views:(NSArray<__kindof QYSNativeExpressAdView *> *)views;

/**
* 信息流广告请求失败回调
*/
- (void)quys_nativeExpressRequestFail:(QYSNativeExpressAd *)nativeExpressAd error:(NSError*)error;

#pragma mark -- QYSNativeExpressAdView 相关  --
/**
* 信息流广告渲染成功, 此时的 nativeExpressAdView.size.height 根据 size.width 完成了动态更新。
*/
- (void)quys_nativeExpressAdViewRenderSuccess:(QYSNativeExpressAdView *)nativeExpressAdView;
/**
 * 信息流广告渲染失败
 */
- (void)quys_nativeExpressAdViewRenderFail:(QYSNativeExpressAdView *)nativeExpressAdView;

/**
* 信息流广告曝光回调
*/
- (void)quys_nativeExpressAdViewExposured:(QYSNativeExpressAdView *)nativeExpressAdView;

/**
* 信息流广告点击回调
*/
- (void)quys_nativeExpressAdViewClicked:(QYSNativeExpressAdView *)nativeExpressAdView;

/**
* 信息流广告关闭回调
*/
- (void)quys_nativeExpressAdViewClosed:(QYSNativeExpressAdView *)nativeExpressAdView;

@end

NS_ASSUME_NONNULL_END
