//
//  KHLoginController.h
//  iosapp
//
//  Created by Mac on 10/9/14.
//  Copyright (c) 2014 Kindhat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../../Models/KHUser.h"
#import <FacebookSDK/FacebookSDK.h>

@interface KHLoginUIViewController : UIViewController <FBLoginViewDelegate>

@property (nonatomic, strong) IBOutlet FBLoginView *loginView;
@property(nonatomic, weak) KHUser* khUser;

@end