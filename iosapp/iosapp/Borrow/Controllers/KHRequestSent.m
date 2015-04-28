//
//  KHRequestSent.m
//  iosapp
//
//  Created by Mac on 4/27/15.
//  Copyright (c) 2015 Kindhat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KHRequestSent.h"
#import "../../Login/Controllers/KHMainUITabBarController.h"

@implementation KHRequestSent

static NSString *const mainUITabBarControllerSegueName = @"MainUITabBarController@Login";

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:mainUITabBarControllerSegueName]) {
        KHMainUITabBarController *khMainUITabBarController = segue.destinationViewController;
        [khMainUITabBarController setSelectedIndex:3];
    }
}

@end

