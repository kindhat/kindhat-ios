//
//  KHGoogleGeoCodingAddressReults
//  iosapp
//
//  Created by Mac on 10/20/14.
//  Copyright (c) 2014 Kindhat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KHGoogleGeoCodingAddressResult.h"

@interface KHGoogleGeoCodingAddressResults : NSObject

@property NSArray * results;
@property NSString * status;

- (void) deserialize: (NSDictionary*) jsonData;

@end