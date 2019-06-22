//
//  ViewController.m
//  iphoneXDemo
//
//  Created by MacOS on 2018/7/3.
//  Copyright © 2018年 MacOS. All rights reserved.
//

#import "ViewController.h"
#import <sys/sysctl.h>
#import <sys/utsname.h>

static inline BOOL isIPhoneXSeries() {
    if (@available(iOS 11.0, *)) {
        UIWindow *mainWindow = [[[UIApplication sharedApplication] delegate] window];
        if (mainWindow.safeAreaInsets.bottom > 0.0) {
            return YES;
        }
    }
    return NO;
}

//一.iPhone X尺寸问题
//
//1. 高度增加了145pt，变成812pt.
//
//2.屏幕圆角显示，注意至少留10pt边距。
//
//3. 状态栏高度由20pt变成44pt，留意这个距离就能避开“刘海”的尴尬，相应的导航栏以上变化64--->88。
//
//4.底部工具栏需要为home indicator留出34pt边距。 5.物理分辨率为1125px * 2436px
//
//非iPhone X -> iPhone 4,5,6,7,8：
//
//StatusBar高20px，NavigationBar高44px，底部TabBar高49px
//
//iPhone X：
//
//StatusBar高44px，NavigationBar高44px，底部TabBar高83px



// status bar height.

#define  StatusBarHeight      (IS_iPhoneX ? 44.f : 20.f)

// Navigation bar height.

#define  NavigationBarHeight  44.f

// Tabbar height.

#define  TabbarHeight        (IS_iPhoneX ? (49.f + 34.f) : 49.f)

// Tabbar safe bottom margin.

#define  TabbarSafeBottomMargin        (IS_iPhoneX ? 34.f : 0.f)

// Status bar & navigation bar height.

#define  StatusBarAndNavigationBarHeight  (IS_iPhoneX ? 88.f : 64.f)

//判断是否是刘海屏
#define IPHONE_X \
({BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\
(isPhoneX);})


//iPhoneXr 下面的判断会失效 估计是官方的问题

#define iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO) //判断iPhoneXs
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1080, 1920), [[UIScreen mainScreen] currentMode].size) : NO)
#define IS_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhoneXr ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhoneXsMax ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) : NO)


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    float whether = IS_iPhoneX ? 100 : 0;
    NSLog(@"%lf",whether);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 判断iPhoneXr硬件编码/标识符iPhone11,8
 
 @return return value description
 */
- (BOOL)isiPhoneXrDevice {
    static BOOL isiPhoneXr = NO;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
#if TARGET_IPHONE_SIMULATOR
        // 获取模拟器所对应的 device model
        NSString *model = NSProcessInfo.processInfo.environment[@"SIMULATOR_MODEL_IDENTIFIER"];
#else
        // 获取真机设备的 device model
        struct utsname systemInfo;
        uname(&systemInfo);
        NSString *model = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
#endif
        // 判断 device model 是否为 "iPhone11,8"
        // 如果是，就认为是 iPhone Xr
        isiPhoneXr = [model isEqualToString:@"iPhone11,8"];
        //        NSLog(@"-------------%@-----------",model);
    });
    
    return isiPhoneXr;
}


@end
