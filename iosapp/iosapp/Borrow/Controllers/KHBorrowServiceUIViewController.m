//
//  KHBorrowServiceUIViewController.m
//  iosapp
//
//  Created by Mac on 4/24/15.
//  Copyright (c) 2015 Kindhat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KHBorrowServiceUIViewController.h"
#import "KHBorrowServiceDateUIViewController.h"
#import "../../Models/KHUser.h"
#import "../../Models/KHRequest.h"
#import "../../Models/KHRequestType.h"

@implementation KHBorrowServiceUIViewController

static NSString *const borrowDateSegueIdentifier = @"showBorrowServiceDateController";

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([segue.identifier isEqualToString:borrowDateSegueIdentifier]){
        
        KHBorrowServiceDateUIViewController *khBorrowServiceDateUIViewController =
        (KHBorrowServiceDateUIViewController *)segue.destinationViewController;
        
        KHRequest *khRequest = [[KHRequest alloc]init];
        [khRequest setUserId: [[self khUser] identifier]];
        [khRequest setRequestType: Service];
        [khRequest setItem: [[self serviceUITextField] text]];
        
        [khBorrowServiceDateUIViewController setKhRequest:khRequest];
        [khBorrowServiceDateUIViewController setKhUser: [self khUser]];
    }
}

@end
