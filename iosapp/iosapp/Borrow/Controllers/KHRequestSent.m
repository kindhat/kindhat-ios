//
//  KHRequestSent.m
//  iosapp
//
//  Created by Mac on 4/27/15.
//  Copyright (c) 2015 Kindhat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KHRequestSent.h"
#import "Item/KHBorrowItemUIViewController.h"
#import "../../Login/Controllers/KHMainUITabBarController.h"
#import "../../Utility/KHLiterals.h"

@implementation KHRequestSent

- (void)viewDidLoad {
    [super viewDidLoad];
    [[self navigationController] setNavigationBarHidden:YES];
}

- (IBAction)doneButtonTapped:(id)sender
{
    KHBorrowItemUIViewController *khBorrowItemUIViewController = [[self navigationController] viewControllers][0];
    [[khBorrowItemUIViewController  itemUITextField] setText:[KHLiterals emptyString]];
    
    KHMainUITabBarController *khMainUITabBarController = (KHMainUITabBarController *)[[khBorrowItemUIViewController parentViewController]parentViewController];
    [khMainUITabBarController setSelectedIndex:2];
    
    [[self navigationController] setNavigationBarHidden:NO];
    [[self navigationController] popToRootViewControllerAnimated:true];
}

@end

