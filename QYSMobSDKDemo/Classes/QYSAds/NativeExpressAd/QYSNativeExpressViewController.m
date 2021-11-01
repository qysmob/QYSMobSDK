//
//  QYSNativeExpressViewController.m
//  QYSMobSDKTest
//
//  Created by quys on 2020/10/19.
//  Copyright © 2020 Quys. All rights reserved.
//

#import "QYSNativeExpressViewController.h"
#import <QYSMobSDK/QYSMobSDK.h>

static NSString *const kNativeExpressCellIdentify = @"nativeexpresscell";
static NSString *const kSplitNativeExpressCellIdentify = @"splitnativeexpresscell";

@interface QYSNativeExpressViewController ()<UITableViewDelegate, UITableViewDataSource,QYSNativeExpressAdDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;
@property (weak, nonatomic) IBOutlet UISlider *countSlider;

//一次性加载广告的数量
@property (nonatomic, assign) NSInteger adCount;
//获取到的信息流广告时图数组
@property (nonatomic, strong) NSMutableArray *expressAdViews;

@property (nonatomic, strong) QYSNativeExpressAd *nativeExpressAd;

@end

@implementation QYSNativeExpressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kNativeExpressCellIdentify];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kSplitNativeExpressCellIdentify];
    
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, CGFLOAT_MIN)];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, CGFLOAT_MIN)];
    
    self.adCount = 1;
    
    [self loadAdAction:nil];
}

- (void)dealloc {
    NSLog(@"%s",__FUNCTION__);
}

#pragma mark -- Action  --

- (IBAction)sliderCountDurationChanged:(id)sender {
    self.adCount = roundf(self.countSlider.value);
    self.countLabel.text = [NSString stringWithFormat:@"Count: %ld",_adCount];
}

//新增广告数据
- (IBAction)loadAdAction:(id)sender {
    if (_expressAdViews.count > 0) {
        [self.expressAdViews removeAllObjects];
        [self.tableView reloadData];
    }

    self.nativeExpressAd = [[QYSNativeExpressAd alloc]initWithPlacementId:NATIVEEXPRESS_PLACEMENT_ID_STR adSize:CGSizeMake(kScreenWidth, 0)];
    self.nativeExpressAd.delegate = self;
    
    [self.nativeExpressAd loadAd:_adCount];
    
    
}

#pragma mark -- UITableViewDelegate  --
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.expressAdViews.count*2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row % 2 == 0) {
        //渲染成功 Frame 也会有变化 实时拿View最新的高度
        QYSNativeExpressAdView *view = [self.expressAdViews objectAtIndex:indexPath.row/2];
        return view.bounds.size.height;
    }
    else {
        return 10;
    }

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;
    if (indexPath.row % 2 == 0) {
        cell = [self.tableView dequeueReusableCellWithIdentifier:kNativeExpressCellIdentify forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        UIView *subView = (UIView *)[cell.contentView viewWithTag:1000];
        if ([subView superview]) {
            [subView removeFromSuperview];
            subView = nil;
        }
        QYSNativeExpressAdView *view = [self.expressAdViews objectAtIndex:indexPath.row/2];
        view.tag = 1000;
        [cell.contentView addSubview:view];
        cell.accessibilityIdentifier = @"nativeTemp_even_ad";
    }else{
        cell = [self.tableView dequeueReusableCellWithIdentifier:kSplitNativeExpressCellIdentify forIndexPath:indexPath];
        cell.backgroundColor = [UIColor grayColor];
        cell.accessibilityIdentifier = @"nativeTemp_odd_ad";
        cell.contentView.backgroundColor = kColorTheme;//kRandomColor
    }

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

#pragma mark -- QYSNativeExpressAdDelegate  --
/**
 * 信息流广告请求成功回调
 */
- (void)quys_nativeExpressRequestSuccess:(QYSNativeExpressAd *)nativeExpressAd views:(NSArray<__kindof QYSNativeExpressAdView *> *)views{
    NSLog(@"%s",__FUNCTION__);
    [self.expressAdViews removeAllObjects];//【重要】不能保存太多view，需要在合适的时机手动释放不用的，否则内存会过大
    [self.expressAdViews addObjectsFromArray:views];
    if (views.count) {
        [views enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            QYSNativeExpressAdView *expressView = (QYSNativeExpressAdView *)obj;
            expressView.controller = self;
            [expressView render];
        }];
    }
    [self.tableView reloadData];
}

/**
 * 信息流广告请求失败回调
 */
- (void)quys_nativeExpressRequestFail:(QYSNativeExpressAd *)nativeExpressAd error:(NSError*)error{
    NSLog(@"%s\n error = %@",__FUNCTION__,error);
    [QYSToast showMsg:error.localizedDescription];
}

/**
 * 信息流广告渲染成功, 此时的 nativeExpressAdView.size.height 根据 size.width 完成了动态更新。
 */
- (void)quys_nativeExpressAdViewRenderSuccess:(QYSNativeExpressAdView *)nativeExpressAdView{
    NSLog(@"%s",__FUNCTION__);
    
    [self.tableView reloadData];
}
/**
 * 信息流广告渲染失败
 */
- (void)quys_nativeExpressAdViewRenderFail:(QYSNativeExpressAdView *)nativeExpressAdView{
    NSLog(@"%s",__FUNCTION__);
    
    [self.expressAdViews removeObject:nativeExpressAdView];
    
    [self.tableView reloadData];

}

/**
 * 信息流广告曝光回调
 */
- (void)quys_nativeExpressAdViewExposured:(QYSNativeExpressAdView *)nativeExpressAdView{
    NSLog(@"%s",__FUNCTION__);
}

/**
 * 信息流广告点击回调
 */
- (void)quys_nativeExpressAdViewClicked:(QYSNativeExpressAdView *)nativeExpressAdView{
    NSLog(@"%s",__FUNCTION__);
}

/**
 * 信息流广告关闭回调
 */
- (void)quys_nativeExpressAdViewClosed:(QYSNativeExpressAdView *)nativeExpressAdView{
    NSLog(@"%s",__FUNCTION__);
    
    [self.expressAdViews removeObject:nativeExpressAdView];
    [self.tableView reloadData];
}

#pragma mark -- Init  --
- (NSMutableArray *)expressAdViews
{
    if (!_expressAdViews) {
        _expressAdViews = [[NSMutableArray alloc]init];
    }
    return _expressAdViews;
}

@end
