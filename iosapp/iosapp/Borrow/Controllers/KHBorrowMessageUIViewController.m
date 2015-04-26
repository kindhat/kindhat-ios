//
//  KHBorrowMessageUIViewController.m
//  iosapp
//
//  Created by Mac on 3/5/15.
//  Copyright (c) 2015 Kindhat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KHBorrowMessageUIViewController.h"
#import "KHSendRequestUIViewController.h"

@implementation KHBorrowMessageUIViewController

@synthesize khRequest;
@synthesize khUser;

static NSString *const borrowRequestSegueIdentifier = @"showSendRequestController";

- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([segue.identifier isEqualToString:borrowRequestSegueIdentifier]){
        
        KHSendRequestUIViewController *khSendRequestUIViewController = (KHSendRequestUIViewController *)segue.destinationViewController;
        
        [[self khRequest] setMessage:[[self messageUITextView] text]];
        
        [khSendRequestUIViewController setKhRequest:[self khRequest]];
        [khSendRequestUIViewController setKhUser:[self khUser]];
    }
}

@end