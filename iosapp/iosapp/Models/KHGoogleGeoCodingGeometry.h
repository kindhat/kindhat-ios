//
//  KHGoogleGeoCodingGeometry
//  iosapp
//
//  Created by Mac on 10/20/14.
//  Copyright (c) 2014 Kindhat. All rights reserved.
//

#include <Foundation/Foundation.h>
#include "KHGoogleGeoCodingCoordinate.h"
#include "KHGoogleGeoCodingViewport.h"


@interface KHGoogleGeoCodingGeometry : NSObject

@property KHGoogleGeoCodingCoordinate * location;
@property NSString * locationType;
@property KHGoogleGeoCodingViewport * viewport;

- (void) deserialize: (NSDictionary*) jsonData;

@end