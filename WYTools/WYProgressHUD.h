//
//  WYProgressHUD.h
//  DDRecycle
//
//  Created by wyman on 2017/12/9.
//  Copyright © 2017年 wyman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WYAlertHUD.h"
typedef NS_ENUM(NSInteger, WYAlertType){//供扩展
    WYAlertType_System = 0,//系统默认的alertController
    WYAlertType_DingDong , //叮咚风格的alert
    WYAlertType_Comfire //只有一个确定
    
};
@interface WYProgressHUD : NSObject

+ (void)showDefault;

+ (void)showWithStatus:(NSString *)status;

+ (void)showSuccessWithStatus:(NSString *)status;

+ (void)showErrorWithStatus:(NSString *)status;

+ (void)showWithProgress:(float)progress statu:(NSString *)status;

+ (void)dismiss;


/**
 两个选项的选择弹框
 
 @param title 标题
 @param message 确定的titleLabel
 @param preferredStyle 弹框风格
 @param affirmHandler 确定回调
 @param cancelHandler 取消回调
 */
+(void)showAlertTitle:(NSString *)title message:(NSString *)message preferredStyle:(WYAlertType)preferredStyle affirmHandler:(void (^)())affirmHandler cancelHandler:(void(^)())cancelHandler;



+(void)show:(NSString *)title message:(NSString *)message alertTitles:(NSArray *)titles handle:(completedHandle)handle;

@end
