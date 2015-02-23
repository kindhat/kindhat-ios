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

NSDictionary *configuration;

+ (void) loadConfiguration {
    
    if (configuration == nil) {
                
        configuration = [[NSDictionary alloc]initWithObjectsAndKeys:@"http://graph.facebook.com/%@/picture?type=square",@"kh.ios.facebookimageurl",nil];
        
        /*
        KHController *khController = [[KHController alloc]init];
        
        [khController getConfiguration:^(NSURLResponse *response,
                                         NSData *data,
                                         NSError *error){
            if (data.length > 0 && error == nil)
            {
                id configurationObjects = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
                for (NSDictionary* configurationObject in configurationObjects) {
                    [configuration
                     setValue:[configurationObject objectForKey:@"value"]
                     forKey:[configurationObject objectForKey:@"name"]];
                }
                
            }
        }];
         */
    }
}

+ (NSString*) getConfiguration:(NSString*)configurationName {
    
    return [configuration objectForKey:configurationName];
}

@end