//
//  KHSendRequestUIViewController.h
//  iosapp
//
//  Created by Mac on 3/4/15.
//  Copyright (c) 2015 Kindhat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../../Models/KHRequest.h"
#import "../../Models/KHUser.h"

@interface KHSendRequestUIViewController : UIViewController

@property (nonatomic, weak) IBOutlet UILabel *userUILabel;

@property (nonatomic, weak) IBOutlet UILabel *messageUILabel;

@property (nonatomic, weak) IBOutlet UILabel *itemUILabel;

@property (nonatomic, weak) IBOutlet UILabel *borrowDateUILabel;

@property (nonatomic, weak) IBOutlet UILabel *serviceDateUILabel;

@property (nonatomic, weak) IBOutlet UILabel *returnDateUILabel;

@property (nonatomic, weak) IBOutlet UITextView *messageUITextView;

@property (nonatomic, weak) IBOutlet UIView *borrowItemDatesView;

@property (nonatomic, weak) IBOutlet UIView *borrowServiceDateView;

@property (nonatomic, weak) KHUser *khUser;

@property (nonatomic, weak) KHRequest *khRequest;

@end
