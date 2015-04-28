//
//  KHBorrowServiceUIViewController.h
//  iosapp
//
//  Created by Mac on 4/24/15.
//  Copyright (c) 2015 Kindhat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../../../Models/KHRequest.h"
#import "../../../Models/KHUser.h"

@interface KHBorrowServiceUIViewController : UIViewController

@property (nonatomic, weak) IBOutlet UITextField *serviceUITextField;

@property (nonatomic, weak) KHUser *khUser;

@property (nonatomic, weak) KHRequest *khRequest;

@end