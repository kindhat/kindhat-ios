//
//  KHReturnDateUIViewController.h
//  iosapp
//
//  Created by Mac on 3/4/15.
//  Copyright (c) 2015 Kindhat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../Models/KHRequest.h"
#import "../Models/KHUser.h"

@interface KHReturnDateUIViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIDatePicker *returnDateUiDatePicker;

@property KHUser *khUser;

@property KHRequest *khRequest;

@end