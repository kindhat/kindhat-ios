//
//  KHMainUITabBarController.h
//  iosapp
//
//  Created by Mac on 10/25/14.
//  Copyright (c) 2014 Kindhat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KHMainUITabBarController : UITabBarController

@property(nonatomic) NSString *externalId;
@property(nonatomic) KHExternalIdType *externalIdType;

@end
