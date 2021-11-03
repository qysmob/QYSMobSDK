//
//  QYSAdViewController.m
//  QYSMobSDKTest
//
//  Created by quys on 2020/10/19.
//  Copyright © 2020 Quys. All rights reserved.
//

#import "QYSAdViewController.h"
#import <objc/runtime.h>
#import <QYSMobSDK/QYSMobSDK.h>

#import <AppTrackingTransparency/AppTrackingTransparency.h>
#import <AdSupport/ASIdentifierManager.h>


@interface QYSAdViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *demoArray;

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation QYSAdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    self.tableView.frame = self.view.bounds;

}


#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.demoArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kScale_W(80);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SimpleTableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SimpleTableIdentifier];
        cell.textLabel.font = kFont(16);
        cell.textLabel.textColor = kColorTitle;
        cell.backgroundColor = kColorWhite;
    }
    cell.textLabel.text = self.demoArray[indexPath.row][0];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    id item = self.demoArray[indexPath.row][1];
    
    if ([item isEqual:@"idfa"]) {
        NSString *idfa = [self qys_idfa];
        NSString *idfaCopyedMsg = [NSString stringWithFormat:@"%@\n",idfa];
        if (idfa.length > 0) {
            idfaCopyedMsg = [NSString stringWithFormat:@"%@\n已经复制到你的粘贴板",idfa];
            UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
            pasteboard.string = idfa;
            
            UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:idfaCopyedMsg message:nil preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) { }];
            [actionSheet addAction:cancel];
            [self presentViewController:actionSheet animated:YES completion:nil];
        }else{
            [QYSToast showMsg:@"获取IDFA失败"];
        }
        return;;
    }
    
    if ([item isKindOfClass:[NSString class]]) {
        UIViewController *vc = [[NSClassFromString(item) alloc] init];
        vc.title = self.demoArray[indexPath.row][0];
        [self.navigationController pushViewController:vc animated:YES];
    }
}


/// 获取IDFA
- (NSString*)qys_idfa
{
    __block NSString *strUniqueID = [[ASIdentifierManager sharedManager].advertisingIdentifier UUIDString];
    //未获取到 00000000-0000-0000-0000-000000000000
    if (@available(iOS 14, *)) {
        // iOS14及以上版本需要先请求权限
        [ATTrackingManager requestTrackingAuthorizationWithCompletionHandler:^(ATTrackingManagerAuthorizationStatus status) {
            // 获取到权限后，依然使用老方法获取idfa
            if (status == ATTrackingManagerAuthorizationStatusAuthorized) {
                strUniqueID = [[ASIdentifierManager sharedManager].advertisingIdentifier UUIDString];
            } else {
                NSLog(@"请在设置-隐私-跟踪中打开广告跟踪功能");
            }
        }];
        
    } else {
        // iOS14以下版本依然使用老方法
        // 判断在设置-隐私里用户是否打开了广告跟踪
        if ([[ASIdentifierManager sharedManager] isAdvertisingTrackingEnabled]) {
            strUniqueID = [[ASIdentifierManager sharedManager].advertisingIdentifier UUIDString];
        } else {
            NSLog(@"请在设置-隐私-广告中打开广告跟踪功能");
        }
    }
    
    return  strUniqueID;
}


#pragma mark - property getter
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _tableView.backgroundColor = kColorWhite;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.accessibilityIdentifier = @"tableView_id";
        _tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
        _tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, CGFLOAT_MIN)];
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, CGFLOAT_MIN)];
        [_tableView setSeparatorColor:kColorTheme];
    }
    return _tableView;
}

- (NSMutableArray *)demoArray{
    if (!_demoArray) {
        _demoArray = [@[
            @[@"开屏广告", @"QYSSplashViewController"],
            @[@"Banner广告", @"QYSBannerViewController"],
            @[@"插屏广告", @"QYSInterstitialViewController"],
            @[@"信息流广告", @"QYSNativeExpressViewController"],
            @[@"激励视频广告", @"QYSRewardVideoViewController"],
            @[@"获取IDFA", @"idfa"],
        ] mutableCopy];
    }
    return _demoArray;
}

@end
