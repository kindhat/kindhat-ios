//
//  KHShareUITableViewCell.h
//  iosapp
//
//  Created by Joseph Simon on 6/2/15.
//  Copyright (c) 2015 Kindhat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KHShareUITableViewCell : UITableViewCell

@property (nonatomic,strong) IBOutlet UIImageView *userImage;

@property (nonatomic,strong) IBOutlet UILabel *message;

@property (nonatomic,strong) IBOutlet UITextField *distance;

@property (nonatomic,strong) IBOutlet UITextField *time;

@end
