//
//  KHMoreUIViewController.m
//  iosapp
//
//  Created by Mac on 4/22/15.
//  Copyright (c) 2015 Kindhat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KHMoreUIViewController.h"

@implementation KHMoreUIViewController

static NSString *const loginSegueIdentifier = @"@Login";

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.backgroundView = [[UIImageView alloc] initWithImage:
                                     [UIImage imageNamed:@"background image 1536x2048.png"]];
    
    [[self loginView] setDelegate:self];
}

- (void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView
{
    [self performSegueWithIdentifier:loginSegueIdentifier sender:nil];
}

@end
