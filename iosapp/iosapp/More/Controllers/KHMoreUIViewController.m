//
//  KHMoreUIViewController.m
//  iosapp
//
//  Created by Mac on 4/22/15.
//  Copyright (c) 2015 Kindhat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KHMoreUIViewController.h"
#import "../../Utility/KHClearCookies.h"

@implementation KHMoreUIViewController

static NSString *const loginSegueIdentifier = @"@Login";
static NSString *const facebookUrl = @"https://facboook.com/";

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self loginView] setDelegate:self];
}

- (void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView
{
    KHClearCookies *khClearCookies = [[KHClearCookies alloc]init];
    [khClearCookies clearCookies:facebookUrl];
    [self performSegueWithIdentifier:loginSegueIdentifier sender:nil];
}

@end
