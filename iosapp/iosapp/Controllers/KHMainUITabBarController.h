//
//  KHMainUITabBarController.h
//  iosapp
//
//  Created by Mac on 10/25/14.
//  Copyright (c) 2014 Kindhat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../Utility/KHExternalIdType.h"
#import "../Models/KHUser.h"

@interface KHMainUITabBarController : UITabBarController<UITabBarControllerDelegate>

@property(strong, nonatomic) NSString* externalId;
@property(assign, nonatomic) KHExternalIdType externalIdType;
@property(strong, nonatomic) KHUser* khUser;

@end
