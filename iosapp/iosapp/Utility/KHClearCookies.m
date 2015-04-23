//
//  KHClearCookies.m
//  iosapp
//
//  Created by Mac on 4/23/15.
//  Copyright (c) 2015 Kindhat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KHClearCookies.h"

@implementation KHClearCookies

-(void) clearCookies:(NSString*)url
{
    NSHTTPCookieStorage* cookies = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    NSArray* urlCookies = [cookies cookiesForURL:[NSURL URLWithString:url]];
    
    for (NSHTTPCookie* cookie in urlCookies) {
        [cookies deleteCookie:cookie];
    }
}

@end
