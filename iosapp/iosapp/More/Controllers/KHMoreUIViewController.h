//
//  KHMoreUIViewController.h
//  iosapp
//
//  Created by Mac on 4/22/15.
//  Copyright (c) 2015 Kindhat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>
#import "../../CommonUI/KHBackgroundUITableViewController.h"
#import "../../Models/KHUser.h"

@interface KHMoreUIViewController : KHBackgroundUITableViewController <FBLoginViewDelegate>

@property (nonatomic, strong) IBOutlet FBLoginView *loginView;

@property KHUser * khUser;

@end