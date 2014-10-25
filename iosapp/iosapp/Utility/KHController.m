//
//  KHController.m
//  iosapp
//
//  Created by Mac on 10/11/14.
//  Copyright (c) 2014 Kindhat. All rights reserved.
//

#import "KHController.h"

@implementation KHController

NSString *const contenTypeHeaderName = @"content-type";
NSString *const contenTypeHeaderValue = @"application/json;charset=UTF-8";

- (void) callApi:(NSString*)url withMethod:(NSString*)method callHandler:(void (^)(NSURLResponse*, NSData*, NSError*))handler{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]init];
    [request setURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:method];
    [request setValue:contenTypeHeaderValue forHTTPHeaderField:contenTypeHeaderName];
    [NSURLConnection sendAsynchronousRequest:
       request
       queue:[NSOperationQueue mainQueue]
       completionHandler:handler];
}

@end