//
//  main.m
//  QYSMobSDKDemo
//
//  Created by quys on 2021/11/3.
//

#import <UIKit/UIKit.h>
#import "QYSAppDelegate.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([QYSAppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
