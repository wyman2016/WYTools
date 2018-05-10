//
//  DDPublicFunctions.h
//
//
//  Created by Wyman on 2017/5/16.
//  Copyright © 2017年 Wyman All rights reserved.
//

#import "DDPublicFunctions.h"
#define iPhone4S           [[UIScreen mainScreen] bounds].size.width == 320.0f && [[UIScreen mainScreen] bounds].size.height == 480.0f
#define iPhone5SE           [[UIScreen mainScreen] bounds].size.width == 320.0f && [[UIScreen mainScreen] bounds].size.height == 568.0f
#define iPhone6_6s          [[UIScreen mainScreen] bounds].size.width == 375.0f && [[UIScreen mainScreen] bounds].size.height == 667.0f
#define iPhone6Plus_6sPlus  [[UIScreen mainScreen] bounds].size.width == 414.0f && [[UIScreen mainScreen] bounds].size.height == 736.0f
UIWindow *mainWindow() {
    id appDelegate = [UIApplication sharedApplication].delegate;
    if (appDelegate && [appDelegate respondsToSelector:@selector(window)]) {
        return [appDelegate window];
    }
    
    NSArray *windows = [UIApplication sharedApplication].windows;
    if ([windows count] == 1) {
        return [windows firstObject];
    }
    else {
        for (UIWindow *window in windows) {
            if (window.windowLevel == UIWindowLevelNormal) {
                return window;
            }
        }
    }
    return nil;
}

UIViewController *topMostViewController() {
    UIViewController *topViewController = mainWindow().rootViewController;
    UIViewController *temp = nil;
    while (YES) {
        temp = nil;
        if ([topViewController isKindOfClass:[UINavigationController class]]) {
            temp = ((UINavigationController *)topViewController).visibleViewController;
            
        } else if ([topViewController isKindOfClass:[UITabBarController class]]) {
            temp = ((UITabBarController *)topViewController).selectedViewController;
        }
        else if (topViewController.presentedViewController != nil) {
            temp = topViewController.presentedViewController;
        }
        
        if (temp != nil) {
            topViewController = temp;
        } else {
            break;
        }
    }
    return topViewController;
}

void WYPushViewController (UIViewController *vc,BOOL animated)
{
    if (!vc || ![vc isKindOfClass:[UIViewController class]]) return;
    vc.hidesBottomBarWhenPushed = YES;
    [topMostViewController().navigationController pushViewController:vc animated:animated];
}

void WYPresentViewController (UIViewController *vc,BOOL animated)
{
    if (!vc) return;
    [topMostViewController().navigationController presentViewController:vc animated:animated completion:^{
        
    }];
}

float WYFitValue(float value)
{
    

    if ((iPhone5SE) || (iPhone4S))         return value / 375.0 * 320.0;
    if (iPhone6_6s)                                    return value;
    if (iPhone6Plus_6sPlus)                      return   value / 375.0 * 414.f;
    return value;
}


/**
 *  数据校验
 */
NSString* WYToString(id obj) {
    return [obj isKindOfClass:[NSObject class]]?[NSString stringWithFormat:@"%@",obj]:@"";
}

NSArray* WYToArray(id obj)  {
    return [obj isKindOfClass:[NSArray class]]?obj:nil;
}

NSDictionary* WYToDictionary(id obj) {
    return [obj isKindOfClass:[NSDictionary class]]?obj:nil;
}

NSMutableArray* WYToMutableArray(id obj)   {
    return [obj isKindOfClass:[NSArray class]] || [obj isKindOfClass:[NSMutableArray class]] ? [NSMutableArray arrayWithArray:obj] :nil;
}

NSMutableDictionary* WYToMutableDictionary(id obj)  {
    return [obj isKindOfClass:[NSDictionary class]] || [obj isKindOfClass:[NSMutableDictionary class]] ? [NSMutableDictionary dictionaryWithDictionary:obj] : nil;
}

BOOL WYIsNull(id value)
{
    if (!value) return YES;
    if ([value isKindOfClass:[NSNull class]]) return YES;
    if ([WYToString(value) isEqualToString:@"<null>"]) return YES;
    if ([WYToString(value) isEqualToString:@"(null)"]) return YES;
    if ([WYToString(value) isEqualToString:@"null"]) return YES;
    if (WYToString(value).length == 0) return YES;

    return NO;
}

BOOL WYIsEmptyArray(NSArray *value)
{
    if (value == nil || [value isKindOfClass:[NSNull class]] || value.count == 0) {
        return YES;
    }
    return NO;
}

BOOL WYIsEmptyDict(NSDictionary *dic)
{
    if (dic  == nil || [dic isKindOfClass:[NSNull class]]||dic.allKeys==0) {
        return YES;
    }
    return NO;
}

id objectAtIndexSafe(id array, NSUInteger index) {
    if (WYToArray(array) || WYToMutableArray(array)) {
        if (index < [(NSArray *)array count]) {
            return array[index];
        }
    }
    return nil;
}
