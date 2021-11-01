//
//  QYSMobSDK.h
//  QYSMobSDK
//
//  Created by QYS on 2020/12/7.
//

#import <Foundation/Foundation.h>

//! Project version number for QYSMobSDK.
FOUNDATION_EXPORT double QYSMobSDKVersionNumber;

//! Project version string for QYSMobSDK.
FOUNDATION_EXPORT const unsigned char QYSMobSDKVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <QYSMobSDK/PublicHeader.h>

#if __has_include(<QYSMobSDK/QYSMobSDKConfig.h>)
//Config
#import <QYSMobSDK/QYSMobSDKConfig.h>

//Ads
#import <QYSMobSDK/QYSSplashAd.h>
#import <QYSMobSDK/QYSBannerView.h>
#import <QYSMobSDK/QYSInterstitialAd.h>
#import <QYSMobSDK/QYSNativeExpressAd.h>
#import <QYSMobSDK/QYSNativeExpressAdView.h>
#import <QYSMobSDK/QYSRewardVideoAd.h>

//Delegates
#import <QYSMobSDK/QYSSplashAdDelegate.h>
#import <QYSMobSDK/QYSBannerViewDelegate.h>
#import <QYSMobSDK/QYSInterstitialAdDelegate.h>
#import <QYSMobSDK/QYSNativeExpressAdDelegate.h>
#import <QYSMobSDK/QYSRewardVideoAdDelegate.h>

#else
//Config
#import "QYSMobSDKConfig.h"

//Ads
#import "QYSSplashAd.h"
#import "QYSBannerView.h"
#import "QYSInterstitialAd.h"
#import "QYSNativeExpressAd.h"
#import "QYSNativeExpressAdView.h"
#import "QYSRewardVideoAd.h"

//Delegates
#import "QYSSplashAdDelegate.h"
#import "QYSBannerViewDelegate.h"
#import "QYSInterstitialAdDelegate.h"
#import "QYSNativeExpressAdDelegate.h"
#import "QYSRewardVideoAdDelegate.h"

#endif


