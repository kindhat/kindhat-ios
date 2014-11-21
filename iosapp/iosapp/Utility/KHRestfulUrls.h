//
//  KHRestfulUrls.h
//  iosapp
//
//  Created by Mac on 10/11/14.
//  Copyright (c) 2014 Kindhat. All rights reserved.
//

#include <Foundation/Foundation.h>
#include "KHExternalIdType.h"

@interface KHRestfulUrls : NSObject

- (NSString*) getUserByExternalId:(NSString*)externalId withExternalIdType:(KHExternalIdType*)externalIdType;

- (NSString*) postUser;

- (NSString*) putUser;

@end
