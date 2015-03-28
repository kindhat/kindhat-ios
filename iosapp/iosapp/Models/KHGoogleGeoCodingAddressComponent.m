//
//  KHGoogleGeoCodingAddressComponent
//  iosapp
//
//  Created by Mac on 3/6/15.
//  Copyright (c) 2015 Kindhat. All rights reserved.
//

#import "KHGoogleGeoCodingAddressComponent.h"

@implementation KHGoogleGeoCodingAddressComponent

@synthesize longName;
@synthesize shortName;
@synthesize types;

- (void) deserialize:(NSDictionary *)jsonData{

    [self setLongName: [jsonData objectForKey:@"long_name"]];
    [self setShortName: [jsonData objectForKey:@"short_name"]];
    
    id typeObjects = [jsonData objectForKey: @"types"];
    NSMutableArray *nsMutableArrayTypes = [NSMutableArray array];
    for (NSString* typeObject in typeObjects) {
        [nsMutableArrayTypes addObject:typeObject];
    }
    [self setTypes:nsMutableArrayTypes];
}

@end

