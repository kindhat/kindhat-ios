//
//  KHBorrowDateUIViewController.m
//  iosapp
//
//  Created by Mac on 3/4/15.
//  Copyright (c) 2015 Kindhat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KHBorrowDateUIViewController.h"
#import "KHReturnDateUIViewController.h"

@implementation KHBorrowDateUIViewController

@synthesize khRequest;

- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"showReturnDateController"]){
        KHReturnDateUIViewController *khReturnDateUIViewController = (KHReturnDateUIViewController *)segue.destinationViewController;        
        [[self khRequest] setBorrowDate:[[self borrowDateUiDatePicker] date]];
        [khReturnDateUIViewController setKhRequest:[self khRequest]];
    }
}

@end