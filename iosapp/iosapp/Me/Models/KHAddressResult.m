//
//  KHAddressResult
//  iosapp
//
//  Created by Mac on 3/6/15.
//  Copyright (c) 2015 Kindhat. All rights reserved.
//

#import "KHAddressResult.h"

@implementation KHAddressResult

@synthesize street;
@synthesize city;
@synthesize state;
@synthesize postalCode;

- (void) deserialize:(NSDictionary *)jsonData{
    [self setStreet: [jsonData objectForKey:@"street"]];
    [self setCity: [jsonData objectForKey:@"city"]];
    [self setState: [jsonData objectForKey:@"state"]];
    [self setPostalCode: [jsonData objectForKey:@"postalCode"]];
}

@end

