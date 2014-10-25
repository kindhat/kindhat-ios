//
//  KHRestfulUrls.m
//  iosapp
//
//  Created by Mac on 10/11/14.
//  Copyright (c) 2014 Kindhat. All rights reserved.
//

#import "KHRestfulUrls.h"

@implementation KHRestfulUrls

- (NSString*) getUserById:(NSString*)userId {
    
    NSString *url = @"url";
    return [url stringByAppendingString:userId];
}

@end
