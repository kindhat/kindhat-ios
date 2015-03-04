//
//  KHBorrowUIViewController
//  iosapp
//
//  Created by Mac on 10/24/14.
//  Copyright (c) 2014 Kindhat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KHMainUITabBarController.h"
#import "KHBorrowItemUIViewController.h"
#import "../Models/KHUser.h"

@implementation KHBorrowItemUIViewController

@synthesize khRequest;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (IBAction)nextClicked:(id)sender
{
    
    KHMainUITabBarController *khMainUITabBarController =
    (KHMainUITabBarController*)[[self parentViewController] parentViewController];
    
    KHUser *khUser = [khMainUITabBarController khUser];
    
    [[self khRequest] setUserId: [khUser identifier]];
    [[self khRequest] setItem: [[self itemUiTextField] text]];
}

@end