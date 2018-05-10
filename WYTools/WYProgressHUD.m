//
//  WYProgressHUD.m
//  DDRecycle
//
//  Created by wyman on 2017/12/9.
//  Copyright © 2017年 wyman. All rights reserved.
//

#import "WYProgressHUD.h"
#import "SVProgressHUD.h"
@implementation WYProgressHUD
#define  WY_SVProgressHUDStyle  SVProgressHUDStyleDark  //设置SVP类型
#define  WY_SVProgressHUDMaskType SVProgressHUDMaskTypeNone
+ (void)initialize
{
    [SVProgressHUD setSuccessImage:[UIImage imageNamed:@"WYTools.bundle/HUD_success"]];
    [SVProgressHUD setInfoImage:[UIImage imageNamed:@"WYTools.bundle/HUD_info"]];
    [SVProgressHUD setErrorImage:[UIImage imageNamed:@"WYTools.bundleHUD_error"]];
    
    [SVProgressHUD setDefaultMaskType:WY_SVProgressHUDMaskType];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD setCornerRadius:8.0];
}

+ (void)showDefault
{
//    [SVProgressHUD setDefaultMaskType:WY_SVProgressHUDMaskType];
//    [SVProgressHUD  setDefaultStyle:WY_SVProgressHUDStyle];
    [SVProgressHUD show];
}

+ (void)showWithStatus:(NSString *)status
{
    if (WYIsNull(status)) {
        status = @"正在加载";
    }
    [SVProgressHUD showWithStatus:status];
//    [SVProgressHUD setDefaultMaskType:WY_SVProgressHUDMaskType];
//    [SVProgressHUD  setDefaultStyle:WY_SVProgressHUDStyle];
}

+ (void)showSuccessWithStatus:(NSString *)status
{
    if (WYIsNull(status)) {
        status = @"成功了";
    }
    [SVProgressHUD setMinimumDismissTimeInterval:3];
    [SVProgressHUD showSuccessWithStatus:status];
//    [SVProgressHUD setDefaultMaskType:WY_SVProgressHUDMaskType];
//    [SVProgressHUD  setDefaultStyle:WY_SVProgressHUDStyle];
    
    
}

+ (void)showErrorWithStatus:(NSString *)status
{
    if (WYIsNull(status)) {
        status = @"失败了";
    }
    [SVProgressHUD setMinimumDismissTimeInterval:3];
//    [SVProgressHUD setDefaultMaskType:WY_SVProgressHUDMaskType];
//    [SVProgressHUD  setDefaultStyle:WY_SVProgressHUDStyle];
    [SVProgressHUD showErrorWithStatus:status];
    
}

+ (void)showWithProgress:(float)progress statu:(NSString *)status{
    [SVProgressHUD showProgress:progress status:status.length==0?@"请稍等":status];
}

+ (void)dismiss
{
    [SVProgressHUD  dismiss];
}


# pragma mark - Alert
+(void)showAlertTitle:(NSString *)title message:(NSString *)message preferredStyle:(WYAlertType)preferredStyle affirmHandler:(void (^)())affirmHandler cancelHandler:(void(^)())cancelHandler{
    
    if (preferredStyle == WYAlertType_Comfire) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:WYToString(title) preferredStyle:UIAlertControllerStyleAlert];
        __weak typeof(alert) weakAlert = alert;
        
        [weakAlert addAction:[UIAlertAction actionWithTitle:WYToString(message).length == 0 ?@"确定":WYToString(message)  style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
            if (affirmHandler) affirmHandler();
        }]];
        
        WYPresentViewController(alert, YES);
    }else{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:WYToString(title) preferredStyle:UIAlertControllerStyleAlert];
        __weak typeof(alert) weakAlert = alert;
        
        [weakAlert addAction:[UIAlertAction actionWithTitle:WYToString(message).length == 0 ?@"确定":WYToString(message)  style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
            if (affirmHandler) affirmHandler();
        }]];
        [weakAlert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            if(cancelHandler) cancelHandler();
        }]];
        WYPresentViewController(alert, YES);
    }
    
    
}

+(void)show:(NSString *)title message:(NSString *)message alertTitles:(NSArray *)titles handle:(completedHandle)handle{
    [WYAlertHUD show:title message:message alertTitles:titles handle:handle];
}

@end
