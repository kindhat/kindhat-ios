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
#import "../../Utility/KHController.h"
#import "../../Utility/KHConfiguration.h"

@implementation KHMeUIViewController

static NSString *const addressSegueName = @"address";
static NSString *const borrowSegueName = @"@Borrow";

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
        [self saveProfile];
    }
}

- (KHAddressResults*) lookupAddress:(NSString*)street
                                    withPostalCode:(NSString*)postalCode {
    
    KHAddressResults *khAddressResults = [[KHAddressResults alloc]init];
    KHController *khController = [[KHController alloc] init];
    
    NSString *addressLookUpUrl = [KHConfiguration getConfiguration:[KHUser addressLookUpUrlName]];
    
    NSString *addressLookUpUrlUrlFormatted = [NSString stringWithFormat:addressLookUpUrl,
                                              street,
                                              postalCode];
    
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
            [self performSegueWithIdentifier:borrowSegueName sender:self];
        }
    }
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:addressSegueName]) {
        KHAddressVerificationUIViewController *khAddressVerificationUIViewController = segue.destinationViewController;
        [khAddressVerificationUIViewController setAddresses: [self addresses]];
    }
    else if([segue.identifier isEqualToString:borrowSegueName]) {
        
    }
}

@end
