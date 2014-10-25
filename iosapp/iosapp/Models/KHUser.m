//
//  KHUser.m
//  iosapp
//
//  Created by Mac on 10/20/14.
//  Copyright (c) 2014 Kindhat. All rights reserved.
//

#import "KHUser.h"

@implementation KHUser

@synthesize userId;
@synthesize name;
@synthesize postalCode;
@synthesize aboutMe;
@synthesize image;
@synthesize email;
@synthesize termsAndConditions;
@synthesize externalIdType;
@synthesize externalId;
@synthesize requests;
@synthesize responses;

- (void) map: (NSDictionary*) jsonData{
    userId = [[jsonData objectForKey:@"_id"] stringValue];
    name = [[jsonData objectForKey:@"_name"] stringValue];
    postalCode = [[jsonData objectForKey:@"_postalCode"] stringValue];
    aboutMe = [[jsonData objectForKey:@"_aboutMe"] stringValue];
    image = [[jsonData objectForKey:@"_image"] stringValue];
    email = [[jsonData objectForKey:@"_email"] stringValue];
    termsAndConditions = [[jsonData objectForKey:@"_termsAndConditions"] stringValue];
    externalIdType = [[jsonData objectForKey:@"_externalIdType"] stringValue];
    externalId = [[jsonData objectForKey:@"_externalId"] stringValue];
    requests = [[jsonData objectForKey:@"_requests"] stringValue];
    responses = [[jsonData objectForKey:@"_responses"] stringValue];
}

- (BOOL) requiredFieldsMet {
    return true;
}

@end
