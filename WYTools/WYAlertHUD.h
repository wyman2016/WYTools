//
//  WYAlertHUD.h
//  WYProgressHUD
//
//  Created by wyman on 2017/12/22.
//  Copyright © 2017年 wyman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DDPublicFunctions.h"
typedef  void(^completedHandle)(NSInteger index);

@interface WYAlertHUD : UIView
+(void)show:(NSString *)title message:(NSString *)message alertTitles:(NSArray *)titles handle:(completedHandle)handle;

@end
