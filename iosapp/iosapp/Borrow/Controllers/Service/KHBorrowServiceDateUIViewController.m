//
//  KHBorrowServiceDateUIViewController.m
//  iosapp
//
//  Created by Mac on 4/24/15.
//  Copyright (c) 2015 Kindhat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KHBorrowServiceDateUIViewController.h"
#import "KHBorrowMessageUIViewController.h"

@implementation KHBorrowServiceDateUIViewController

@synthesize khRequest;
@synthesize khUser;

static NSString *const borrowMessageSegueIdentifier = @"showBorrowMessageController";

- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([segue.identifier isEqualToString:borrowMessageSegueIdentifier]){
        
        KHBorrowMessageUIViewController *khBorrowMessageUIViewController = (KHBorrowMessageUIViewController *)segue.destinationViewController;
        
        [[self khRequest] setBorrowDate:[[self serviceDateUIDatePicker] date]];
        
        [khBorrowMessageUIViewController setKhRequest:[self khRequest]];
        [khBorrowMessageUIViewController setKhUser:[self khUser]];
    }
}

@end
