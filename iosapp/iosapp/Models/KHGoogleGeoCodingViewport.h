//
//  KHGoogleGeoCodingViewport
//  iosapp
//
//  Created by Mac on 10/20/14.
//  Copyright (c) 2014 Kindhat. All rights reserved.
//

#include <Foundation/Foundation.h>
#import "KHGoogleGeoCodingCoordinate.h"


@interface KHGoogleGeoCodingViewport : NSObject

@property KHGoogleGeoCodingCoordinate * northEast;
@property KHGoogleGeoCodingCoordinate * southWest;

- (void) deserialize: (NSDictionary*) jsonData;

@end