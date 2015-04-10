//
//  KHGoogleGeoCodingAddressResults
//  iosapp
//
//  Created by Mac on 3/6/15.
//  Copyright (c) 2015 Kindhat. All rights reserved.
//

#import "KHAddressResults.h"
#import "KHAddressResult.h"

@implementation KHAddressResults

@synthesize addresses;

- (void) deserialize:(NSDictionary *)jsonData{
    id addressResultObjects = [jsonData objectForKey: @"items"];
    NSMutableArray *nsMutableArrayAddressResults = [NSMutableArray array];
    for (NSDictionary* addressResult in addressResultObjects) {
        KHAddressResult *khAddressResult = [[KHAddressResult alloc]init];
        [khAddressResult deserialize:addressResult];
        [nsMutableArrayAddressResults addObject:khAddressResult];
    }
    [self setAddresses:nsMutableArrayAddressResults];
}


@end

