//
//  QYSInterstitialAd.h
//  QYSMobSDK
//
//  Created by quys on 2020/11/2.
//  Copyright © 2020 Quys. All rights reserved.
//

#import <Foundation/Foundation.h>

#if __has_include(<QYSMobSDK/QYSInterstitialAdDelegate.h>)
    #import <QYSMobSDK/QYSInterstitialAdDelegate.h>
#else
    #import "QYSInterstitialAdDelegate.h"
#endif

NS_ASSUME_NONNULL_BEGIN
/**QYSSplashAdDelegate
*  插屏广告
*/
@interface QYSInterstitialAd : NSObject
/**
*  委托对象
*/
@property (nonatomic, weak) id <QYSInterstitialAdDelegate>delegate;

/**
*  构造方法
*  详解：placementId - 广告位 ID
*/
- (instancetype)initWithPlacementId:(NSString *)placementId;

/**
 * 返回广告是否可展示
 * @return 当广告已经加载完成且未曝光时，为YES，否则为NO
 */
- (BOOL)isAdValid;

/**
 *  加载广告方法，只拉取不展示
 */
- (void)loadAd;

/**
 *  展示广告方法
 *  详解：rootViewController 必须传入用于显示插播广告的UIViewController
 */
- (void)showAdFromRootViewController:(UIViewController *)rootViewController;


@end

NS_ASSUME_NONNULL_END
