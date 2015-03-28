//
//  KHAddressVerificationUITableViewCellController
//  iosapp
//
//  Created by Mac on 3/5/15.
//  Copyright (c) 2015 Kindhat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KHAddressVerificationUITableViewCellController : UITableViewCell

@property (nonatomic, strong) IBOutlet UITextField *streetTextField;
@property (nonatomic, strong) IBOutlet UITextField *cityTextField;
@property (nonatomic, strong) IBOutlet UITextField *stateTextFiled;

@end