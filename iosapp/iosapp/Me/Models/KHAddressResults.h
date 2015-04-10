//
//  KHAddressResults
//  iosapp
//
//  Created by Mac on 10/20/14.
//  Copyright (c) 2014 Kindhat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KHAddressResults.h"

@interface KHAddressResults : NSObject

@property NSArray * addresses;

- (void) deserialize: (NSDictionary*) jsonData;

@end