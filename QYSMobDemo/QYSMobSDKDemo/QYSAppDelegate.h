//
//  AppDelegate.h
//  QYSMobSDKDemo
//
//  Created by quys on 2021/11/3.
//

#import <UIKit/UIKit.h>
#import "QYSBaseNavigationViewController.h"

@interface QYSAppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic,strong) UIWindow *window;

@property(nonatomic,strong) QYSBaseNavigationViewController *nav;

@end

