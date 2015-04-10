//
//  KHSendRequestUIViewController.m
//  iosapp
//
//  Created by Mac on 3/4/15.
//  Copyright (c) 2015 Kindhat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KHSendRequestUIViewController.h"
#import "../../Utility/KHConfiguration.h"
#import "../../Utility/KHController.h"

@implementation KHSendRequestUIViewController

static NSString *const borrowMessageName = @"kh.ios.borrowmessage";
static NSString *const borrowDateMessageName = @"kh.ios.borrowdatemessage";
static NSString *const serviceMessageName = @"kh.ios.servicemessage";

@synthesize khRequest;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *message = [NSString stringWithFormat:[KHConfiguration getConfiguration:borrowMessageName],
                         [[self khUser] name],
                         [[self khRequest] item]];
    
    NSString *dateMessage = [NSString stringWithFormat:[KHConfiguration getConfiguration:borrowDateMessageName],
                             [[self khUser] name],
                             [[self khRequest] item]];
    
    [[self messageUILabel] setText:message];
    [[self dateUILabel] setText:dateMessage];
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
