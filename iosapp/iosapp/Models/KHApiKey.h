//
//  KHApiKey.h
//  iosapp
//
//  Created by Mac on 11/20/14.
//  Copyright (c) 2014 Kindhat. All rights reserved.
//

#include <Foundation/Foundation.h>
#include "KHApiAppIdNamespace.h"

@interface KHApiKey : NSObject

@property NSString *appId;
@property BOOL complete;  // boolValue

// identifier property maps to 'id' in JSON (to avoid Objective C's 'id').
@property long identifier;  // longLongValue

@property NSString *kind;
@property NSString *name;

@property KHApiAppIdNamespace *appIdNamespace;

@property KHApiKey *parent;

- (void) deserialize: (NSDictionary*) jsonData;

- (NSDictionary*) serialize;

@end
