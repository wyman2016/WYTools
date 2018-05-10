//
//  DDPublicFunctions.h
//  
//
//  Created byWYArchiverFileDefineman on 2017/5/16.
//  Copyright © 2017年WYArchiverFileDefineman All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//获取当前的window，不一定是keywindow
UIWindow *mainWindow();

//当前最高一级VC
UIViewController *topMostViewController();

//可以任意地方调用这个push，不需要跑回基类VC调用self.navigationController这么麻烦
void WYPushViewController (UIViewController *vc,BOOL animated);

//present，同上
void WYPresentViewController (UIViewController *vc,BOOL animated);

float WYFitValue(float value);


/**
 *  数据校验
 */
NSString*WYToString(id obj);

NSArray*WYToArray(id obj);

NSDictionary*WYToDictionary(id obj);

NSMutableArray*WYToMutableArray(id obj);

NSMutableDictionary*WYToMutableDictionary(id obj);

id objectAtIndexSafe(id array, NSUInteger index);

BOOL WYIsNull(id value);
BOOL WYIsEmptyArray(NSArray *value);
BOOL WYIsEmptyDict(NSDictionary *dic);


