//
//  QYSNativeExpressAd.h
//  QYSMobSDK
//
//  Created by quys on 2020/11/2.
//  Copyright © 2020 Quys. All rights reserved.
//

#import <Foundation/Foundation.h>

#if __has_include(<QYSMobSDK/QYSNativeExpressAdDelegate.h>)
    #import <QYSMobSDK/QYSNativeExpressAdDelegate.h>
#else
    #import "QYSNativeExpressAdDelegate.h"
#endif

NS_ASSUME_NONNULL_BEGIN
/**
*  信息流广告
*/
@interface QYSNativeExpressAd : NSObject
/**
*  委托对象
*/
@property (nonatomic, weak) id <QYSNativeExpressAdDelegate>delegate;

/**
 *  构造方法
 *  详解：placementId - 广告位 ID
 *           adSize - 广告展示的宽高  当 height = 0，自动根据 width 算高；
 */

- (instancetype)initWithPlacementId:(NSString *)placementId adSize:(CGSize)size;

/**
*  加载广告方法，只拉取不展示
*  count 一次性加载的广告数量 (实际拿到的广告数量有机率小于count)
*/
- (void)loadAd:(NSInteger)count;

@end

NS_ASSUME_NONNULL_END
