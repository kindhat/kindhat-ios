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
#import "KHBorrowServiceUIViewController.h"
#import "../../../Models/KHRequest.h"

@implementation KHBorrowItemUIViewController

static NSString *const borrowDateSegueIdentifier = @"showBorrowDateController";
static NSString *const favorSegueIdentifier = @"showFavorController";

- (void)viewDidLoad
{
    [super viewDidLoad];    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([segue.identifier isEqualToString:borrowDateSegueIdentifier]) {
        
        KHBorrowItemDateUIViewController *khBorrowItemDateUIViewController =
        (KHBorrowItemDateUIViewController *)segue.destinationViewController;
        
        KHRequest *khRequest = [[KHRequest alloc]init];
        [khRequest setUserId: [[self khUser] identifier]];
        [khRequest setItem: [[self itemUITextField] text]];
        [khRequest setRequestType: Item];
        
        [khBorrowItemDateUIViewController setKhRequest:khRequest];
        [khBorrowItemDateUIViewController setKhUser: [self khUser]];
    }
    else if([segue.identifier isEqualToString:favorSegueIdentifier]) {
            
        KHBorrowServiceUIViewController *khBorrowServiceUIViewController =
        (KHBorrowServiceUIViewController *)segue.destinationViewController;
        
        [khBorrowServiceUIViewController setKhUser: [self khUser]];
    }
}

@end