//
//  KHRestfulUrls.m
//  iosapp
//
//  Created by Mac on 10/11/14.
//  Copyright (c) 2014 Kindhat. All rights reserved.
//

#import "KHRestfulUrls.h"

@implementation KHRestfulUrls

- (NSString*) getUserByExternalId:(NSString*)externalId withExternalIdType:(KHExternalIdType*)externalIdType{
    
    NSString *url = @"http://localhost:8888/_ah/api/userendpoint/v1/user/%@/%@";
    NSString *returnString = [NSString stringWithFormat: url,
                              externalId,
                              KHExternalIdType_toString[(int)externalIdType]];
    return returnString;
}

@end
