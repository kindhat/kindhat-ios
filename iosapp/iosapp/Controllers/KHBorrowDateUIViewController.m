//
//  KHBorrowDateUIViewController.m
//  iosapp
//
//  Created by Mac on 3/4/15.
//  Copyright (c) 2015 Kindhat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KHBorrowDateUIViewController.h"
#import "KHBorrowItemUIViewController.h"
#import "../Models/KHRequest.h"

@implementation KHBorrowDateUIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)nextClicked:(id)sender
{
    KHBorrowItemUIViewController *khBorrowItemUIViewController =
    (KHBorrowItemUIViewController*)[self parentViewController];
    
    KHRequest *khRequest = [khBorrowItemUIViewController khRequest];
    [khRequest setBorrowDate:[[self borrowDateUiDatePicker] date]];
}


@end