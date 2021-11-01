//
//  QYSBannerViewDelegate.h
//  QYSMobSDK
//
//  Created by quys on 2020/11/2.
//  Copyright © 2020 Quys. All rights reserved.
//

#import <Foundation/Foundation.h>
@class QYSBannerView;

NS_ASSUME_NONNULL_BEGIN
/**
* Banner广告协议
*/
@protocol QYSBannerViewDelegate <NSObject>

@optional

/**
* 广告请求成功回调
*/
- (void)quys_BannerRequestSuccess:(QYSBannerView *)bannerView;

/**
* 广告请求失败回调
*/
- (void)quys_BannerRequestFail:(QYSBannerView *)bannerView error:(NSError*)error;

/**
* 广告曝光回调
*/
- (void)quys_BannerExposured:(QYSBannerView *)bannerView;

/**
* 广告点击回调
*/
- (void)quys_BannerClicked:(QYSBannerView *)bannerView;

/**
* 广告关闭回调
*/
- (void)quys_BannerClosed:(QYSBannerView *)bannerView;


@end

NS_ASSUME_NONNULL_END
