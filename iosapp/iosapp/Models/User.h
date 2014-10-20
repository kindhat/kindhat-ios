//
//  User.h
//  iosapp
//
//  Created by Mac on 10/20/14.
//  Copyright (c) 2014 Kindhat. All rights reserved.
//

#include <Foundation/Foundation.h>

@interface User : NSObject

@property NSString * userId;
@property NSString * name;
@property NSString * postalCode;
@property NSString * aboutMe;
@property NSString * image;
@property NSString * email;
@property NSString * termsAndConditions;
@property NSString * externalIdType;
@property NSString * externalId;
@property NSString * requests;
@property NSString * responses;

- (void) map: (NSDictionary*) jsonData;

- (BOOL) requiredFieldsMet;

@end