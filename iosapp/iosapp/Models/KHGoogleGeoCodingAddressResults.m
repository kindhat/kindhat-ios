//
//  KHGoogleGeoCodingAddressResults
//  iosapp
//
//  Created by Mac on 3/6/15.
//  Copyright (c) 2015 Kindhat. All rights reserved.
//

#import "KHGoogleGeoCodingAddressResults.h"

@implementation KHGoogleGeoCodingAddressResults

@synthesize results;
@synthesize status;

- (void) deserialize:(NSDictionary *)jsonData{

    id resultObjects = [jsonData objectForKey: @"results"];
    NSMutableArray *nsMutableArrayResults = [NSMutableArray array];
    for (NSDictionary* result in resultObjects) {
        KHGoogleGeoCodingAddressResult *khGoogleGeoCodingAddressResult = [[KHGoogleGeoCodingAddressResult alloc]init];
        [khGoogleGeoCodingAddressResult deserialize:result];
        [nsMutableArrayResults addObject:khGoogleGeoCodingAddressResult];
    }
    [self setResults:nsMutableArrayResults];

    [self setStatus: [jsonData objectForKey:@"status"]];
}


@end

