//
//  KHConfiguration.m
//  iosapp
//
//  Created by Mac on 2/8/15.
//  Copyright (c) 2015 Kindhat. All rights reserved.
//

#import "KHConfiguration.h"
#import "KHController.h"

@implementation KHConfiguration

static NSString *const configurationUrl = @"http://localhost:8888/_ah/api/configurationendpoint/v1/configuration";
static NSString *const googleApiKeyName = @"kh.google.api.key";
static NSString *const name = @"name";
static NSString *const value = @"value";
static NSString *const items = @"items";

NSMutableDictionary *configuration;

+ (NSString*) googleApiKey {
    return googleApiKeyName;
}

+ (void) loadConfiguration {
    
    KHController *khController = [[KHController alloc]init];
        
    [khController getItemSync:configurationUrl
                  callHandler:^(NSURLResponse *response,
                                NSData *data,
                                NSError *error){
        if (data.length > 0 && error == nil)
        {
            configuration = [[NSMutableDictionary alloc] init];
            
            id configurationItems = [NSJSONSerialization JSONObjectWithData:data
                                                                      options:0
                                                                        error:NULL];
            
            id configurationObjects = [configurationItems objectForKey: items];
            
            for (NSDictionary* configurationObject in configurationObjects) {
                [configuration setValue:[configurationObject objectForKey:value]
                                 forKey:[configurationObject objectForKey:name]];
            }
                
        }
    }];
}

+ (NSString*) getConfiguration:(NSString*)configurationName {
    if(configuration == nil)
    {
        [self loadConfiguration];
    }
    return [configuration objectForKey:configurationName];
}

@end