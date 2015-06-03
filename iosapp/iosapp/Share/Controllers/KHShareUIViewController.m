//
//  KHShareUIViewController
//  iosapp
//
//  Created by Mac on 3/27/15.
//  Copyright (c) 2015 Kindhat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KHShareUIViewController.h"
#import "KHShareUITableViewCell.h"

@implementation KHShareUIViewController

static NSString *const cellIdentifier = @"ShareUITableCell";

@synthesize khUser;
@synthesize requests;

- (void)loadView
{
    [super loadView];
    [self setRequests: [[NSMutableArray alloc]init]];
    [[self requests] addObject:@"test"];
    [[self uiTableView] setDelegate: self];
    [[self uiTableView] setDataSource: self];
    [[self uiTableView] reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[self requests]count];
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    KHShareUITableViewCell *cell = (KHShareUITableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    cell.distance.text = @"1 mile";
    cell.time.text = @"13 days ago";
    cell.message.text = @"Want to play double dutch? I'm busy thank you much";
    
    return cell;
}


@end
