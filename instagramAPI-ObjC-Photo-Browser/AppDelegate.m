//
//  AppDelegate.m
//  instagramAPI-ObjC-Photo-Browser
//
//  Created by Maciej Serwicki on 3/15/16.
//  Copyright © 2016 Maciej Serwicki. All rights reserved.
//

#import "AppDelegate.h"
#import "PhotosVC.h"
#import "SimpleAuth.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    SimpleAuth.configuration[@"instagram"] = @{
                                               @"client_id" : @"58b275b881464cb08045ae8f885d6006", SimpleAuthRedirectURIKey : @"treehousephotos://auth/instagram"
                                               };
    
    
    UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [window setRootViewController:[[PhotosVC alloc] init]];
    self.window = window;
    
    PhotosVC *photosVC = [[PhotosVC alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController: photosVC];
    self.window.rootViewController = navigationController;
    
    UINavigationBar *navigationBar =  navigationController.navigationBar;
   
    navigationBar.tintColor = [UIColor colorWithRed: 242.0/255.0 green:122.0/255.0 blue:88.0/255.0 alpha:1.0];
    navigationBar.barStyle = UIBarStyleBlackOpaque;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [window makeKeyAndVisible];
    //[self setWindow:window];
 
    
    
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
