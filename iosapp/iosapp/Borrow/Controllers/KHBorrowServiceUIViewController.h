//
//  KHBorrowServiceUIViewController.h
//  iosapp
//
//  Created by Mac on 4/24/15.
//  Copyright (c) 2015 Kindhat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../../Models/KHUser.h"
#import "../../CommonUI/KHUserUIViewController.h"

@interface KHBorrowServiceUIViewController : KHUserUIViewController

@property (nonatomic, strong) IBOutlet UITextField *serviceUITextField;

@end