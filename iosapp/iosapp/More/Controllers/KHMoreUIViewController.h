//
//  KHMoreUIViewController.h
//  iosapp
//
//  Created by Mac on 4/22/15.
//  Copyright (c) 2015 Kindhat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>

@interface KHMoreUIViewController : UITableViewController <FBLoginViewDelegate>

@property (nonatomic, strong) IBOutlet FBLoginView *loginView;

@end