//
//  ViewController.m
//  iphoneXDemo
//
//  Created by MacOS on 2018/7/3.
//  Copyright © 2018年 MacOS. All rights reserved.
//

#import "ViewController.h"

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

#define  kStatusBarHeight      (IS_iPhoneX ? 44.f : 20.f)

// Navigation bar height.

#define  kNavigationBarHeight  44.f

// Tabbar height.

#define  kTabbarHeight        (IS_iPhoneX ? (49.f + 34.f) : 49.f)

// Tabbar safe bottom margin.

#define  kTabbarSafeBottomMargin        (IS_iPhoneX ? 34.f : 0.f)

// Status bar & navigation bar height.

#define  kStatusBarAndNavigationBarHeight  (IS_iPhoneX ? 88.f : 64.f)

//判断是否iPhone X

#define IS_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)


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


@end
