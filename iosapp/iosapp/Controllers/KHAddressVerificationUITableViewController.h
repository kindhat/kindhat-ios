//
//  KHAddressVerificationUITableViewController
//  iosapp
//
//  Created by Mac on 3/5/15.
//  Copyright (c) 2015 Kindhat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KHAddressVerificationUITableViewController : UITableViewController<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic,strong) NSArray *addresses;

@property (nonatomic, strong) IBOutlet UITableView *uiTableView;

@end