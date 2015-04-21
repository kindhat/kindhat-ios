//
//  KHMainUITabBarController.h
//  iosapp
//
//  Created by Mac on 10/25/14.
//  Copyright (c) 2014 Kindhat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../../StoryboardUtility/KHStoryboardUITabBarController.h"
#import "../../Models/KHUser.h"

@interface KHMainUITabBarController : KHStoryboardUITabBarController

@property(strong, nonatomic) KHUser* khUser;

@end
