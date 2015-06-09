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

@implementation KHMainUITabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray * tabs = [NSArray arrayWithObjects:
                      [KHStoryboards borrowStoryboard],
                      [KHStoryboards shareStoryboard],
                      [KHStoryboards charitiesStoryboard],
                      [KHStoryboards dashboardStoryboard],
                      nil];
    [self initializeTabBarWithStoryboards:tabs];
    
    NSArray * uiViewControllerInitializers = [NSArray arrayWithObjects:
                                              setKHUserUIViewController,
                                              setKHUserUIViewController,
                                              setKHUserUIViewController,
                                              setKHMoreUIViewController,
                                              nil];
    [self initializeUIViewControllers:uiViewControllerInitializers];
}

- (void) initializeUIViewControllers: (NSArray *)uiViewControllerInitializers{
    [uiViewControllerInitializers enumerateObjectsUsingBlock:^(void (^ initializeUIViewController)(UIViewController *, KHUser *), NSUInteger idx, BOOL * stop) {
        UINavigationController *uiNavigationController = (UINavigationController *)[[self viewControllers] objectAtIndex: idx];
        UIViewController *setViewController = uiNavigationController.viewControllers[0];
        initializeUIViewController(setViewController, [self khUser]);
    }];
}

- (void) initializeTabBarWithStoryboards: (NSArray *)tabs {
    [self setTabBarControllerWithStoryboards:tabs];
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController
shouldSelectViewController:(UIViewController *)viewController{
    return [[self khUser] requiredFieldsMet];
}

void (^setKHUserUIViewController)(UIViewController *, KHUser *) =
^(UIViewController *viewController, KHUser *khUser) {
    KHUserUIViewController *khUserUIViewController = (KHUserUIViewController *)viewController;
    [khUserUIViewController setKhUser: khUser];
};

void (^setKHMoreUIViewController)(UIViewController *, KHUser *) =
^(UIViewController *viewController, KHUser *khUser) {
    KHMoreUIViewController *khMoreUIViewController = (KHMoreUIViewController *)viewController;
    [khMoreUIViewController setKhUser: khUser];
};

@end