//
//  KHGoogleGeoCodingCoordinate
//  iosapp
//
//  Created by Mac on 3/6/15.
//  Copyright (c) 2015 Kindhat. All rights reserved.
//

#import "KHGoogleGeoCodingCoordinate.h"

@implementation KHGoogleGeoCodingCoordinate

@synthesize latitude;
@synthesize longitude;

- (void) deserialize:(NSDictionary *)jsonData{
    
    NSNumber *nsNumberLatitude = [jsonData objectForKey:@"lat"];
    NSNumber *nsNumberLongitude = [jsonData objectForKey:@"lng"];
    
    [self setLatitude: [nsNumberLatitude doubleValue]];
    [self setLongitude: [nsNumberLongitude doubleValue]];
}

@end
