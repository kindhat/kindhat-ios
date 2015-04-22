//
//  KHAddressResult
//  iosapp
//
//  Created by Mac on 10/20/14.
//  Copyright (c) 2014 Kindhat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KHAddressResult.h"

@interface KHAddressResult : NSObject

@property NSString * street;
@property NSString * city;
@property NSString * state;
@property NSString * postalCode;
@property double longitude;
@property double latitude;

- (void) deserialize: (NSDictionary*) jsonData;

@end