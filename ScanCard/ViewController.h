//
//  ViewController.h
//  ScanCard
//
//  Created by xlCoder on 2018/8/3.
//  Copyright © 2018年 xianliangDev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

//身份证信息
@property (nonatomic, weak) IBOutlet UITextView *idCardInfoView;
//银行卡信息
@property (nonatomic, weak) IBOutlet UITextView *bankCardInfoView;
@end

