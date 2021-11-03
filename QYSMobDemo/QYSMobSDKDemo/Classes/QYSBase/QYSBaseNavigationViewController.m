//
//  QYSBaseNavigationViewController.m
//  QYSMobSDKTest
//
//  Created by quys on 2020/10/19.
//  Copyright © 2020 Quys. All rights reserved.
//

#import "QYSBaseNavigationViewController.h"

@interface QYSBaseNavigationViewController ()<UINavigationControllerDelegate>

@end

@implementation QYSBaseNavigationViewController

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    if (self = [super initWithRootViewController:rootViewController]) {
        self.delegate = self;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if(self.viewControllers.count > 0) {
        //隐藏tabBar
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

- (void)setViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers {
    [viewControllers enumerateObjectsUsingBlock:^(UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx > 0) {
            obj.hidesBottomBarWhenPushed = YES;
        }
    }];
    
    [super setViewControllers:viewControllers];
}

- (void)setViewControllers:(NSArray<UIViewController *> *)viewControllers animated:(BOOL)animated {
    [viewControllers enumerateObjectsUsingBlock:^(UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx > 0) {
            obj.hidesBottomBarWhenPushed = YES;
        }
    }];
    
    [super setViewControllers:viewControllers animated:animated];
}


@end
