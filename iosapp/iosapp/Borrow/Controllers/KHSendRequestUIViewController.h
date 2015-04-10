//
//  KHSendRequestUIViewController.h
//  iosapp
//
//  Created by Mac on 3/4/15.
//  Copyright (c) 2015 Kindhat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../../Models/KHRequest.h"
#import "../../Models/KHUser.h"

@interface KHSendRequestUIViewController : UIViewController

@property (nonatomic, strong) IBOutlet UILabel *messageUILabel;

@property (nonatomic, strong) IBOutlet UILabel *dateUILabel;

@property KHUser *khUser;

@property KHRequest *khRequest;

@end
