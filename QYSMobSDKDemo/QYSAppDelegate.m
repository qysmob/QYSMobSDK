//
//  QYSAppDelegate.m
//  QYSMobSDKDemo
//
//  Created by quys on 2020/12/7.
//

#import "QYSAppDelegate.h"
#import "QYSAdViewController.h"
//#import <QYSMobSDK/QYSMobSDK.h>



@interface QYSAppDelegate ()
//<QYSSplashAdDelegate>
//
//@property (nonatomic, strong) QYSSplashAd *splashAd;

@end

@implementation QYSAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    QYSAdViewController *rootVC = [[QYSAdViewController alloc] init];
    self.nav = [[QYSBaseNavigationViewController alloc] initWithRootViewController:rootVC];
    self.nav.navigationBar.barStyle = UIBarStyleBlackOpaque;
//    self.nav.navigationBar.topItem.title = [NSString stringWithFormat:@"苏州纸影广告 ver %@",[QYSMobSDKConfig sdkVersion]];
    self.nav.navigationBar.translucent = NO;
    self.window.rootViewController = self.nav;
    [self.window makeKeyAndVisible];
    
    
    //SDK初始化
//    [QYSMobSDKConfig configWithAppId:kQuysMobSDKDemoAppId];
    
    //加载开屏广告
//    [self loadTheSplashAd];
    
    return YES;
}
//
//- (void)loadTheSplashAd{
//
//    //高度不宜超过屏幕的25%
//    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight * 0.25)];
//    bottomView.backgroundColor = kColorBackgroundColor;
//
//    UIImage *image = [UIImage imageNamed:@"qys_logo"];
//    UIImageView *logoView = [[UIImageView alloc] initWithImage:image];
//    logoView.contentMode =  UIViewContentModeScaleAspectFill;
//    logoView.frame = CGRectMake((bottomView.frame.size.width - 60) / 2, (bottomView.frame.size.height - 60) / 2, 60, 60);
//    [bottomView addSubview:logoView];
//
//    BOOL showBottomView = YES;
//
//    self.splashAd = [[QYSSplashAd alloc]initWithPlacementId:SPLASH_PLACEMENT_ID_STR];
//    self.splashAd.delegate = self;
//    if (showBottomView) {
//        self.splashAd.bottomView = bottomView;
//    }
//    self.splashAd.backgroundImage = [UIImage imageNamed:@"QysLaunchImage"];
//    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
//    [self.splashAd loadAdAndShowInWindow:window];
//}
//
//
//#pragma mark -- QYSSplashAdDelegate  --
///**
//* 广告请求成功回调
//*/
//- (void)quys_SplashRequestSuccess:(QYSSplashAd *)splashAd{
//    NSLog(@"%s", __func__);
//}
//
///**
//* 广告请求失败回调
//*/
//- (void)quys_SplashRequestFail:(QYSSplashAd *)splashAd error:(NSError*)error{
//    NSLog(@"%s，error=%@", __func__,error);
//}
//
///**
//* 广告曝光回调
//*/
//- (void)quys_SplashExposured:(QYSSplashAd *)splashAd{
//    NSLog(@"%s", __func__);
//}
//
///**
//* 广告点击回调
//*/
//- (void)quys_SplashClicked:(QYSSplashAd *)splashAd{
//    NSLog(@"%s", __func__);
//}
//
///**
//* 广告关闭回调
//*/
//- (void)quys_SplashClosed:(QYSSplashAd *)splashAd{
//    NSLog(@"%s", __func__);
//    self.splashAd = nil;
//}

@end
