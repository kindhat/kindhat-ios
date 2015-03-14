//
//  KHBorrowUIViewController
//  iosapp
//
//  Created by Mac on 10/23/14.
//  Copyright (c) 2014 Kindhat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../Models/KHUser.h"

@interface KHBorrowItemUIViewController : UIViewController

@property (nonatomic, strong) IBOutlet UITextField *itemUiTextField;

@property KHUser *khUser;

@end