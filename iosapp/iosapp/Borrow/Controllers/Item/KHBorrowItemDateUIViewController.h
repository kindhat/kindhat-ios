//
//  KHBorrowItemDateUIViewController.h
//  iosapp
//
//  Created by Mac on 3/4/15.
//  Copyright (c) 2015 Kindhat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../../../Models/KHRequest.h"
#import "../../../Models/KHUser.h"

@interface KHBorrowItemDateUIViewController : UIViewController

@property (nonatomic, weak) IBOutlet UIDatePicker *borrowDateUIDatePicker;

@property (nonatomic, weak) KHUser *khUser;

@property (nonatomic, strong) KHRequest *khRequest;

@end
