//
//  KHUINavigationController.m
//  iosapp
//
//  Created by Webb on 4/22/15.
//  Copyright (c) 2015 Kindhat. All rights reserved.
//

#import "KHUINavigationController.h"
#import "../StoryboardUtility/KHStoryboards.h"

@implementation KHUINavigationController

static NSString *const moreButtonTitle = @"...";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationBar setBackgroundImage:[UIImage new]
                             forBarMetrics:UIBarMetricsDefault];
    self.navigationBar.shadowImage = [UIImage new];
    self.navigationBar.translucent = YES;
    
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]
                                              initWithTitle:moreButtonTitle
                                              style:UIBarButtonItemStylePlain
                                              target:self
                                              action:@selector(navigateToMoreStoryboard)];
    
    self.navigationBar.items = @[self.navigationItem];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)navigateToMoreStoryboard {
    UIStoryboard *moreUIStoryBoard = [KHStoryboards moreStoryboard];
    UIViewController *moreUIVIewController = (UIViewController *)[moreUIStoryBoard instantiateInitialViewController];
    [self pushViewController:moreUIVIewController animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
