//
//  KHMainUITabBarController.m
//  iosapp
//
//  Created by Mac on 10/26/14.
//  Copyright (c) 2014 Kindhat. All rights reserved.
//

#import "KHMainUITabBarController.h"
#import "../../Borrow/Controllers/KHBorrowItemUIViewController.h"

@implementation KHMainUITabBarController

static NSString *const borrowSegueName = @"@Borrow";

- (BOOL)tabBarController:(UITabBarController *)tabBarController
shouldSelectViewController:(UIViewController *)viewController{
    return [[self khUser] requiredFieldsMet];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:borrowSegueName]) {
        KHBorrowItemUIViewController *khBorrowItemUIViewController = segue.destinationViewController;
        [khBorrowItemUIViewController setKhUser: [self khUser]];
    }
}

@end