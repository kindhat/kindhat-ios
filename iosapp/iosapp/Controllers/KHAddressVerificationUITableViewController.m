//
//  KHAddressVerificationUITableViewController.m
//  iosapp
//
//  Created by Mac on 3/27/15.
//  Copyright (c) 2015 Kindhat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KHAddressVerificationUITableViewController.h"
#import "KHAddressVerificationUITableViewCellController.h"
#import "../Models/KHGoogleGeoCodingAddressResult.h"

@implementation KHAddressVerificationUITableViewController

@synthesize addresses;

static NSString *const cellIdentifier = @"AddressVerificationUITableCell";
static NSString *const addressPartsSeparator = @",";

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [self.addresses count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    KHAddressVerificationUITableViewCellController *cell = (KHAddressVerificationUITableViewCellController *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    KHGoogleGeoCodingAddressResult *khGoogleGeoCodingAddressResult = [[self addresses] objectAtIndex:indexPath.row];
    
    NSArray *addressParts = [[khGoogleGeoCodingAddressResult formattedAddress] componentsSeparatedByString:addressPartsSeparator];
    
    cell.streetTextField.text = [addressParts objectAtIndex:0];
    cell.cityTextField.text = [addressParts objectAtIndex:1];
    cell.stateTextFiled.text = [addressParts objectAtIndex:2];
    
    return cell;
}

@end