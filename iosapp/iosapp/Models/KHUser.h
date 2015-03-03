//
//  KHUser.h
//  iosapp
//
//  Created by Mac on 10/20/14.
//  Copyright (c) 2014 Kindhat. All rights reserved.
//

#include <Foundation/Foundation.h>
#include "KHApiKey.h"
#include "../Utility/KHExternalIdType.h"

@interface KHUser : NSObject

+ (NSString*) userUrlConfigurationName;

@property KHApiKey * identifier;
@property NSString * name;
@property NSString * street;
@property NSString * postalCode;
@property NSString * aboutMe;
@property NSString * image;
@property NSString * email;
@property BOOL termsAndConditions;
@property KHExternalIdType externalIdType;
@property NSString * externalId;
@property NSString * requests;
@property NSString * responses;

- (void) deserialize: (NSDictionary*) jsonData;

- (NSData*) serialize;

- (BOOL) requiredFieldsMet;

@end