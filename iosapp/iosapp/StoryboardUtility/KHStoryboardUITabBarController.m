//
//  KHStoryboardUITabBarController.m
//  iosapp
//
//  Created by Mac on 4/20/15.
//  Copyright (c) 2015 Kindhat. All rights reserved.
//

#import "KHStoryboardUITabBarController.h"

@implementation KHStoryboardUITabBarController

- (void)setTabBarControllerWithStoryboards:(NSArray *)tabs {
    
    NSMutableArray * instantiatedTabs = [NSMutableArray arrayWithCapacity:[tabs count]];
    
    // Instantiates each of the storyboards.
    [tabs enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL * stop) {
        
        NSAssert([obj isKindOfClass:[UIStoryboard class]],
                 @"Expected UIStoryboard, got %@",
                 NSStringFromClass([obj class]));
        
        [instantiatedTabs addObject:[obj instantiateInitialViewController]];
    }];
    
    [self setViewControllers:instantiatedTabs];
}

@end