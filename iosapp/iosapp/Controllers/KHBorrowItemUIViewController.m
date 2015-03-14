//
//  KHBorrowUIViewController
//  iosapp
//
//  Created by Mac on 10/24/14.
//  Copyright (c) 2014 Kindhat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KHMainUITabBarController.h"
#import "KHBorrowItemUIViewController.h"
#import "KHBorrowDateUIViewController.h"
#import "../Models/KHUser.h"

@implementation KHBorrowItemUIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"showBorrowDateController"]){
        KHBorrowDateUIViewController *khBorrowDateUIViewController =
        (KHBorrowDateUIViewController *)segue.destinationViewController;
        
        KHRequest *khRequest = [[KHRequest alloc]init];
        [khRequest setUserId: [[self khUser] identifier]];
        [khRequest setItem: [[self itemUiTextField] text]];
        [khBorrowDateUIViewController setKhRequest:khRequest];
        [khBorrowDateUIViewController setKhUser: [self khUser]];
    }
}

@end