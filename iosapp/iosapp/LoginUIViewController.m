//
//  LoginController.m
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

#import "LoginUIViewController.h"
#import "RestfulUrls.h"
#import "Controller.h"
#import "User.h"
@import Foundation;

@implementation LoginUIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        // Custom initialization
        
        // Create a FBLoginView to log the user in with basic, email and friend list permissions
        // You should ALWAYS ask for basic permissions (public_profile) when logging the user in
        FBLoginView *loginView = [[FBLoginView alloc] initWithReadPermissions:@[
           @"public_profile",
           @"email",
           @"user_friends"]];
        
        // Set this loginUIViewController to be the loginView button's delegate
        loginView.delegate = self;
        
        // Align the button in the center horizontally
        loginView.frame = CGRectOffset(loginView.frame,
                                       (self.view.center.x - (loginView.frame.size.width / 2)),
                                       5);
        
        // Align the button in the center vertically
        loginView.center = self.view.center;
        
        // Add the button to the view
        [self.view addSubview:loginView];
        
}

// This method will be called when the user information has been fetched
- (void)loginViewFetchedUserInfo:(FBLoginView *)loginView
                            user:(id<FBGraphUser>)user {
    
    //need to call kindhat services to see if user has registered before
    RestfulUrls *restfulUrls = [[RestfulUrls alloc]init];
    Controller *controller = [[Controller alloc]init];
    
    [controller
     callApi:[restfulUrls getUserById:[user objectID]]
     withMethod:@"GET"
     callHandler:^(
       NSURLResponse *response,
       NSData *data,
       NSError *error){
        
        if (data.length > 0 && error == nil)
        {
            User *kindHatUser = [[User alloc]init];
            NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:data
                                      options:0
                                      error:NULL];
            [kindHatUser map: jsonData];
            if([kindHatUser requiredFieldsMet])
            {
                //route to dashboard
            }
            else
            {
                //route to additional account setup screen
            }
        }
    }];
    
    //in addition, if there is any required data missing we'll need to
    //forcibly route them to additional account setup screen
    //otherwise show their dashboard
}

// Implement the loginViewShowingLoggedInUser: delegate method to modify your app's UI for a logged-in user experience
- (void)loginViewShowingLoggedInUser:(FBLoginView *)loginView {
}

// Implement the loginViewShowingLoggedOutUser: delegate method to modify your app's UI for a logged-out user experience
- (void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView {
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