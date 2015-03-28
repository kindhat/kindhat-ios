//
//  KHSettingsUITableViewController.m
//  iosapp
//
//  Created by Mac on 10/31/14.
//  Copyright (c) 2014 Kindhat. All rights reserved.
//

#import "KHMeUIViewController.h"
#import "KHMainUITabBarController.h"
#import "../Models/KHUser.h"
#import "../Utility/KHController.h"
#import "../Utility/KHConfiguration.h"

@implementation KHMeUIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    KHMainUITabBarController *khMainUITabBarController = (KHMainUITabBarController*)[self parentViewController];
    KHUser* khUser = [khMainUITabBarController khUser];
    
    [[self nameUITextField] setText: [khUser name]];
    [[self emailUITextField] setText: [khUser email]];
    
    //we don't want the NSData dataWithContentsOfUrl operation to error if the image string is empty
    if([[khUser image] length] > 0)
    {
        NSError *imageError ;
        NSURL *url = [NSURL URLWithString: [khUser image]];
        NSData *data = [NSData dataWithContentsOfURL:url options:NSDataReadingUncached error:&imageError];
        UIImage *image = [UIImage imageWithData:data];
        [[self profileUIImageView] setImage:image];
    }
}

- (IBAction)settingsSaved:(id)sender
{
    //If the user doesn't have a Kindhat id
    //then we need to POST, otherwise,
    //we need to PUT
    KHMainUITabBarController *khMainUITabBarController = (KHMainUITabBarController*)[self parentViewController];
    KHUser* khUser = [khMainUITabBarController khUser];
    NSString *userUrl = [KHConfiguration getConfiguration:[KHUser userUrlConfigurationName]];
    
    [khUser setStreet: [[self streetUITextField] text]];
    [khUser setPostalCode: [[self postalCodeUITextField] text]];
    [khUser setTermsAndConditions: [NSNumber numberWithBool: [[self termsAndConditionsUISwitch] isOn]]];
    [khUser setAboutMe: [[self aboutYouUITextView] text]];
    KHController *khController = [[KHController alloc] init];
    
    if([khUser identifier] == 0) //kindhat is unaware of this user
    {
        [khController postItemAsync:userUrl
                               item:[khUser serialize]
                        callHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
            
                            [self handleCall:response
                  withMainUITabBarController:khMainUITabBarController
                                    withUser:khUser
                                    withData:data
                                   withError:error];
        }];
    }
    else
    {
        [khController putItemAsync:userUrl
                              item:[khUser serialize]
                       callHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                           
                           [self handleCall:response
                 withMainUITabBarController:khMainUITabBarController
                                   withUser:khUser
                                   withData:data
                                  withError:error];
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