//
//  KHSettingsUITableViewController.m
//  iosapp
//
//  Created by Mac on 10/31/14.
//  Copyright (c) 2014 Kindhat. All rights reserved.
//

#import "KHMeUIViewController.h"
#import "KHMainUITabBarController.h"
#import "KHAddressVerificationUITableViewController.h"
#import "../Models/KHUser.h"
#import "../Models/KHGoogleGeoCodingAddressResults.h"
#import "../Utility/KHController.h"
#import "../Utility/KHConfiguration.h"

@implementation KHMeUIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    KHMainUITabBarController *khMainUITabBarController = (KHMainUITabBarController*)[[self parentViewController]parentViewController];
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
    //lookup address
    KHGoogleGeoCodingAddressResults *khGoogleGeoCodingAddressResults = [self lookupAddress:[[self streetUITextField]text]
                                                                            withPostalCode:[[self postalCodeUITextField]text]];
    
    //if the address lookup results are not one we need to take action
    if([[khGoogleGeoCodingAddressResults results]count]>1)
    {
        [self setAddresses:[khGoogleGeoCodingAddressResults results]];
        [self performSegueWithIdentifier:@"@Address" sender:sender];
    }
    else if([[khGoogleGeoCodingAddressResults results]count]<1)
    {
        
    }
    else
    {
        [self saveProfile];
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

- (KHGoogleGeoCodingAddressResults*) lookupAddress:(NSString*)street
                                    withPostalCode:(NSString*)postalCode {
    
    KHGoogleGeoCodingAddressResults *khGoogleGeoCodingAddressResults = [[KHGoogleGeoCodingAddressResults alloc]init];
    KHController *khController = [[KHController alloc] init];
    
    NSString *streetEditedForGoogleGeoCoding = [street stringByReplacingOccurrencesOfString:@" "
                                                                                withString:@"+"];
    
    NSString *streetAndZipEditedForGoogleGeoCoding = [streetEditedForGoogleGeoCoding stringByAppendingFormat:@",%@",postalCode];
    
    NSString *googleGeoCodingUrl = [KHConfiguration getConfiguration:[KHUser googleGeocodingUrlName]];
    
    NSString *googleGeoCodingUrlFormatted = [NSString stringWithFormat:googleGeoCodingUrl,
                                             streetAndZipEditedForGoogleGeoCoding,
                                            [KHConfiguration getConfiguration:[KHConfiguration googleApiKey]]];
    
    [khController getItemSync:googleGeoCodingUrlFormatted
                    callHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                        
                        NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:data
                                                                                 options:0
                                                                                   error:NULL];
                        [khGoogleGeoCodingAddressResults deserialize:jsonData];
                    
                    }];
    
    return khGoogleGeoCodingAddressResults;
}

- (void) saveProfile {
    
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"@Address"]) {
        KHAddressVerificationUITableViewController *khAddressVerificationUITableViewController = segue.destinationViewController;
        [khAddressVerificationUITableViewController setAddresses: [self addresses]];        
    }
}

@end
