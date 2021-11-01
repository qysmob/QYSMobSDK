//
//  QYSBannerViewController.m
//  QYSMobSDKTest
//
//  Created by quys on 2020/10/19.
//  Copyright © 2020 Quys. All rights reserved.
//

#import "QYSBannerViewController.h"
#import <QYSMobSDK/QYSMobSDK.h>

@interface QYSBannerViewController ()<QYSBannerViewDelegate>
//
@property (nonatomic, strong) QYSBannerView *bannerView;

@end

@implementation QYSBannerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)dealloc {
    NSLog(@"%s",__FUNCTION__);
}

#pragma mark -- Action  --

//展示Banner广告
- (IBAction)showAdAction:(id)sender {

    [self removeAdAction:nil];

    //Banner 比例 640:100
    self.bannerView = [[QYSBannerView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenWidth * 100 / 640) placementId:BANNER_PLACEMENT_ID_STR rootViewController:self];
    self.bannerView.delegate = self;
    [self.view addSubview:self.bannerView];
    [self.bannerView loadAdAndShow];

}

//移除Banner广告
- (IBAction)removeAdAction:(id)sender {
    if (_bannerView) {
        [self.bannerView removeFromSuperview];
        self.bannerView = nil;
    }
}

#pragma mark -- QYSBannerViewDelegate  --
/**
* 广告请求成功回调
*/
- (void)quys_BannerRequestSuccess:(QYSBannerView *)bannerView{
    NSLog(@"%s", __FUNCTION__);
}

/**
* 广告请求失败回调
*/
- (void)quys_BannerRequestFail:(QYSBannerView *)bannerView error:(NSError*)error{
    NSLog(@"%s\n error = %@",__FUNCTION__,error);
    [QYSToast showMsg:error.localizedDescription];
}

/**
* 广告曝光回调
*/
- (void)quys_BannerExposured:(QYSBannerView *)bannerView{
    NSLog(@"%s", __FUNCTION__);
}

/**
* 广告点击回调
*/
- (void)quys_BannerClicked:(QYSBannerView *)bannerView{
    NSLog(@"%s", __FUNCTION__);
}

/**
* 广告关闭回调
*/
- (void)quys_BannerClosed:(QYSBannerView *)bannerView{
    NSLog(@"%s", __FUNCTION__);
    self.bannerView = nil;
}


@end
