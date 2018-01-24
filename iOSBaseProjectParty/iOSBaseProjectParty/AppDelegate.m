//
//  AppDelegate.m
//  iOSBaseProjectParty
//
//  Created by Eric on 2018/1/18.
//  Copyright © 2018年 Eric. All rights reserved.
//

#import "AppDelegate.h"
#import "NetWorkingUtil.h"
#import "CocoaLumberjack.h"
#import "EEFileManager.h"
#import "EEDBManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //初始化网络引擎
    [[NetWorkingUtil sharedNetWorkingUtil] startEngine];
    //初始化log输出引擎
    [self initLogEngine];
    //初始化文件管理模块
    [self initEEFileManager];
    //初始化DB
    [self initDB];
    
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - < 日志输出引擎 >

- (void)initLogEngine{
    [DDLog addLogger:[DDTTYLogger sharedInstance] withLevel:ddLogLevel];
//    [DDLog addLogger:[DDASLLogger sharedInstance] withLevel:ddLogLevel];
    DDFileLogger *fileLogger = [[DDFileLogger alloc] init];
    fileLogger.rollingFrequency = 3 * 6 * 60 * 24;//3天滚动
    fileLogger.logFileManager.maximumNumberOfLogFiles = 30;//最大输出文件
    [DDLog addLogger:fileLogger withLevel:ddLogLevel];
    
    [[DDTTYLogger sharedInstance] setColorsEnabled:YES];
    [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor greenColor] backgroundColor:[UIColor redColor] forFlag:DDLogFlagInfo];
}

#pragma mark - < 文件管理模块 >

- (void)initEEFileManager{
    [[EEFileManager sharedEEFileManager] setFileSystemRootName:@"18810091131"];
}

#pragma mark - < 数据库管理 >

- (void)initDB{
    [[EEDBManager sharedEEDBManager] initCommenDB];
    [[EEDBManager sharedEEDBManager] initDB:@"18611171457"];
}



@end
