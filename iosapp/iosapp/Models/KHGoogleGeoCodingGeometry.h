//
//  KHGoogleGeoCodingGeometry
//  iosapp
//
//  Created by Mac on 10/20/14.
//  Copyright (c) 2014 Kindhat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KHGoogleGeoCodingCoordinate.h"
#import "KHGoogleGeoCodingViewport.h"


@interface KHGoogleGeoCodingGeometry : NSObject

@property KHGoogleGeoCodingCoordinate * location;
@property NSString * locationType;
@property KHGoogleGeoCodingViewport * viewport;

- (void) deserialize: (NSDictionary*) jsonData;

@end