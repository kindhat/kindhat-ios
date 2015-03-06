//
//  KHLoginController.m
//  iosapp
//
//  Created by Mac on 10/9/14.
//  Copyright (c) 2014 Kindhat. All rights reserved.
//

/* This sample implements Login with Facebook using the standard Login button.
 It asks for the public_profile, email and user_likes permissions.
 You can see the tutorial that accompanies this sample here:
 https://developers.facebook.com/docs/ios/login-tutorial/#login-button
 
 For simplicity, this sample does limited error handling. You can read more
 about handling errors in our Error Handling guide:
 https://developers.facebook.com/docs/ios/errors
 */

#import "KHLoginUIViewController.h"
#import "KHMainUITabBarController.h"
#import "../Utility/KHController.h"
#import "../Utility/KHExternalIdType.h"
#import "../Utility/KHConfiguration.h"

@implementation KHLoginUIViewController

static NSString *const _facebookImageUrlConfigurationName = @"kh.ios.facebookimageurl";
static NSString *const _email = @"email";


- (void)viewDidLoad {
    [super viewDidLoad];
        // Custom initialization
        
        // Create a FBLoginView to log the user in with basic, email and friend list permissions
        // You should ALWAYS ask for basic permissions (public_profile) when logging the user in
        [[self loginView] setReadPermissions:@[@"public_profile",
                                               @"email",
                                               @"user_friends"]];
    
        // Set this loginUIViewController to be the loginView button's delegate
        [[self loginView] setDelegate:self];
        
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showMainUITabBarController"]) {
        
        KHMainUITabBarController *khMainUITabBarController = segue.destinationViewController;
        [khMainUITabBarController setKhUser: [self khUser]];
        if(![[khMainUITabBarController khUser] requiredFieldsMet])
        {
            //we want to push the user to the account profile screen
            //in addition we want to lock down all other tabs until they've
            //completed all required fields
            
            [khMainUITabBarController setSelectedIndex:3];
            
        }
        [khMainUITabBarController setDelegate: khMainUITabBarController];
    }
}

#pragma mark - FBLoginViewDelegate

- (void)loginViewFetchedUserInfo:(FBLoginView *)loginView user:(NSDictionary<FBGraphUser>*)user
{
    KHController *khController = [[KHController alloc]init];
    
    NSString *userUrl = [NSString stringWithFormat:[KHConfiguration getConfiguration:[KHUser getUserUrlConfigurationName]],
                         [user objectID],
                         KHExternalIdTypeToString[Facebook]];
    
    [khController getItemAsync:userUrl
                   callHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
    
         if (error != nil) {
             //need to figure out error handling
         }
         else {
             
             KHUser *khUser = [[KHUser alloc]init];
             NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:data
                                                                      options:0
                                                                        error:NULL];
             [khUser deserialize: jsonData];

             //we only want to default values if the profile
             //has yet to be saved
             if (![khUser requiredFieldsMet]) {
                 
                 [khUser setExternalId: [user objectID]];
                 [khUser setExternalIdType: Facebook];
                 [khUser setName: [user name]];
                 [khUser setImage:[NSString stringWithFormat:
                               [KHConfiguration getConfiguration: _facebookImageUrlConfigurationName],
                               [user objectID]]];
                 [khUser setEmail: [user objectForKey: _email]];

             }

             [self setKhUser:khUser];
             [self performSegueWithIdentifier:@"showMainUITabBarController" sender:loginView];
         }
     }];
}

- (void)loginViewShowingLoggedInUser:(FBLoginView *)loginView
{
}

- (void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView
{
}

// You need to override loginView:handleError in order to handle possible errors that can occur during login
- (void)loginView:(FBLoginView *)loginView handleError:(NSError *)error {
    NSString *alertMessage, *alertTitle;
    
    // If the user should perform an action outside of you app to recover,
    // the SDK will provide a message for the user, you just need to surface it.
    // This conveniently handles cases like Facebook password change or unverified Facebook accounts.
    if ([FBErrorUtility shouldNotifyUserForError:error]) {
        alertTitle = @"Facebook error";
        alertMessage = [FBErrorUtility userMessageForError:error];
        
        // This code will handle session closures since that happen outside of the app.
        // You can take a look at our error handling guide to know more about it
        // https://developers.facebook.com/docs/ios/errors
    } else if ([FBErrorUtility errorCategoryForError:error] == FBErrorCategoryAuthenticationReopenSession) {
        alertTitle = @"Session Error";
        alertMessage = @"Your current session is no longer valid. Please log in again.";
        
        // If the user has cancelled a login, we will do nothing.
        // You can also choose to show the user a message if cancelling login will result in
        // the user not being able to complete a task they had initiated in your app
        // (like accessing FB-stored information or posting to Facebook)
    } else if ([FBErrorUtility errorCategoryForError:error] == FBErrorCategoryUserCancelled) {
        NSLog(@"user cancelled login");
        
        // For simplicity, this sample handles other errors with a generic message
        // You can checkout our error handling guide for more detailed information
        // https://developers.facebook.com/docs/ios/errors
    } else {
        alertTitle  = @"Something went wrong";
        alertMessage = @"Please try again later.";
        NSLog(@"Unexpected error:%@", error);
    }
    
    if (alertMessage) {
        [[[UIAlertView alloc] initWithTitle:alertTitle
                                    message:alertMessage
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil] show];
    }
}

@end