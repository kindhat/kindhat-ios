//
//  KHMainUITabBarController.m
//  iosapp
//
//  Created by Mac on 10/26/14.
//  Copyright (c) 2014 Kindhat. All rights reserved.
//

#import "KHMainUITabBarController.h"
#import "../../StoryboardUtility/KHStoryboards.h"
#import "../../CommonUI/KHUserUIViewController.h"
#import "../../More/Controllers/KHMoreUIViewController.h"


@interface KHMainUITabBarController ()

@property (nonatomic, retain) NSArray *setPropertyByIndexArray;

@end

@implementation KHMainUITabBarController


static NSString *const setKHUserUIViewControllerMethodName = @"setKHUserUIViewController:";

@synthesize setPropertyByIndexArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setSetPropertyByIndexArray:[NSArray arrayWithObjects:
                                      setKHUserUIViewControllerMethodName,
                                      setKHUserUIViewControllerMethodName,
                                      setKHUserUIViewControllerMethodName,
                                      setKHUserUIViewControllerMethodName,
                                      nil]];
    
    NSArray * tabs = [NSArray arrayWithObjects:
                      [KHStoryboards borrowStoryboard],
                      [KHStoryboards shareStoryboard],
                      [KHStoryboards dashboardStoryboard],
                      [KHStoryboards moreStoryboard],
                      nil];
    
    [self setTabBarControllerWithStoryboards:tabs];
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController
shouldSelectViewController:(UIViewController *)viewController{
    return [[self khUser] requiredFieldsMet];
}

- (void)tabBarController:(UITabBarController *)tabBarController
 didSelectViewController:(UIViewController *)viewController {
    UINavigationController *uiNavigationController = (UINavigationController *)viewController;
    UIViewController *setViewController = uiNavigationController.viewControllers[0];
    //void (^setKHUserForViewController)(UIViewController *)
    SEL setKHUserForViewController = NSSelectorFromString([self setPropertyByIndexArray][[self selectedIndex]]);
    [self performSelector:setKHUserForViewController withObject:setViewController];
}

- (void)setKHUserUIViewController:(UIViewController *)viewController {
    KHUserUIViewController *khUserUIViewController = (KHUserUIViewController *)viewController;
    [khUserUIViewController setKhUser: [self khUser]];
}

- (void)setKHMoreUIViewController:(UIViewController *)viewController {
    KHMoreUIViewController *khMoreUIViewController = (KHMoreUIViewController *)viewController;
    [khMoreUIViewController setKhUser: [self khUser]];
}

@end