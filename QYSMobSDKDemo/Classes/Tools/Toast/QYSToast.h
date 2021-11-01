//
//  QYSToast.h
//  QuysMobSDKTest
//
//  Created by quys on 2020/11/27.
//  Copyright © 2020 Quys. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QYSToast : NSObject
+ (void) showSuccess:(NSString*) title msg:(NSString*) msg;
+ (void) showError:(NSString*) title msg:(NSString*) msg;
+ (void) showMsg:(NSString*) msg;
@end

NS_ASSUME_NONNULL_END
