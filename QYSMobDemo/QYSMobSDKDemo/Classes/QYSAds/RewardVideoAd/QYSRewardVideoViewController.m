//
//  QYSRewardVideoViewController.m
//  QYSMobSDKTest
//
//  Created by quys on 2020/10/19.
//  Copyright © 2020 Quys. All rights reserved.
//

#import "QYSRewardVideoViewController.h"
#import <QYSMobSDK/QYSMobSDK.h>

static NSString *REWARDVIDEO_STATUS_TEXT = @"激励视频状态";

@interface QYSRewardVideoViewController ()<QYSRewardVideoAdDelegate>


@property (weak, nonatomic) IBOutlet UITextView *statusTextView;

@property (nonatomic, assign) UIInterfaceOrientation supportOrientation;

//
@property (nonatomic, strong) QYSRewardVideoAd *rewardVideoAd;

@end

@implementation QYSRewardVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)dealloc {
    NSLog(@"%s",__FUNCTION__);
}

#pragma mark -- Action  --

//拉取激励视频
- (IBAction)loadVerticalAdAction:(id)sender {
    
    self.statusTextView.text = [NSString stringWithFormat:@"%@:%@",REWARDVIDEO_STATUS_TEXT,@"Start Loaded..."];
    
    self.rewardVideoAd = [[QYSRewardVideoAd alloc]initWithPlacementId:REWARDVIDEO_PLACEMENT_ID_STR];
    self.rewardVideoAd.delegate = self;
    [self.rewardVideoAd loadAd];
    
}

//播放激励视频
- (IBAction)showAdAction:(id)sender {
    
    if (self.rewardVideoAd.isAdValid) {
        [self.rewardVideoAd showAdFromRootViewController:self];
    }else{
        [QYSToast showMsg:@"广告未加载成功"];
    }

}

#pragma mark -- QYSRewardVideoAdDelegate  --
/**
* 广告请求成功回调
*/
- (void)quys_rewardVideoRequestSuccess:(QYSRewardVideoAd *)rewardVideoAd{
    NSLog(@"%s",__FUNCTION__);

    self.statusTextView.text = [NSString stringWithFormat:@"%@:%@",REWARDVIDEO_STATUS_TEXT,@"Success Loaded."];
}

/**
视频数据下载成功回调，已经下载过的视频会直接回调
*/
- (void)quys_rewardVideoAdVideoDidLoad:(QYSRewardVideoAd *)rewardVideoAd{
    NSLog(@"%s",__FUNCTION__);

    self.statusTextView.text = [NSString stringWithFormat:@"%@:%@",REWARDVIDEO_STATUS_TEXT,@"Video Download Success." ];
}

/**
* 广告各种错误信息回调
*/
- (void)quys_rewardVideoDidFail:(QYSRewardVideoAd*)rewardVideoAd error:(NSError*)error{
    NSLog(@"%s\n error = %@",__FUNCTION__,error);

    self.statusTextView.text = [NSString stringWithFormat:@"%@:%@,Error : %@",REWARDVIDEO_STATUS_TEXT,@"Fail Loaded.",error];
}

/**
* 广告曝光回调
*/
- (void)quys_rewardVideoExposured:(QYSRewardVideoAd *)rewardVideoAd{
    NSLog(@"%s",__FUNCTION__);
}

/**
* 广告点击回调
*/
- (void)quys_rewardVideoClicked:(QYSRewardVideoAd *)rewardVideoAd{
    NSLog(@"%s",__FUNCTION__);
}

/**
* 广告关闭回调
*/
- (void)quys_rewardVideoClosed:(QYSRewardVideoAd *)rewardVideoAd{
    NSLog(@"%s",__FUNCTION__);
    
    self.rewardVideoAd = nil;
    
    self.statusTextView.text = @"请重新拉取激励视频";
}

/**
* 广告开始播放回调
*/
- (void)quys_rewardVideoPlaystart:(QYSRewardVideoAd*)rewardVideoAd{
    NSLog(@"%s",__FUNCTION__);
}

/**
* 广告播放结束回调
*/
- (void)quys_rewardVideoPlayEnd:(QYSRewardVideoAd*)rewardVideoAd{
    NSLog(@"%s",__FUNCTION__);
}

/**
* 广告播放达到激励条件回调
*/
- (void)quys_rewardVideoDidRewardEffective:(QYSRewardVideoAd*)rewardVideoAd{
    NSLog(@"%s",__FUNCTION__);
}


@end
