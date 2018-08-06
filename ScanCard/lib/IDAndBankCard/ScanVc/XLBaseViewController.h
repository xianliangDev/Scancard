//
//  XLBaseViewController.h
//  SCaptain
//
//  Created by mxl on 2017/3/20.
//  Copyright © 2017年 mxl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XLBaseViewController : UIViewController

//- (void)changeNaviBackColor:(UIColor *)backColor;

+ (void)presentVC:(UIViewController *)viewController;

- (void)tabBarItemClicked;

- (void)configSubViews;

@end
