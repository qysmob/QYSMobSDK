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

        [self setNavigationBackgroundColor:kColorTheme];
        
    }
    
    return self;
}

/// 设置导航栏颜色
-(void)setNavigationBackgroundColor:(UIColor *)color{
    NSDictionary *dic = @{NSForegroundColorAttributeName : [UIColor whiteColor],
                              NSFontAttributeName : [UIFont systemFontOfSize:18]};
    
    if (@available(iOS 15.0, *)) {
        // 滚动状态
        UINavigationBarAppearance *appearance = [[UINavigationBarAppearance alloc] init];
        // 设置为不透明
        appearance.backgroundEffect = nil;
        appearance.backgroundImage = [self zt_imageWithPureColor:color];
        appearance.shadowColor = color;
        appearance.backgroundColor = color;

        // 静止状态
        UINavigationBarAppearance *appearance2 = [[UINavigationBarAppearance alloc] init];
        // 设置为不透明
        appearance2.backgroundEffect = nil;
        appearance2.backgroundImage = [self zt_imageWithPureColor:color];
        appearance2.shadowColor = color;
        appearance2.backgroundColor = color;

        self.navigationBar.scrollEdgeAppearance = appearance;
        self.navigationBar.standardAppearance = appearance2;
    }else{
        self.navigationBar.titleTextAttributes = dic;
        [self.navigationBar setShadowImage:[[UIImage alloc] init]];
        [self.navigationBar setBackgroundImage:[self zt_imageWithPureColor:color] forBarMetrics:UIBarMetricsDefault];
    }
}

- (UIImage *)zt_imageWithPureColor:(UIColor *)color {
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(3, 3), NO, [UIScreen mainScreen].scale);
    UIBezierPath* p = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 3, 3)];
    [color setFill];
    [p fill];
    UIImage* img = UIGraphicsGetImageFromCurrentImageContext();
    return img;
}
- (UIImage *)zt_imageWithPureColor:(UIColor *)color size:(CGSize )size{
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    UIBezierPath* p = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, size.width, size.height)];
    [color setFill];
    [p fill];
    UIImage* img = UIGraphicsGetImageFromCurrentImageContext();
    return img;
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
    [viewControllers enumerateObjectsUsingBlock:^(UIViewController * _Nonnull obj, NSUInteger idx, BOOL * stop) {
        if (idx > 0) {
            obj.hidesBottomBarWhenPushed = YES;
        }
    }];
    
    [super setViewControllers:viewControllers];
}

- (void)setViewControllers:(NSArray<UIViewController *> *)viewControllers animated:(BOOL)animated {
    [viewControllers enumerateObjectsUsingBlock:^(UIViewController * _Nonnull obj, NSUInteger idx, BOOL * stop) {
        if (idx > 0) {
            obj.hidesBottomBarWhenPushed = YES;
        }
    }];
    
    [super setViewControllers:viewControllers animated:animated];
}


@end
