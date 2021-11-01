//
//  QYSSplashAd.h
//  QYSMobSDK
//
//  Created by quys on 2020/11/2.
//  Copyright © 2020 Quys. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#if __has_include(<QYSMobSDK/QYSSplashAdDelegate.h>)
    #import <QYSMobSDK/QYSSplashAdDelegate.h>
#else
    #import "QYSSplashAdDelegate.h"
#endif

NS_ASSUME_NONNULL_BEGIN
/**
*  开屏广告
*/
@interface QYSSplashAd : NSObject
/**
*  委托对象
*/
@property (nonatomic, weak) id <QYSSplashAdDelegate>delegate;

/**
*  构造方法
*  详解：placementId - 广告位 ID
*/
- (instancetype)initWithPlacementId:(NSString *)placementId;

/**
 *  拉取广告超时时间，默认为5秒
 *详解：拉取广告超时时间，开发者调用loadAd方法以后会立即展示backgroundImage，然后在该超时时间内，如果广告拉取成功，则立马展示开屏广告，否则放弃此次广告展示机会。
 */
@property (nonatomic, assign) CGFloat fetchDelay;

/**
 *  开屏广告的背景图片
 *  可以设置背景图片作为开屏加载时的默认背景（部分广告支持）
 */
@property (nonatomic, strong) UIImage *backgroundImage;

/**
 *  自定义底部视图
 *  设置开屏底部自定义LogoView，展示半屏开屏广告
 *  logo的高度建议不要过高，以免影响广告的展示效果。 高度上限：屏幕高度*25%
 */
@property (nonatomic, strong) UIView *bottomView;

/**
 * 返回广告是否可展示
 * @return 当广告已经加载完成且未曝光时，为YES，否则为NO
 */
- (BOOL)isAdValid;

/**
 *  拉取并展示广告
 *  window 展示开屏的容器
 */
- (void)loadAdAndShowInWindow:(UIWindow *)window;

@end

NS_ASSUME_NONNULL_END
