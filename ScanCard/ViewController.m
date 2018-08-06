//
//  ViewController.m
//  ScanCard
//
//  Created by xlCoder on 2018/8/3.
//  Copyright © 2018年 xianliangDev. All rights reserved.
//

#import "ViewController.h"
#import "XLIDScanViewController.h"
#import "XLBankScanViewController.h"

@interface ViewController ()<XLScanBaseViewControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view, typically from a nib.
}

//扫描银行卡功能
- (IBAction)bankCardScan:(id)sender{
    XLBankScanViewController *bankVc = [[XLBankScanViewController alloc] init];
    bankVc.delegate = self;
    [self.navigationController pushViewController:bankVc animated:YES];
}

- (IBAction)idCardScan:(id)sender{
    XLIDScanViewController *idCardVc = [[XLIDScanViewController alloc] init];
    idCardVc.delegate = self;
    [self.navigationController pushViewController:idCardVc animated:YES];
}

//成功扫描成功了身份证
- (void)idCardScanSuccessWithModel:(XLScanResultModel *)idCardModel{
    self.idCardInfoView.text = [NSString stringWithFormat:@"\
                                身份证号：%@,\n\
                                性别：%@,\n\
                                民族：%@,\n\
                                地址：%@,\n\
                                签发机关：%@,\n\
                                有效期：%@",
                                idCardModel.code,idCardModel.gender,idCardModel.nation,idCardModel.address,idCardModel.issue,idCardModel.valid];
}
//成功扫描了银行卡
- (void)bankCardScanSuccessWithModel:(XLScanResultModel *)bankCardModel{
    self.bankCardInfoView.text = [NSString stringWithFormat:@"银行卡号：%@,\n\
                                  银行名称:%@, ",bankCardModel.bankNumber,bankCardModel.bankName];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
