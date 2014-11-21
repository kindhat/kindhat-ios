//
//  KHMainUITabBarController.m
//  iosapp
//
//  Created by Mac on 10/26/14.
//  Copyright (c) 2014 Kindhat. All rights reserved.
//

#import "KHMainUITabBarController.h"

@implementation KHMainUITabBarController

- (BOOL)tabBarController:(UITabBarController *)tabBarController
shouldSelectViewController:(UIViewController *)viewController{
    return [[self khUser] requiredFieldsMet];
}

@end