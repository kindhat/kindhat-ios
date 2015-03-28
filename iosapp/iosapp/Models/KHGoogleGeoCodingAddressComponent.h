//
//  KHGoogleGeoCodingAddressComponent.h
//  iosapp
//
//  Created by Mac on 10/20/14.
//  Copyright (c) 2014 Kindhat. All rights reserved.
//

#include <Foundation/Foundation.h>

@interface KHGoogleGeoCodingAddressComponent : NSObject

@property NSString * longName;
@property NSString * shortName;
@property NSArray * types;

- (void) deserialize: (NSDictionary*) jsonData;

@end