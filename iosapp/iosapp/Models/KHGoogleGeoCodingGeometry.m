//
//  KHGoogleGeoCodingGeometry
//  iosapp
//
//  Created by Mac on 3/6/15.
//  Copyright (c) 2015 Kindhat. All rights reserved.
//

#import "KHGoogleGeoCodingGeometry.h"

@implementation KHGoogleGeoCodingGeometry

@synthesize location;
@synthesize locationType;
@synthesize viewport;

- (void) deserialize:(NSDictionary *)jsonData{
    
    KHGoogleGeoCodingCoordinate *coordinateLocation = [[KHGoogleGeoCodingCoordinate alloc]init];
    [coordinateLocation deserialize:[jsonData objectForKey:@"location"]];
    [self setLocation: coordinateLocation];
    
    [self setLocationType: [jsonData objectForKey:@"location_type"]];
    
    KHGoogleGeoCodingViewport *khGoogleGeoCodingViewport = [[KHGoogleGeoCodingViewport alloc]init];
    [khGoogleGeoCodingViewport deserialize:[jsonData objectForKey:@"viewport"]];
    [self setViewport:khGoogleGeoCodingViewport];
}

@end

