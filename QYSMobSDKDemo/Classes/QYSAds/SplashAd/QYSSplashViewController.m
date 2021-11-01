//
//  QYSSplashViewController.m
//  QuysMobSDKTest
//
//  Created by quys on 2020/11/3.
//  Copyright © 2020 Quys. All rights reserved.
//

#import "QYSSplashViewController.h"
#import <QYSMobSDK/QYSMobSDK.h>

static NSString *SPLASH_STATUS_TEXT = @"开屏状态";

@interface QYSSplashViewController ()<QYSSplashAdDelegate>


@property (weak, nonatomic) IBOutlet UITextView *statusTextView;

@property (weak, nonatomic) IBOutlet UIButton *showButton;

@property (nonatomic, strong) QYSSplashAd *splashAd;

@end

@implementation QYSSplashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)dealloc {
    NSLog(@"%s",__FUNCTION__);
}

#pragma mark -- Action  --

//加载全屏开屏
- (IBAction)loadFullAction:(id)sender {
    
    [self loadAd:nil];
    
}

//加载半屏开屏 部分广告不支持半屏加载
- (IBAction)loadHalfAction:(id)sender {
    //高度不宜超过屏幕的25%
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight * 0.25)];
    bottomView.backgroundColor = kColorBackgroundColor;
    UIImage *image = [UIImage imageNamed:@"qys_logo"];
    UIImageView *logoView = [[UIImageView alloc] initWithImage:image];
    logoView.contentMode =  UIViewContentModeScaleAspectFill;
    logoView.frame = CGRectMake((bottomView.frame.size.width - 60) / 2, (bottomView.frame.size.height - 60) / 2, 60, 60) ;
    [bottomView addSubview:logoView];
    
    [self loadAd:bottomView];
}

- (void)loadAd:(UIView *)bottomView {
    if (_splashAd) {
        _splashAd = nil;
    }
    self.statusTextView.text = [NSString stringWithFormat:@"%@:%@",SPLASH_STATUS_TEXT,@"Start Loaded...." ];
    
    self.splashAd = [[QYSSplashAd alloc]initWithPlacementId:SPLASH_PLACEMENT_ID_STR];
    self.splashAd.delegate = self;
    if (bottomView) {
        self.splashAd.bottomView = bottomView;
    }
    self.splashAd.backgroundImage = [UIImage imageNamed:@"QysLaunchImage"];
    self.splashAd.fetchDelay = 5.0;
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    [self.splashAd loadAdAndShowInWindow:window];

}


#pragma mark -- QYSSplashAdDelegate  --
/**
 * 广告请求成功回调
 */
- (void)quys_SplashRequestSuccess:(QYSSplashAd *)splashAd{
    NSLog(@"%s", __FUNCTION__);
    self.statusTextView.text = [NSString stringWithFormat:@"%@:%@",SPLASH_STATUS_TEXT,@"Success Loaded..."];
}

/**
 * 广告请求失败回调
 */
- (void)quys_SplashRequestFail:(QYSSplashAd *)splashAd error:(NSError*)error{
    NSLog(@"%s\n error = %@",__FUNCTION__,error);
    self.statusTextView.text = [NSString stringWithFormat:@"%@:%@,Error : %@",SPLASH_STATUS_TEXT,@"Fail Loaded.",error ];
}

/**
 * 广告曝光回调
 */
- (void)quys_SplashExposured:(QYSSplashAd *)splashAd{
    NSLog(@"%s", __FUNCTION__);
}

/**
 * 广告点击回调
 */
- (void)quys_SplashClicked:(QYSSplashAd *)splashAd{
    NSLog(@"%s", __FUNCTION__);
}

/**
 * 广告关闭回调
 */
- (void)quys_SplashClosed:(QYSSplashAd *)splashAd{
    NSLog(@"%s", __FUNCTION__);
    self.splashAd.delegate = nil;
    self.splashAd = nil;
    
    self.statusTextView.text = [NSString stringWithFormat:@"%@:%@\n请重新加载",SPLASH_STATUS_TEXT,@"Closed." ];
    
}


@end
