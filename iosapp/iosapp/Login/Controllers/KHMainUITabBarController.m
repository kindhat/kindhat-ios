//
//  KHMainUITabBarController.m
//  iosapp
//
//  Created by Mac on 10/26/14.
//  Copyright (c) 2014 Kindhat. All rights reserved.
//

#import "KHMainUITabBarController.h"
#import "../../StoryboardUtility/KHStoryboards.h"

@implementation KHMainUITabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setDelegate:self];
    
    [super viewDidLoad];
    
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

@end