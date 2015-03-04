// KHRequest.h
// iosapp

// Created by Mac
// Copyright (c) 2014 Kindhat. All rights reserved.

#include <Foundation/Foundation.h>
#import "KHApiKey.h"

@interface KHRequest : NSObject

+ (NSString*) requestUrlConfigurationName;

@property KHApiKey * identifier;
@property KHApiKey * userId;
@property NSString * item;
@property NSString * category;
@property NSString * use;
@property NSDate * borrowDate;
@property NSDate * returnDate;
@property NSString * message;

- (void) deserialize: (NSDictionary*) jsonData;

- (NSData*) serialize;

@end