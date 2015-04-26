//
//  KHBorrowItemDateUIViewController.m
//  iosapp
//
//  Created by Mac on 3/4/15.
//  Copyright (c) 2015 Kindhat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KHBorrowItemDateUIViewController.h"
#import "KHBorrowItemReturnDateUIViewController.h"

@implementation KHBorrowItemDateUIViewController

@synthesize khRequest;

static NSString *const returnDateSegueIdentifier = @"showReturnDateController";

- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:returnDateSegueIdentifier]){
        
        KHBorrowItemReturnDateUIViewController *khBorrowItemReturnDateUIViewController = (KHBorrowItemReturnDateUIViewController *)segue.destinationViewController;
        
        [[self khRequest] setBorrowDate:[[self borrowDateUIDatePicker] date]];
        
        [khBorrowItemReturnDateUIViewController setKhRequest:[self khRequest]];
        [khBorrowItemReturnDateUIViewController setKhUser: [self khUser]];
    }
}

@end