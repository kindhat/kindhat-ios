//
//  KHSendRequestUIViewController.m
//  iosapp
//
//  Created by Mac on 3/4/15.
//  Copyright (c) 2015 Kindhat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KHSendRequestUIViewController.h"
#import "../Utility/KHConfiguration.h"
#import "../Utility/KHController.h"

@implementation KHSendRequestUIViewController

@synthesize khRequest;

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)sendRequestClicked:(id)sender
{
    NSString *requestUrl = [KHConfiguration getConfiguration:[KHRequest requestUrlConfigurationName]];
    
    KHController *khController = [[KHController alloc] init];
    
    [khController postItemAsync:requestUrl
                           item:[[self khRequest] serialize]
                    callHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                            [self handleCall:response
                                    withData:data
                                   withError:error];
                        }];
}

- (void) handleCall:(NSURLResponse*)response
           withData:(NSData*)data
          withError:(NSError*)error {
    
    if(error == nil)
    {
        //not sure we should do anything because the request is done
        //and i believe this controller will be out of the heap when this returns...
    }
    else
    {
        //seriously need to come up with a error handling framework
    }
}


@end
