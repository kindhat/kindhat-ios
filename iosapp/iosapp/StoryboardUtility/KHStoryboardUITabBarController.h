//
//  KHStoryboardUITabBarController.h
//  iosapp
//
//  Created by Mac on 4/20/15.
//  Copyright (c) 2015 Kindhat. All rights reserved.
//

#include <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface KHStoryboardUITabBarController : UITabBarController<UITabBarControllerDelegate>

- (void)setTabBarControllerWithStoryboards:(NSArray *)tabs;

@end