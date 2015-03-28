//
//  KHGoogleGeoCodingCoordinate
//  iosapp
//
//  Created by Mac on 10/20/14.
//  Copyright (c) 2014 Kindhat. All rights reserved.
//

#include <Foundation/Foundation.h>

@interface KHGoogleGeoCodingCoordinate : NSObject

@property double latitude;
@property double longitude;

- (void) deserialize: (NSDictionary*) jsonData;

@end