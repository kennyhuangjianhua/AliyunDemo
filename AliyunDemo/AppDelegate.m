//
//  AppDelegate.m
//  AliyunDemo
//
//  Created by 黄建华 on 2017/10/19.
//  Copyright © 2017年 黄建华. All rights reserved.
//

#import "AppDelegate.h"
#import <AlinkSDK/AlinkOpenSDK.h>
#import "CustomLoginMoudle.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
#warning  请先配置好 Bundle ID 和 安全图片(yw_1222.jpg)!!!

    //设置AlinkSDK环境，指定appKey
    AlinkEnvConfig *envConfig = [AlinkEnvConfig sharedInstance];
    envConfig.appKey = @"24658640";
    
    //打开日志模块，Release版本请记得关闭
//    [envConfig openDebugLog:YES];
    
    //安装自定义登录协议，默认实现是OpenAccount，自定义登录协议请参照实现
    //CustomLoginMoudle 实现请参见Demo相关文件
    CustomLoginMoudle *loginModule = [[CustomLoginMoudle alloc] init];
    [[AlinkAccount sharedInstance] installCustomLoginModule:loginModule];
    
    //Alink 初始化以及配置下行消息监听
    [[AlinkSDK sharedManager] asyncInit:^(NSError * _Nullable error) {
        if (!error) {
            [kAlinkSDK setDownStreamCallback:^(NSDictionary * _Nonnull dict) {
                //收到 DownStream 下行消息
            }];
            return;
        }
    }];
    
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


@end
