//
//  AppDelegate.m
//  自定义tabbar
//
//  Created by 君涂涂 on 15/3/25.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "SubViewController.h"
#import "ThdViewController.h"
#import "ForViewController.h"
#import "FiveViewController.h"

@interface AppDelegate ()

@property (nonatomic, weak) UIButton *selectedBtn;

@end

@implementation AppDelegate
{
    UITabBarController *_tabBarC;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    [self addSomeControllers];
    
    _window.rootViewController = _tabBarC;
    _tabBarC.tabBar.hidden = YES;
    
    UIView *tabbarView = [[UIView alloc] initWithFrame:CGRectMake(0, 623, 375, 49)];
    tabbarView.backgroundColor = [UIColor whiteColor];
    [_tabBarC.view addSubview:tabbarView];
    
    NSArray *imageName = @[@"新闻", @"论坛", @"活动", @"助理", @"设置"];
    NSArray *imageNameSel = @[@"新闻2", @"论坛2", @"活动2", @"助理2", @"设置2"];
    for (int i = 0; i < 5; i++) {
        UIButton *btn = [[UIButton alloc] init];
        [btn setImage:[UIImage imageNamed:imageName[i]] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:imageNameSel[i]] forState:UIControlStateSelected];
        
        CGFloat x = i * tabbarView.frame.size.width / 5;
        btn.frame = CGRectMake(x, 0, tabbarView.frame.size.width / 5, tabbarView.frame.size.height);
        [tabbarView addSubview:btn];
        btn.tag = i;//设置按钮的标记, 方便来索引当前的按钮,并跳转到相应的视图
        [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        //设置刚进入时,第一个按钮为选中状态
        if (0 == i) {
            btn.selected = YES;
            self.selectedBtn = btn;  //设置该按钮为选中的按钮
        }
    }
    _window.backgroundColor = [UIColor whiteColor];
    [_window makeKeyAndVisible];
    
    return YES;
}

- (void)clickBtn:(UIButton *)sender {
    //1.先将之前选中的按钮设置为未选中
    self.selectedBtn.selected = NO;
    
    //2.再将当前按钮设置为选中
    sender.selected = YES;
    
    //3.最后把当前按钮赋值为之前选中的按钮
    self.selectedBtn = sender;
    
    //4.取得tabbar控制器中的 视图控制器数组
    NSArray *vcArr = [_tabBarC viewControllers];
    
    //5.设置被选中的视图控制器 通过按钮的tag值 得到索引值
    _tabBarC.selectedViewController = [vcArr objectAtIndex:sender.tag];
}

- (void)addSomeControllers {
    ViewController *newV = [[ViewController alloc] init];
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:newV];
    
    SubViewController *forumV = [[SubViewController alloc] init];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:forumV];
    
    ThdViewController *activityV = [[ThdViewController alloc] init];
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:activityV];
    
    ForViewController *assistantV = [[ForViewController alloc] init];
    UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController:assistantV];
    
    FiveViewController *setV = [[FiveViewController alloc] init];
    UINavigationController *nav5 = [[UINavigationController alloc] initWithRootViewController:setV];
    
    _tabBarC = [[UITabBarController alloc] init];
    _tabBarC.viewControllers = @[nav1, nav2, nav3, nav4, nav5];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
