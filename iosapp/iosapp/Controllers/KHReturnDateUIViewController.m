//
//  KHReturnDateUIViewController.m
//  iosapp
//
//  Created by Mac on 3/4/15.
//  Copyright (c) 2015 Kindhat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KHReturnDateUIViewController.h"
#import "KHBorrowMessageUIViewController.h"

@implementation KHReturnDateUIViewController

@synthesize khRequest;

- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"showBorrowMessageController"]){
        KHBorrowMessageUIViewController *khBorrowMessageUIViewController = (KHBorrowMessageUIViewController *)segue.destinationViewController;
        [[self khRequest] setReturnDate:[[self returnDateUiDatePicker] date]];
        [khBorrowMessageUIViewController setKhRequest:[self khRequest]];
    }
}

@end