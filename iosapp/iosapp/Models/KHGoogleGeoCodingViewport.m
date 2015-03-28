//
//  KHGoogleGeoCodingViewport
//  iosapp
//
//  Created by Mac on 3/6/15.
//  Copyright (c) 2015 Kindhat. All rights reserved.
//

#import "KHGoogleGeoCodingViewport.h"

@implementation KHGoogleGeoCodingViewport

@synthesize northEast;
@synthesize southWest;

- (void) deserialize:(NSDictionary *)jsonData{
    
    KHGoogleGeoCodingCoordinate *coordinateNorthEast = [[KHGoogleGeoCodingCoordinate alloc]init];
    KHGoogleGeoCodingCoordinate *coordinateSouthWest = [[KHGoogleGeoCodingCoordinate alloc]init];
    [coordinateNorthEast deserialize:[jsonData objectForKey:@"northeast"]];
    [coordinateSouthWest deserialize:[jsonData objectForKey:@"southwest"]];
    [self setNorthEast: coordinateNorthEast];
    [self setSouthWest: coordinateSouthWest];
}

@end
