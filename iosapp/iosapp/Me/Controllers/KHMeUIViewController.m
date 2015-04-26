//
//  KHSettingsUITableViewController.m
//  iosapp
//
//  Created by Mac on 10/31/14.
//  Copyright (c) 2014 Kindhat. All rights reserved.
//

#import "KHMeUIViewController.h"
#import "KHAddressVerificationUIViewController.h"
#import "../../Models/KHUser.h"
#import "../Models/KHAddressResults.h"
#import "../Models/KHAddressResult.h"
#import "../../Utility/KHController.h"
#import "../../Utility/KHConfiguration.h"
#import "../../Utility/KHLiterals.h"
#import "../../Login/Controllers/KHMainUITabBarController.h"

@implementation KHMeUIViewController

static NSString *const addressSegueName = @"address";
static NSString *const mainUITabBarControllerSegueName = @"MainUITabBarController@Login";

@synthesize khUser;
@synthesize addresses;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[self nameUITextField] setText: [[self khUser] name]];
    [[self emailUITextField] setText: [[self khUser] email]];
    
    //we don't want the NSData dataWithContentsOfUrl operation to error if the image string is empty
    if([[[self khUser] image] length] > 0)
    {
        //an image url is set so get the image
        NSError *imageError ;
        NSURL *url = [NSURL URLWithString: [[self khUser] image]];
        NSData *data = [NSData dataWithContentsOfURL:url options:NSDataReadingUncached error:&imageError];
        UIImage *image = [UIImage imageWithData:data];
        [[self profileUIImageView] setImage:image];
    }
}

- (IBAction)settingsSaved:(id)sender
{
    //lookup address
    KHAddressResults *khAddressResults = [self lookupAddress:[[self streetUITextField]text]
                                              withPostalCode:[[self postalCodeUITextField]text]];
    
    //if the address lookup results are not equal to one we need to take action
    if([[khAddressResults addresses]count] > 1)
    {
        [self setAddresses:[khAddressResults addresses]];
        [self performSegueWithIdentifier:addressSegueName sender:sender];
    }
    else if([[khAddressResults addresses]count] < 1)
    {
        
    }
    else
    {
        KHAddressResult *khAddressResult = [[khAddressResults addresses] objectAtIndex:0];
        [[self khUser] setStreet: [khAddressResult street]];
        [[self khUser] setPostalCode: [khAddressResult postalCode]];
        [[self khUser] setLongitude: [khAddressResult longitude]];
        [[self khUser] setLatitude: [khAddressResult latitude]];
        [self saveProfile];
    }
}

- (KHAddressResults*) lookupAddress:(NSString*)street
                                    withPostalCode:(NSString*)postalCode {
    
    KHAddressResults *khAddressResults = [[KHAddressResults alloc]init];
    KHController *khController = [[KHController alloc] init];
    
    NSString *addressLookUpUrl = [KHConfiguration getConfiguration:[KHUser addressLookUpUrlName]];
    
    NSString *streetFormatted = [street stringByReplacingOccurrencesOfString:[KHLiterals spaceString] withString:[KHLiterals plusString]];
    
    NSString *postalCodeFormatted = [postalCode stringByReplacingOccurrencesOfString:[KHLiterals spaceString] withString:[KHLiterals plusString]];
    
    NSString *addressLookUpUrlUrlFormatted = [NSString stringWithFormat:addressLookUpUrl,
                                              streetFormatted,
                                              postalCodeFormatted];
    
    [khController getItemSync:addressLookUpUrlUrlFormatted
                    callHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                        
                        NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:data
                                                                                 options:0
                                                                                   error:NULL];
                        [khAddressResults deserialize:jsonData];
                    
                    }];
    
    return khAddressResults;
}

- (void) saveProfile {
    
    NSString *userUrl = [KHConfiguration getConfiguration:[KHUser userUrlConfigurationName]];
    
    [[self khUser] setStreet: [[self streetUITextField] text]];
    [[self khUser] setPostalCode: [[self postalCodeUITextField] text]];
    [[self khUser] setTermsAndConditions: [NSNumber numberWithBool: [[self termsAndConditionsUISwitch] isOn]]];
    [[self khUser] setAboutMe: [[self aboutYouUITextView] text]];
    
    KHController *khController = [[KHController alloc] init];
    
    //If the user doesn't have a Kindhat id
    //then we need to POST, otherwise, we need to PUT
    if([[self khUser] identifier] == 0) //kindhat is unaware of this user
    {
        [khController postItemAsync:userUrl
                               item:[[self khUser] serialize]
                        callHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                            
                            [self handleCall:response
                                    withUser:[self khUser]
                                    withData:data
                                   withError:error];
                        }];
    }
    else
    {
        [khController putItemAsync:userUrl
                              item:[[self khUser] serialize]
                       callHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                           
                           [self handleCall:response
                                   withUser:[self khUser]
                                   withData:data
                                  withError:error];
                       }];
    }
    
}

- (void) handleCall:(NSURLResponse*)response
           withUser:(KHUser*)khUser
           withData:(NSData*)data
          withError:(NSError*)error {
    
    if(error == nil)
    {
        if([[self khUser] requiredFieldsMet])
        {
            [self performSegueWithIdentifier:mainUITabBarControllerSegueName sender:self];
        }
    }
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:addressSegueName]) {
        KHAddressVerificationUIViewController *khAddressVerificationUIViewController = segue.destinationViewController;
        [khAddressVerificationUIViewController setAddresses: [self addresses]];
    }
    else if([segue.identifier isEqualToString:mainUITabBarControllerSegueName]) {
        KHMainUITabBarController *khMainUITabBarController = segue.destinationViewController;
        [khMainUITabBarController setKhUser: [self khUser]];
    }
}

@end
