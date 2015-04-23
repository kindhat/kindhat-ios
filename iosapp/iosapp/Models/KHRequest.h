// KHRequest.h
// iosapp

// Created by Mac
// Copyright (c) 2014 Kindhat. All rights reserved.

#include <Foundation/Foundation.h>
#import "KHApiKey.h"
#import "KHRequestType.h"

@interface KHRequest : NSObject

+ (NSString*) requestUrlConfigurationName;

@property long identifier;
@property long userId;
@property NSString * item;
@property KHRequestType requestType;
@property NSString * category;
@property NSDate * borrowDate;
@property NSDate * returnDate;
@property NSString * message;

- (void) deserialize: (NSDictionary*) jsonData;

- (NSData*) serialize;

@end