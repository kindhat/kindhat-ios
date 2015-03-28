//
//  KHGoogleGeoCodingAddressReult
//  iosapp
//
//  Created by Mac on 10/20/14.
//  Copyright (c) 2014 Kindhat. All rights reserved.
//

#include <Foundation/Foundation.h>
#include "KHGoogleGeoCodingAddressComponent.h"
#include "KHGoogleGeoCodingGeometry.h"

@interface KHGoogleGeoCodingAddressResult : NSObject

@property NSArray * addressComponents;
@property NSString * formattedAddress;
@property KHGoogleGeoCodingGeometry * geometry;
@property NSString * placeId;
@property NSArray * types;

- (void) deserialize: (NSDictionary*) jsonData;

@end