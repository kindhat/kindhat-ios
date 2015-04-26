//
//  KHBorrowUIViewController
//  iosapp
//
//  Created by Mac on 10/24/14.
//  Copyright (c) 2014 Kindhat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KHBorrowItemUIViewController.h"
#import "KHBorrowItemDateUIViewController.h"
#import "../../Models/KHUser.h"

@implementation KHBorrowItemUIViewController

static NSString *const borrowDateSegueIdentifier = @"showBorrowDateController";

- (void)viewDidLoad
{
    [super viewDidLoad];    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([segue.identifier isEqualToString:borrowDateSegueIdentifier]){
        
        KHBorrowItemDateUIViewController *khBorrowItemDateUIViewController =
        (KHBorrowItemDateUIViewController *)segue.destinationViewController;
        
        KHRequest *khRequest = [[KHRequest alloc]init];
        [khRequest setUserId: [[self khUser] identifier]];
        [khRequest setRequestType: Item];
        [khRequest setItem: [[self itemUITextField] text]];
        
        [khBorrowItemDateUIViewController setKhRequest:khRequest];
        [khBorrowItemDateUIViewController setKhUser: [self khUser]];
    }
}

@end