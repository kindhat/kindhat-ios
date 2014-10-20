//
//  Controller.h
//  iosapp
//
//  Created by Mac on 10/11/14.
//  Copyright (c) 2014 Kindhat. All rights reserved.
//

#include <Foundation/Foundation.h>

@interface Controller : NSObject

@property NSString *const contenTypeHeaderName;
@property NSString *const contenTypeHeaderValue;

- (void) callApi:(NSString*)url withMethod:(NSString*)method callHandler:(void (^)(NSURLResponse*, NSData*, NSError*))handler;

@end

