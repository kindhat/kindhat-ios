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
#import "KHMeUiViewController.h"
#import "../Models/KHAddressResult.h"

@implementation KHAddressVerificationUIViewController

@synthesize khUser;
@synthesize addresses;

static NSString *const addressSelectedSegueIdentifier = @"AddressSelected";
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

- (void) tableView: (UITableView *) tableView didSelectRowAtIndexPath: (NSIndexPath *) indexPath
{
    KHAddressResult *khAddressResult = [[self addresses] objectAtIndex:indexPath.row];
    
    [[self khUser] setStreet: [khAddressResult street]];
    [[self khUser] setPostalCode: [khAddressResult postalCode]];
    [[self khUser] setLongitude: [khAddressResult longitude]];
    [[self khUser] setLatitude: [khAddressResult latitude]];
    
    //segue back to the me view
    [self performSegueWithIdentifier:addressSelectedSegueIdentifier sender:self];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:addressSelectedSegueIdentifier]) {
        KHMeUIViewController *khMeUIViewController = segue.destinationViewController;
        [khMeUIViewController setKhUser: [self khUser]];
    }
}

@end
