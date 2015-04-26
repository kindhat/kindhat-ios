//
//  KHBorrowServiceDateUIViewController.h
//  iosapp
//
//  Created by Mac on 4/24/15.
//  Copyright (c) 2015 Kindhat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../../Models/KHRequest.h"
#import "../../Models/KHUser.h"

@interface KHBorrowServiceDateUIViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIDatePicker *serviceDateUIDatePicker;

@property KHUser *khUser;

@property KHRequest *khRequest;

@end
