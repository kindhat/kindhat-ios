//
//  KHUser.m
//  iosapp
//
//  Created by Mac on 10/20/14.
//  Copyright (c) 2014 Kindhat. All rights reserved.
//

#import "KHUser.h"

@implementation KHUser

@synthesize identifier;
@synthesize firstName;
@synthesize middleName;
@synthesize lastName;
@synthesize postalCode;
@synthesize aboutMe;
@synthesize image;
@synthesize email;
@synthesize termsAndConditions;
@synthesize externalIdType;
@synthesize externalId;
@synthesize requests;
@synthesize responses;

- (void) deserialize:(NSDictionary *)jsonData{
    KHApiKey *khApiKey = [[KHApiKey alloc]init];
    [khApiKey deserialize:[jsonData objectForKey:@"id"]];
    
    [self setIdentifier: khApiKey];
    [self setName: [jsonData objectForKey:@"name"]];
    [self setPostalCode: [jsonData objectForKey:@"postalCode"]];
    [self setAboutMe: [jsonData objectForKey:@"aboutMe"]];
    [self setImage: [jsonData objectForKey:@"image"]];
    [self setEmail: [jsonData objectForKey:@"email"]];
    
    NSNumber *nsNumberTermsAndConditions = [jsonData objectForKey:@"termsAndConditions"];
    [self setTermsAndConditions: [nsNumberTermsAndConditions boolValue]];
    
    NSNumber *nsExternIdType = [jsonData objectForKey:@"externalIdType"];
    [self setExternalIdType: [nsExternIdType intValue]];
    
    [self setExternalId: [jsonData objectForKey:@"externalId"]];
    [self setRequests: [jsonData objectForKey:@"requests"]];
    [self setResponses: [jsonData objectForKey:@"responses"]];
}

- (NSData*) serialize {
    NSDictionary *nsDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                  [self.identifier serialize], @"key",
                                  self.name, @"name",
                                  self.postalCode, @"postalCode",
                                  self.aboutMe, @"aboutMe",
                                  //self.image, @"image",
                                  self.email, @"email",
                                  [NSNumber numberWithBool: self.termsAndConditions], @"termsAndConditions",
                                  [NSNumber numberWithInt: self.externalIdType], @"externalIdType",
                                  self.externalId, @"externalId",
                                  nil];
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:nsDictionary options:NSJSONWritingPrettyPrinted error:nil];
    return jsonData;
}

- (BOOL) requiredFieldsMet {
    return (([self name] != (id)[NSNull null] || [[self nsame] length] > 0 )
            && ([self postalCode] != (id)[NSNull null] || [[self postalCode] length] > 0 )
            && ([self email] != (id)[NSNull null] || [[self email] length] > 0 )
            && [self termsAndConditions] > 0);
}

@end
