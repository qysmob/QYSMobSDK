//
//  QYSMobSDKConfig.h
//  QYSMobSDK
//
//  Created by quys on 2020/10/30.
//  Copyright © 2020 Quys. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN



/**
 *  SDK配置信息
 */
@interface QYSMobSDKConfig : NSObject

/**
 SDK 注册接口，请在 app 初始化时调用。
 @param appId - 应用appId
*/
+ (void)configWithAppId:(NSString*)appId;

/**
 * 获取 SDK 版本
 */
+ (NSString *)sdkVersion;

/**
 SDK 设置广告请求超时时间
 @param timeoutInterval - 超时时间 默认 90.0s
*/
+ (void)setTheTimeoutInterval:(CGFloat)timeoutInterval;

@end

NS_ASSUME_NONNULL_END
