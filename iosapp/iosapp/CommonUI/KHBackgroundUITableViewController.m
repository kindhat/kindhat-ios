//
//  KHBackgroundUITableViewController.m
//  iosapp
//
//  Created by Mac on 4/24/15.
//  Copyright (c) 2015 Kindhat. All rights reserved.
//

#import "KHBackgroundUITableViewController.h"

@implementation KHBackgroundUITableViewController

static NSString *const backgroundImage = @"background image 1536x2048.png";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.backgroundView = [[UIImageView alloc] initWithImage:
                                     [UIImage imageNamed:backgroundImage]];
}

@end

