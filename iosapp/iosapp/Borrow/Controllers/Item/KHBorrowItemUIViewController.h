//
//  KHBorrowUIViewController
//  iosapp
//
//  Created by Mac on 10/23/14.
//  Copyright (c) 2014 Kindhat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../../../CommonUI/KHUserUIViewController.h"

@interface KHBorrowItemUIViewController : KHUserUIViewController

@property (nonatomic, weak) IBOutlet UITextField *itemUITextField;

@property (nonatomic, weak) IBOutlet UISegmentedControl * borrowFavorUISegmentedControl;

@end