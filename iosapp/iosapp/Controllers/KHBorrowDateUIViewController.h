//
//  KHBorrowDateUIViewController.h
//  iosapp
//
//  Created by Mac on 3/4/15.
//  Copyright (c) 2015 Kindhat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../Models/KHRequest.h"

@interface KHBorrowDateUIViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIDatePicker *borrowDateUiDatePicker;

@property KHRequest *khRequest;

@end
