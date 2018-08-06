//
//  XLScanBaseViewController.m
//  IDAndBankCard
//
//  Created by  on 2017/3/28.
//  Copyright © 2017年 mxl. All rights reserved.
//

#import "XLScanBaseViewController.h"

@interface XLScanBaseViewController ()

//手电筒是否打开
@property (nonatomic, assign,getter=isTorchOn) BOOL torchOn;
//设备信息
@property (nonatomic, strong) AVCaptureDevice *device;

@end

@implementation XLScanBaseViewController

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.cameraManager doSomethingWhenWillDisappear];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.cameraManager doSomethingWhenWillAppear];
    // rightBarButtonItem设为原样
    self.torchOn = NO;
    UIBarButtonItem *rightBarBtn = [[UIBarButtonItem alloc] initWithImage: [[UIImage imageNamed:@"nav_torch_off"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(turnOnOrOffTorch)];
    self.navigationItem.rightBarButtonItem = rightBarBtn;

}

- (XLScanManager *)cameraManager {
    if (!_cameraManager) {
        _cameraManager = [[XLScanManager alloc] init];
    }
    return _cameraManager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - 打开／关闭手电筒
-(void)turnOnOrOffTorch {
    self.torchOn = !self.isTorchOn;
    
    if ([self.device hasTorch]){ // 判断是否有闪光灯
        [self.device lockForConfiguration:nil];// 请求独占访问硬件设备
        
        if (self.isTorchOn) {
            //            UIBarButtonItem *rightBarBtnItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"nav_torch_on"] originalImage] style:UIBarButtonItemStylePlain target:self action:@selector(<#selector#>)];
            self.navigationItem.rightBarButtonItem.image = [[UIImage imageNamed:@"nav_torch_on"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            [self.device setTorchMode:AVCaptureTorchModeOn];
        } else {
            self.navigationItem.rightBarButtonItem.image = [[UIImage imageNamed:@"nav_torch_off"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            [self.device setTorchMode:AVCaptureTorchModeOff];
        }
        [self.device unlockForConfiguration];// 请求解除独占访问硬件设备
    }else {
        //        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        //        [self alertControllerWithTitle:@"提示" message:@"您的设备没有闪光设备，不能提供手电筒功能，请检查" okAction:okAction cancelAction:nil];
    }
}


#pragma mark - 懒加载
#pragma mark device
-(AVCaptureDevice *)device {
    if (_device == nil) {
        _device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
        
        NSError *error = nil;
        if ([_device lockForConfiguration:&error]) {
            if ([_device isSmoothAutoFocusSupported]) {// 平滑对焦
                _device.smoothAutoFocusEnabled = YES;
            }
            
            if ([_device isFocusModeSupported:AVCaptureFocusModeContinuousAutoFocus]) {// 自动持续对焦
                _device.focusMode = AVCaptureFocusModeContinuousAutoFocus;
            }
            
            if ([_device isExposureModeSupported:AVCaptureExposureModeContinuousAutoExposure ]) {// 自动持续曝光
                _device.exposureMode = AVCaptureExposureModeContinuousAutoExposure;
            }
            
            if ([_device isWhiteBalanceModeSupported:AVCaptureWhiteBalanceModeContinuousAutoWhiteBalance]) {// 自动持续白平衡
                _device.whiteBalanceMode = AVCaptureWhiteBalanceModeContinuousAutoWhiteBalance;
            }
            
            //            NSError *error1;
            //            CMTime frameDuration = CMTimeMake(1, 30); // 默认是1秒30帧
            //            NSArray *supportedFrameRateRanges = [_device.activeFormat videoSupportedFrameRateRanges];
            //            BOOL frameRateSupported = NO;
            //            for (AVFrameRateRange *range in supportedFrameRateRanges) {
            //                if (CMTIME_COMPARE_INLINE(frameDuration, >=, range.minFrameDuration) && CMTIME_COMPARE_INLINE(frameDuration, <=, range.maxFrameDuration)) {
            //                    frameRateSupported = YES;
            //                }
            //            }
            //
            //            if (frameRateSupported && [self.device lockForConfiguration:&error1]) {
            //                [_device setActiveVideoMaxFrameDuration:frameDuration];
            //                [_device setActiveVideoMinFrameDuration:frameDuration];
            ////                [self.device unlockForConfiguration];
            //            }
            
            [_device unlockForConfiguration];
        }
    }
    
    return _device;
}



@end
