//
//  KHConfiguration.h
//  iosapp
//
//  Created by Mac on 2/8/15.
//  Copyright (c) 2015 Kindhat. All rights reserved.
//

#include <Foundation/Foundation.h>

@interface KHConfiguration : NSObject

+ (void) loadConfiguration;

+ (NSString*) getConfiguration:(NSString*)configurationName;

@end
