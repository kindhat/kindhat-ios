//
//  Controller.h
//  iosapp
//
//  Created by Mac on 10/11/14.
//  Copyright (c) 2014 Kindhat. All rights reserved.
//

#include <Foundation/Foundation.h>
#include "../Models/KHUser.h"

@interface KHController : NSObject

-(KHUser *) getUserByExternalId:(NSString*)externalId withExternalIdType:(KHExternalIdType *)externalIdType;

@end

