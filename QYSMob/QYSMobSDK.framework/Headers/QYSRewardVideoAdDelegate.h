//
//  QYSRewardVideoAdDelegate.h
//  QYSMobSDK
//
//  Created by quys on 2020/11/2.
//  Copyright © 2020 Quys. All rights reserved.
//

#import <Foundation/Foundation.h>
@class QYSRewardVideoAd;

NS_ASSUME_NONNULL_BEGIN
/**
* 激励视频广告协议
*/
@protocol QYSRewardVideoAdDelegate <NSObject>

@optional
/**
* 广告请求成功回调
*/
- (void)quys_rewardVideoRequestSuccess:(QYSRewardVideoAd *)rewardVideoAd;

/**
视频数据下载成功回调，已经下载过的视频会直接回调
*/
- (void)quys_rewardVideoAdVideoDidLoad:(QYSRewardVideoAd *)rewardVideoAd;

/**
* 广告各种错误信息回调
*/
- (void)quys_rewardVideoDidFail:(QYSRewardVideoAd*)rewardVideoAd error:(NSError*)error;

/**
* 广告曝光回调
*/
- (void)quys_rewardVideoExposured:(QYSRewardVideoAd *)rewardVideoAd;

/**
* 广告点击回调
*/
- (void)quys_rewardVideoClicked:(QYSRewardVideoAd *)rewardVideoAd;

/**
* 广告关闭回调
*/
- (void)quys_rewardVideoClosed:(QYSRewardVideoAd *)rewardVideoAd;

/**
* 广告开始播放回调
*/
- (void)quys_rewardVideoPlaystart:(QYSRewardVideoAd*)rewardVideoAd;

/**
* 广告播放结束回调
*/
- (void)quys_rewardVideoPlayEnd:(QYSRewardVideoAd*)rewardVideoAd;

/**
* 广告播放达到激励条件回调
*/
- (void)quys_rewardVideoDidRewardEffective:(QYSRewardVideoAd*)rewardVideoAd;

@end

NS_ASSUME_NONNULL_END
