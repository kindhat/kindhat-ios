//
//  KHApiAppIdNamespace.h
//  iosapp
//
//  Created by Mac on 3/6/15.
//  Copyright (c) 2015 Kindhat. All rights reserved.
//

#include <Foundation/Foundation.h>

@interface KHApiAppIdNamespace : NSObject

- (id)initWithAppId:(NSString*)initAppId;

@property NSString * appId;
@property NSString * appNamespace;

- (void) deserialize: (NSDictionary*) jsonData;

- (NSDictionary*) serialize;

@end