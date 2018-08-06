# Scancard
Scancard 工程扫描识别身份证、银行卡功能,返回卡片信息和图片  

先检测.a是否包括所用的设备架构，xcode8、xcode9上边编译可能会遇到arm64错误，可尝试关闭build setting里边的Enable Testability  

#项目目录说明

1、由于在扫描UI的界面中，用到了Reactive Cocoa，需要通过cocopods添加Reactive Cocoa的依赖库
pod 'ReactiveObjC', '~> 3.1.0'
2、在.a库不支持 Enable Bitcode  需要在build setting 中将Enable Bitcode 设置No;
3、xcode8、xcode9上边编译可能会遇到arm64错误，可尝试关闭build setting里边的Enable Testability ； 
4、在控制器中设置代理方法扫描结果的代理方法
//成功扫描成功了身份证
- (void)idCardScanSuccessWithModel:(XLScanResultModel *)idCardModel；

//成功扫描了银行卡
- (void)bankCardScanSuccessWithModel:(XLScanResultModel *)bankCardModel
