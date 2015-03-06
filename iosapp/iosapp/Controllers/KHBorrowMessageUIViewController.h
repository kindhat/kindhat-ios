//
//  KHBorrowMessageUIViewController.h
//  iosapp
//
//  Created by Mac on 3/5/15.
//  Copyright (c) 2015 Kindhat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../Models/KHRequest.h"

@interface KHBorrowMessageUIViewController : UIViewController

@property KHRequest *khRequest;

@property (nonatomic, strong) IBOutlet UITextView *messageUITextView;

@end