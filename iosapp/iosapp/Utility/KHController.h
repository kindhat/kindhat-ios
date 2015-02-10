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

-(void) getConfiguration:(void (^)(NSURLResponse*, NSData*, NSError*))handler;

-(void) getUserByExternalId:(NSString*)externalId
         withExternalIdType:(KHExternalIdType *)externalIdType
                callHandler:(void (^)(NSURLResponse*, NSData*, NSError*))handler;

-(void) postUser:(KHUser*)khUser
                callHandler:(void (^)(NSURLResponse*, NSData*, NSError*))handler;

-(void) putUser:(KHUser*)khUser
                callHandler:(void (^)(NSURLResponse*, NSData*, NSError*))handler;
@end

