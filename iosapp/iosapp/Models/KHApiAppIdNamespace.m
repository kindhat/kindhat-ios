//
//  KHApiAppIdNamespace.m
//  iosapp
//
//  Created by Mac on 3/6/15.
//  Copyright (c) 2015 Kindhat. All rights reserved.
//

#import "KHApiAppIdNamespace.h"

@implementation KHApiAppIdNamespace

@synthesize appId;
@synthesize appNamespace;

- (id)initWithAppId:(NSString*)initAppId {
    
    self = [super init];
    if (self)
    {
        [self setAppId:initAppId];
    }
    return self;
}

- (void) deserialize:(NSDictionary *)jsonData{
    [self setAppId: [jsonData objectForKey:@"appId"]];
    [self setAppNamespace: [jsonData objectForKey:@"namespace"]];
}

- (NSDictionary*) serialize {
    NSDictionary *nsDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                  (self.appId != nil) ? self.appId : @"", @"appId",
                                  (self.appNamespace != nil) ? self.appNamespace : @"", @"namespace",
                                  nil];
    return nsDictionary;
}

@end

