//
//  XLScanBaseViewController.h
//  IDAndBankCard
//
//  Created by mxl on 2017/3/28.
//  Copyright © 2017年 mxl. All rights reserved.
//

#import "XLBaseViewController.h"
#import "XLScanManager.h"

#define iOS9Later ([UIDevice currentDevice].systemVersion.floatValue >= 9.0f)

@protocol XLScanBaseViewControllerDelegate <NSObject>

@optional
//成功扫描成功了身份证
- (void)idCardScanSuccessWithModel:(XLScanResultModel *)idCardModel;
//成功扫描了银行卡
- (void)bankCardScanSuccessWithModel:(XLScanResultModel *)bankCardModel;

@end
@interface XLScanBaseViewController : XLBaseViewController

@property (nonatomic, strong) XLScanManager *cameraManager;

@property (nonatomic, weak) id<XLScanBaseViewControllerDelegate> delegate;

@end
