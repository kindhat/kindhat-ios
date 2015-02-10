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

-(void) getConfiguration:(void (^)(NSURLResponse*, NSData*, NSError*))handler {
    
    KHRestfulUrls *khRestfulUrls = [[KHRestfulUrls alloc] init];
    
    [self
     callApi:[khRestfulUrls getConfiguration]
     withMethod: getMethod
     callHandler: handler];
}

-(void) getUserByExternalId:(NSString*)externalId
             withExternalIdType:(KHExternalIdType *)externalIdType
             callHandler:(void (^)(NSURLResponse*, NSData*, NSError*))handler {
    
    KHRestfulUrls *khRestfulUrls = [[KHRestfulUrls alloc] init];
    
    [self
     callApi:[khRestfulUrls getUserByExternalId:externalId withExternalIdType:externalIdType]
     withMethod: getMethod
     callHandler: handler];
}

-(void) postUser:(KHUser*)khUser
     callHandler:(void (^)(NSURLResponse*, NSData*, NSError*))handler {
    
    KHRestfulUrls *khRestfulUrls = [[KHRestfulUrls alloc] init];
    
    [self
     callApi:[khRestfulUrls postUser]
     withMethod: postMethod
     withData: [khUser serialize]
     callHandler: handler];

}

-(void) putUser:(KHUser*)khUser
    callHandler:(void (^)(NSURLResponse*, NSData*, NSError*))handler {
    
    KHRestfulUrls *khRestfulUrls = [[KHRestfulUrls alloc] init];
    
    [self
     callApi:[khRestfulUrls putUser]
     withMethod: putMethod
     withData: [khUser serialize]
     callHandler: handler];
    
}

- (void) callApi:(NSString*)url
            withMethod:(NSString*)method
                callHandler:(void (^)(NSURLResponse*, NSData*, NSError*))handler{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]init];
    [request setURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:method];
    [request setValue:contenTypeHeaderValue forHTTPHeaderField:contenTypeHeaderName];
    [NSURLConnection sendAsynchronousRequest:
       request
       queue:[NSOperationQueue mainQueue]
       completionHandler:handler];
}

- (void) callApi:(NSString*)url
             withMethod:(NSString*)method
                withData:(NSData*)data
                    callHandler:(void (^)(NSURLResponse*, NSData*, NSError*))handler{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]init];
    [request setURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:method];
    [request setHTTPBody:data];
    [request setValue:contenTypeHeaderValue forHTTPHeaderField:contenTypeHeaderName];
    [NSURLConnection sendAsynchronousRequest:
     request
     queue:[NSOperationQueue mainQueue]
     completionHandler:handler];
}

@end