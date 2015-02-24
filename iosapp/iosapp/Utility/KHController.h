//
//  Controller.h
//  iosapp
//
//  Created by Mac on 10/11/14.
//  Copyright (c) 2014 Kindhat. All rights reserved.
//

#include <Foundation/Foundation.h>
#include "../Models/KHUser.h"
#include "KHExternalIdType.h"

@interface KHController : NSObject

-(void) getItemAsync:(NSString*)url
         callHandler:(void (^)(NSURLResponse*, NSData*, NSError*))handler;

-(void) getItemSync:(NSString*)url
        callHandler:(void (^)(NSURLResponse*, NSData*, NSError*))handler;

-(void) postItemAsync:(NSString*)url
                 item: (NSData*)data
          callHandler:(void (^)(NSURLResponse*, NSData*, NSError*))handler;

-(void) postItemSync:(NSString*)url
                item: (NSData*)data
         callHandler:(void (^)(NSURLResponse*, NSData*, NSError*))handler;

-(void) putItemAsync:(NSString*)url
                item: (NSData*)data
         callHandler:(void (^)(NSURLResponse*, NSData*, NSError*))handler;

-(void) putItemSync:(NSString*)url
               item: (NSData*)data
        callHandler:(void (^)(NSURLResponse*, NSData*, NSError*))handler;

@end

