//
//  KHAppDelegate.m
//  iosapp
//
//  Created by Mac on 10/7/14.
//  Copyright (c) 2014 Kindhat. All rights reserved.
//

#import "KHAppDelegate.h"
#import <FacebookSDK/FacebookSDK.h>
#import "StoryboardUtility/KHStoryboards.h"
#import "Utility/KHConfiguration.h"

@interface KHAppDelegate ()

@end

@implementation KHAppDelegate

+ (void)initialize
{
    // Nib files require the type to have been loaded before they can do the wireup successfully.
    // http://stackoverflow.com/questions/1725881/unknown-class-myclass-in-interface-builder-file-error-at-runtime
    [FBLoginView class];
    [KHConfiguration loadConfiguration];
    
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //to limit screen flicker, if the user is logged in we want to
    //immediately move to the tabbed ui control
    
    //This line allows the session to be activated without transitioning
    //the user to the facebook login screen if there is a token cached.
    //Not entirely sure what would happen if this was set to yes and
    //there was a token cached. Would it still go to the login screen?
    //Mostly curious about this because there would be no reason to go to the login screen.
    [FBSession openActiveSessionWithAllowLoginUI:NO]; //this allows the app to login without
    
    ////Get a Facebook login session
    //FBSession *session = [FBSession activeSession];
    //if (!session.isOpen) {
    //    [self showLoginScreen:NO];
    //}
    
    return YES;
}

// In order to process the response you get from interacting with the Facebook login process,
// you need to override application:openURL:sourceApplication:annotation:
- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    
    // Call FBAppCall's handleOpenURL:sourceApplication to handle Facebook app responses
    BOOL wasHandled = [FBAppCall handleOpenURL:url sourceApplication:sourceApplication];
    
    // You can add your app-specific url handling code here if needed
    
    return wasHandled;
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

//- (void) showLoginScreen:(BOOL)animated {
//    // Get login screen from storyboard and present it
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    KHLoginUIViewController *loginUIViewController = (KHLoginUIViewController *)[storyboard instantiateViewControllerWithIdentifier:@"loginUIViewController"];
//    [self.window makeKeyAndVisible];
//    [self.window.rootViewController presentViewController:loginUIViewController
//                                                 animated:animated
//                                               completion:nil];
//}
    
//- (void) logout {
//    // Remove data from singleton (where all my app data is stored)
//    //[AppData clearData];
        
//    // Reset view controller (this will quickly clear all the views)
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    UITabBarController *mainUITabBarController = (UITabBarController *)[storyboard instantiateViewControllerWithIdentifier:@"mainUITabBarController"];
//    [self.window setRootViewController:mainUITabBarController];
        
    // Show login screen
//    [self showLoginScreen:NO];
//}
    
@end
