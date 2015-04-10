//
//  KHUITabBarLinkedStoryboard.h
//  iosapp
//
//  Created by Mac on 3/28/15.
//  Copyright (c) 2015 Kindhat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KHUITabBarLinkedStoryboard : UIStoryboardSegue

+ (UIViewController *)sceneNamed:(NSString *)identifier;

@end