//
//  KHController.m
//  iosapp
//
//  Created by Mac on 10/11/14.
//  Copyright (c) 2014 Kindhat. All rights reserved.
//

#import "KHController.h"
#import "KHRestfulUrls.h"

@implementation KHController

NSString *const contenTypeHeaderName = @"content-type";
NSString *const contenTypeHeaderValue = @"application/json;charset=UTF-8";
NSString *const getMethod = @"GET";
NSString *const postMethod = @"POST";
NSString *const putMethod = @"PUT";

-(void) getItemAsync:(NSString*)url
         callHandler:(void (^)(NSURLResponse*, NSData*, NSError*))handler {
    [self callApiAsync: url
            withMethod: getMethod
           callHandler: handler];
}

-(void) getItemSync:(NSString*)url
        callHandler:(void (^)(NSURLResponse*, NSData*, NSError*))handler {
    [self callApiSync: url
           withMethod: getMethod
          callHandler: handler];
}

-(void) postItemAsync:(NSString*)url
                 item: (NSData*) data
          callHandler:(void (^)(NSURLResponse*, NSData*, NSError*))handler {
    [self callApiAsync:url
            withMethod: postMethod
              withData: data
           callHandler: handler];
}

-(void) postItemSync:(NSString*)url
                item: (NSData*) data
         callHandler:(void (^)(NSURLResponse*, NSData*, NSError*))handler {
    [self callApiSync:url
           withMethod: postMethod
             withData: data
          callHandler: handler];
}

-(void) putItemAsync:(NSString*)url
                item: (NSData*) data
         callHandler:(void (^)(NSURLResponse*, NSData*, NSError*))handler {
    [self callApiAsync:url
            withMethod: postMethod
              withData: data
           callHandler: handler];
}

-(void) putItemSync:(NSString*)url
               item: (NSData*) data
        callHandler:(void (^)(NSURLResponse*, NSData*, NSError*))handler {
    [self callApiSync:url
           withMethod: postMethod
             withData: data
          callHandler: handler];
}

- (void) callApiAsync:(NSString*)url
           withMethod:(NSString*)method
          callHandler:(void (^)(NSURLResponse*, NSData*, NSError*))handler{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]init];
    [request setURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:method];
    [request setValue:contenTypeHeaderValue forHTTPHeaderField:contenTypeHeaderName];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:handler];
}

- (void) callApiAsync:(NSString*)url
           withMethod:(NSString*)method
             withData:(NSData*)data
          callHandler:(void (^)(NSURLResponse*, NSData*, NSError*))handler{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]init];
    [request setURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:method];
    [request setHTTPBody:data];
    [request setValue:contenTypeHeaderValue forHTTPHeaderField:contenTypeHeaderName];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:handler];
}

- (void) callApiSync:(NSString*)url
          withMethod:(NSString*)method
         callHandler:(void (^)(NSURLResponse*, NSData*, NSError*))handler{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]init];
    [request setURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:method];
    [request setValue:contenTypeHeaderValue forHTTPHeaderField:contenTypeHeaderName];
    NSURLResponse *response = nil;
    NSError *error = nil;
    NSData *responseData = [NSURLConnection sendSynchronousRequest: request
                                                 returningResponse: &response
                                                             error: &error];
    handler(response, responseData, error);
}

- (void) callApiSync:(NSString*)url
          withMethod:(NSString*)method
            withData:(NSData*)data
         callHandler:(void (^)(NSURLResponse*, NSData*, NSError*))handler{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]init];
    [request setURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:method];
    [request setHTTPBody:data];
    [request setValue:contenTypeHeaderValue forHTTPHeaderField:contenTypeHeaderName];
    NSURLResponse *response = nil;
    NSError *error = nil;
    NSData *responseData = [NSURLConnection sendSynchronousRequest: request
                                                 returningResponse: &response
                                                             error: &error];
    handler(response, responseData, error);
}

@end