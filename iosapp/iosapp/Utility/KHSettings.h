//
//  KHSettings.h
//  iosapp
//
//  Created by Mac on 10/24/14.
//  Copyright (c) 2014 Kindhat. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KHSettings : NSObject

+ (instancetype)defaultSettings;

@property (nonatomic, assign) BOOL shouldSkipLogin;

@end
