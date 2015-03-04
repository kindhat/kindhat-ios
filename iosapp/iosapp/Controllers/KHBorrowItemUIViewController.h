//
//  KHBorrowUIViewController
//  iosapp
//
//  Created by Mac on 10/23/14.
//  Copyright (c) 2014 Kindhat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../Models/KHRequest.h"

@interface KHBorrowItemUIViewController : UIViewController

@property KHRequest * khRequest;

@property (nonatomic, strong) IBOutlet UITextField *itemUiTextField;

@end