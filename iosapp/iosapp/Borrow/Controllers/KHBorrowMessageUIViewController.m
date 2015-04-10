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

- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"showSendRequestController"]){
        KHSendRequestUIViewController *khSendRequestUIViewController = (KHSendRequestUIViewController *)segue.destinationViewController;
        [[self khRequest] setMessage:[[self messageUITextView] text]];
        [khSendRequestUIViewController setKhRequest:[self khRequest]];
        [khSendRequestUIViewController setKhUser:[self khUser]];
    }
}

@end