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
#import "../../Utility/KHLiterals.h"

@implementation KHSendRequestUIViewController

@synthesize khRequest;
@synthesize khUser;

static NSString *const borrowItemMessageName = @"kh.ios.borrowitemmessage";
static NSString *const borrowServiceMessageName = @"kh.ios.borrowservicemessage";
static NSString *const dateFormatString = @"MM/dd/yyyy";

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:dateFormatString];
    
    [[self userUILabel] setText: [[self khUser] name]];
    [[self itemUILabel] setText: [[self khRequest] item]];
    
    NSString *message = [KHLiterals emptyString];
    if([[self khRequest]requestType]==Item)
    {
        message = [KHConfiguration getConfiguration:borrowItemMessageName];
        [[self toBeReturnedUILabel] setHidden:NO];
        [[self returnDateUILabel] setHidden:NO];
        [[self returnDateUILabel] setText:[dateFormat stringFromDate:[[self khRequest]returnDate]]];
    }
    else
    {
        message = [KHConfiguration getConfiguration:borrowServiceMessageName];
        [[self toBeReturnedUILabel] setHidden:YES];
        [[self returnDateUILabel] setHidden:YES];
    }
    
    [[self messageUILabel] setText:message];
    [[self borrowDateUILabel] setText:[dateFormat stringFromDate:[[self khRequest]borrowDate]]];
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
