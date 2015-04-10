//
//  KHAddressVerificationUIViewController.m
//  iosapp
//
//  Created by Mac on 3/27/15.
//  Copyright (c) 2015 Kindhat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KHAddressVerificationUIViewController.h"
#import "KHAddressVerificationUITableViewCell.h"
#import "../Models/KHAddressResult.h"

@implementation KHAddressVerificationUIViewController

@synthesize addresses;

static NSString *const cellIdentifier = @"AddressVerificationUITableCell";
static NSString *cityStatePostalCodeFormat = @"%@ %@, %@";

- (void)loadView
{
    [super loadView];
    
    [[self uiTableView] setDelegate: self];
    [[self uiTableView] setDataSource: self];
    [[self uiTableView] reloadData];
}

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
    KHAddressVerificationUITableViewCell *cell = (KHAddressVerificationUITableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    KHAddressResult *khAddressResult = [[self addresses] objectAtIndex:indexPath.row];
    
    NSString *cityStatePostCodeFormatted = [NSString stringWithFormat:cityStatePostalCodeFormat,
                                            [khAddressResult city],
                                            [khAddressResult state],
                                            [khAddressResult postalCode]];
    
    cell.streetTextField.text = [khAddressResult street];
    cell.cityStatePostaCodeTextField.text = cityStatePostCodeFormatted;
    
    return cell;
}

@end
