//
//  QYSInterstitialViewController.m
//  QYSMobSDKTest
//
//  Created by quys on 2020/10/19.
//  Copyright © 2020 Quys. All rights reserved.
//

#import "QYSInterstitialViewController.h"
#import <QYSMobSDK/QYSMobSDK.h>

static NSString *INTERSTITIAL_STATUS_TEXT = @"插屏状态";

@interface QYSInterstitialViewController ()<QYSInterstitialAdDelegate>

@property (weak, nonatomic) IBOutlet UITextView *statusTextView;

//
@property (nonatomic, strong) QYSInterstitialAd *interstitialAd;

@end

@implementation QYSInterstitialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

}

- (void)dealloc {
    NSLog(@"%s",__FUNCTION__);
}

#pragma mark -- Action  --
//加载插屏广告
- (IBAction)loadAdAction:(id)sender {
    if (_interstitialAd) {
        self.interstitialAd = nil;
    }
    
    self.statusTextView.text = [NSString stringWithFormat:@"%@:%@",INTERSTITIAL_PLACEMENT_ID_STR,@"Start Loaded..."];

    self.interstitialAd = [[QYSInterstitialAd alloc]initWithPlacementId:INTERSTITIAL_PLACEMENT_ID_STR];
    self.interstitialAd.delegate = self;
    [self.interstitialAd loadAd];
}

//展示插屏广告
- (IBAction)showAdAction:(id)sender {
    if ([self.interstitialAd isAdValid]) {
        [self.interstitialAd showAdFromRootViewController:self];
    }else{
        [QYSToast showMsg:@"广告未加载成功"];
    }
}

#pragma mark -- QYSInterstitialAdDelegate  --
/**
* 广告请求成功回调
*/
- (void)quys_InterstitialRequestSuccess:(QYSInterstitialAd *)interstitialAd{
    NSLog(@"%s", __FUNCTION__);
    self.statusTextView.text = [NSString stringWithFormat:@"%@:%@",INTERSTITIAL_STATUS_TEXT,@"Success Loaded."];
}

/**
* 广告请求失败回调
*/
- (void)quys_InterstitialRequestFail:(QYSInterstitialAd *)interstitialAd error:(NSError*)error{
    NSLog(@"%s\n error = %@",__FUNCTION__,error);
    
    self.statusTextView.text = [NSString stringWithFormat:@"%@:%@,Error : %@",INTERSTITIAL_STATUS_TEXT,@"Fail Loaded.",error];
}

/**
* 广告曝光回调
*/
- (void)quys_InterstitialExposured:(QYSInterstitialAd *)interstitialAd{
    NSLog(@"%s", __FUNCTION__);
}

/**
* 广告点击回调
*/
- (void)quys_InterstitialClicked:(QYSInterstitialAd *)interstitialAd{
    NSLog(@"%s", __FUNCTION__);
}

/**
* 广告关闭回调
*/
- (void)quys_InterstitialClosed:(QYSInterstitialAd *)interstitialAd{
    NSLog(@"%s", __FUNCTION__);
    
    self.statusTextView.text = [NSString stringWithFormat:@"%@:%@\n请重新加载",INTERSTITIAL_STATUS_TEXT,@"Closed." ];
}


@end
