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
@synthesize name;
@synthesize street;
@synthesize postalCode;
@synthesize aboutMe;
@synthesize image;
@synthesize email;
@synthesize termsAndConditions;
@synthesize externalIdType;
@synthesize externalId;
@synthesize requests;
@synthesize responses;

static NSString *const _userUrlConfigurationName = @"kh.ios.userurl";
static NSString *const _getUserUrlConfigurationName = @"kh.ios.getuserurl";
static NSString *const _googleGeocodingUrlName = @"kh.google.geocoding.url";

+ (NSString*) userUrlConfigurationName {
    return _userUrlConfigurationName;
}

+ (NSString*) getUserUrlConfigurationName {
    return _getUserUrlConfigurationName;
}

+ (NSString*) googleGeocodingUrlName {
    return _getUserUrlConfigurationName;
}

- (void) deserialize:(NSDictionary *)jsonData{

    NSNumber *nsNumberIdentifier = [jsonData objectForKey:@"id"];
    [self setIdentifier: [nsNumberIdentifier longLongValue]];
    
    [self setName: [jsonData objectForKey:@"name"]];
    [self setStreet: [jsonData objectForKey:@"street"]];
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
    NSMutableDictionary *nsMutableDictionary = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                  (self.name != nil) ? self.name : @"", @"name",
                                  (self.street != nil) ? self.street : @"", @"street",
                                  (self.postalCode != nil) ? self.postalCode : @"", @"postalCode",
                                  (self.aboutMe != nil) ? self.aboutMe : @"", @"aboutMe",
                                  (self.image != nil) ? self.image : @"", @"image",
                                  (self.email != nil) ? self.email : @"", @"email",
                                  [NSNumber numberWithBool: self.termsAndConditions], @"termsAndConditions",
                                  [NSNumber numberWithInt: self.externalIdType], @"externalIdType",
                                  (self.externalId != nil) ? self.externalId : @"", @"externalId",
                                  nil];
    
    //we only want to serialize id if it actually exists
    //this is the case when creating a new (POST) item
    //if id is set and it is zero, the googl app engine
    //back end will throw an excpetion that id cannot = 0
    if(self.identifier != 0) {
        [nsMutableDictionary setObject:[NSNumber numberWithLongLong: self.identifier]
                                forKey:@"id"];
    }
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:nsMutableDictionary
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:nil];
    return jsonData;
}

- (BOOL) requiredFieldsMet {
    return (([self name] != (id)[NSNull null] || [[self name] length] > 0 )
            && ([self street] != (id)[NSNull null] || [[self street] length] > 0 )
            && ([self postalCode] != (id)[NSNull null] || [[self postalCode] length] > 0 )
            && ([self email] != (id)[NSNull null] || [[self email] length] > 0 )
            && [self termsAndConditions] > 0);
}

@end
