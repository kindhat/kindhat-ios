//
//  KHRestfulUrls.m
//  iosapp
//
//  Created by Mac on 10/11/14.
//  Copyright (c) 2014 Kindhat. All rights reserved.
//

#import "KHRestfulUrls.h"

@implementation KHRestfulUrls

static NSString *const userUrl = @"http://1-dot-kindhat-service.appspot.com/_ah/api/userendpoint/v1/user";
static NSString *const configurationUrl = @"http://localhost:8888/_ah/api/configurationendpoint/v1/user";

- (NSString*) getConfiguration {
    return configurationUrl;
}

- (NSString*) getUserByExternalId:(NSString*)externalId withExternalIdType:(KHExternalIdType*)externalIdType {
    
    NSString *url = [userUrl stringByAppendingString: @"/%@/%@"];
    NSString *returnString = [NSString stringWithFormat: url,
                              externalId,
                              KHExternalIdTypeToString[(int)externalIdType]];
    return returnString;
}

- (NSString*) postUser {
    return userUrl;
}

- (NSString*) putUser {
    return userUrl;
}

@end
