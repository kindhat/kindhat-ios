//
//  KHLiterals.m
//  iosapp
//
//  Created by Mac on 4/13/15.
//  Copyright (c) 2015 Kindhat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KHLiterals.h"

@implementation KHLiterals

static NSString *const empty = @"";
static NSString *const space = @" ";
static NSString *const plus = @"+";

+ (NSString *)emptyString {
    return empty;
}

+ (NSString *)spaceString {
    return space;
}

+ (NSString *)plusString {
    return plus;
}

@end