//
//  KHSettingsUITableViewController.h
//  iosapp
//
//  Created by Mac on 10/31/14.
//  Copyright (c) 2014 Kindhat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface KHMeUIViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIScrollView *uiScrollView;
@property (strong, nonatomic) IBOutlet UIImageView *profileUIImageView;
@property (strong, nonatomic) IBOutlet UITextField *nameUITextField;
@property (strong, nonatomic) IBOutlet UITextField *emailUITextField;
@property (strong, nonatomic) IBOutlet UITextField *streetUITextField;
@property (strong, nonatomic) IBOutlet UITextField *postalCodeUITextField;
@property (strong, nonatomic) IBOutlet UISwitch *termsAndConditionsUISwitch;
@property (strong, nonatomic) IBOutlet UITextView *aboutYouUITextView;
@property (strong, nonatomic) IBOutlet UIButton *saveUIButton;

@end
