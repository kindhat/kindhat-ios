//
//  KHGoogleGeoCodingAddressResult
//  iosapp
//
//  Created by Mac on 3/6/15.
//  Copyright (c) 2015 Kindhat. All rights reserved.
//

#import "KHGoogleGeoCodingAddressResult.h"

@implementation KHGoogleGeoCodingAddressResult

@synthesize addressComponents;
@synthesize formattedAddress;
@synthesize geometry;
@synthesize placeId;
@synthesize types;

- (void) deserialize:(NSDictionary *)jsonData{
    
    id addressComponentObjects = [jsonData objectForKey: @"address_components"];
    NSMutableArray *nsMutableArrayAddressComponents = [NSMutableArray array];
    for (NSDictionary* addressComponent in addressComponentObjects) {
        KHGoogleGeoCodingAddressComponent *khGoogleGeoCodingAddressComponent = [[KHGoogleGeoCodingAddressComponent alloc]init];
        [khGoogleGeoCodingAddressComponent deserialize:addressComponent];
        [nsMutableArrayAddressComponents addObject:khGoogleGeoCodingAddressComponent];
    }
    [self setAddressComponents:nsMutableArrayAddressComponents];
    
    [self setFormattedAddress: [jsonData objectForKey:@"formatted_address"]];
    
    KHGoogleGeoCodingGeometry *khGoogleGeoCodingGeometry = [[KHGoogleGeoCodingGeometry alloc]init];
    [khGoogleGeoCodingGeometry deserialize: [jsonData objectForKey:@"geometry"]];
    [self setGeometry:khGoogleGeoCodingGeometry];
    
    [self setPlaceId:[jsonData objectForKey:@"place_id"]];
    
    id typeObjects = [jsonData objectForKey: @"types"];
    NSMutableArray *nsMutableArrayTypes = [NSMutableArray array];
    for (NSString* typeObject in typeObjects) {
        [nsMutableArrayTypes addObject:typeObject];
    }
    [self setTypes:nsMutableArrayTypes];
}

@end

