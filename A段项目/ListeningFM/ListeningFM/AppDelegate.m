//
//  AppDelegate.m
//  ListeningFM
//
//  Created by apple on 16/9/20.
//  Copyright © 2016年 Ma Baihui. All rights reserved.
//

#import "AppDelegate.h"

#import "XQ_FindVC.h"
#import "XQ_SubVC.h"
#import "XQ_DownVC.h"
#import "XQ_MineVC.h"
#import "XQ_AudioPlayVC.h"

@interface AppDelegate ()

/**音频播放界面*/
@property (nonatomic, retain) XQ_AudioPlayVC *audioPlayVC;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    NSMutableArray *array = [[NSMutableArray alloc] initWithObjects:[UIImage imageNamed:@"tabbar_find_n"], [UIImage imageNamed:@"tabbar_sound_n"], [UIImage imageNamed:@"tabbar_download_n"], [UIImage imageNamed:@"tabbar_me_n"], nil];
    NSMutableArray *selectedArray = [[NSMutableArray alloc]initWithObjects:[UIImage imageNamed:@"tabbar_find_h"], [UIImage imageNamed:@"tabbar_sound_h"], [UIImage imageNamed:@"tabbar_download_h"], [UIImage imageNamed:@"tabbar_me_h"], nil];
    
    XQ_FindVC * findVC = [[XQ_FindVC alloc]init];
    XQ_SubVC * subVC = [[XQ_SubVC alloc]init];
    XQ_DownVC * downVC = [[XQ_DownVC alloc]init];
    XQ_MineVC * mineVC = [[XQ_MineVC alloc]init];
    
    UINavigationController *naviFind = [[UINavigationController alloc]initWithRootViewController:findVC];
    UINavigationController *naviSub = [[UINavigationController alloc]initWithRootViewController:subVC];
    UINavigationController *naviDown = [[UINavigationController alloc]initWithRootViewController:downVC];
    UINavigationController *naviMine = [[UINavigationController alloc]initWithRootViewController:mineVC];

    
    self.tabBar = [[XQ_TabBarViewController alloc]initWithTabBarSelectedImages:selectedArray normalImages:array titles:nil];
    _tabBar.viewControllers = @[naviFind, naviSub, naviDown, naviMine];
    _tabBar.textColor = [UIColor colorWithRed:0.92 green:0.33 blue:0.20 alpha:1.00];
    _tabBar.showCenterItem = YES;
    
    _tabBar.centerItemImage = [UIImage imageNamed:@"tabbar_sound_n-1"];
//    _tabBar.tabBarItem.image = [[UIImage imageNamed:@"tabbar_bg"] imageWithRenderingMode:1];
    
    _tabBar.XQ_centerViewController = [[XQ_AudioPlayVC alloc] init];
    _window.rootViewController = _tabBar;
    
    [self.window makeKeyAndVisible];
    
    
    
    return YES;
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
