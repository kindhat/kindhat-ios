//
//  KHBorrowItemDateUIViewController.h
//  iosapp
//
//  Created by Mac on 3/4/15.
//  Copyright (c) 2015 Kindhat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../../Models/KHRequest.h"
#import "../../Models/KHUser.h"
#import "../../CommonUI/KHUserUIViewController.h"

@interface KHBorrowItemDateUIViewController : KHUserUIViewController

@property (nonatomic, strong) IBOutlet UIDatePicker *borrowDateUIDatePicker;

@property KHRequest *khRequest;

@end
