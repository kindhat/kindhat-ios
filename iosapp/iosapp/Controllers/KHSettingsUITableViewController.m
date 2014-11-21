//
//  KHSettingsUITableViewController.m
//  iosapp
//
//  Created by Mac on 10/31/14.
//  Copyright (c) 2014 Kindhat. All rights reserved.
//

#import "KHSettingsUITableViewController.h"
#import "KHMainUITabBarController.h"
#import "../Models/KHUser.h"
#import "../Utility/KHController.h"

@implementation KHSettingsUITableViewController

- (IBAction)settingsSaved:(id)sender
{
    //If the user doesn't have a Kindhat id
    //then we need to POST, otherwise,
    //we need to PUT
    KHMainUITabBarController *khMainUITabBarController = (KHMainUITabBarController*)[self parentViewController];
    KHUser* khUser = [khMainUITabBarController khUser];
    
    [khUser setName: [[self nameUITextField] text]];
    [khUser setEmail: [[self emailUITextField] text]];
    [khUser setPostalCode: [[self postalCodeUITextField] text]];
    [khUser setTermsAndConditions: [NSNumber numberWithBool: [[self termsAndConditionsUISwitch] isOn]]];
    [khUser setAboutMe: [[self aboutYouUITextView] text]];
    KHController *khController = [[KHController alloc] init];
    if([khUser identifier] == nil) //kindhat is unaware of this user
    {
        [khController postUser:khUser callHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
            [self handleCall:response withMainUITabBarController:khMainUITabBarController withUser:khUser withData:data withError:error];
        }];
    }
    else
    {
        [khController putUser:khUser callHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
            [self handleCall:response withMainUITabBarController:khMainUITabBarController withUser:khUser withData:data withError:error];
        }];
    }
}

- (void) handleCall:(NSURLResponse*)response
        withMainUITabBarController:(KHMainUITabBarController*) khMainUITabBarController
            withUser:(KHUser*)khUser
                withData:(NSData*)data
                    withError:(NSError*)error {
    if(error == nil)
    {
        if([khUser requiredFieldsMet])
        {
            [khMainUITabBarController setSelectedIndex: 2];
        }
        else
        {
            //we still don't have enough info message
        }
    }
}


@end