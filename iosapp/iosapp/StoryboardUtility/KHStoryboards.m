//
//  KHStoryboards.m
//  iosapp
//
//  Created by Mac on 4/20/15.
//  Copyright (c) 2015 Kindhat. All rights reserved.
//


#import "KHStoryboards.h"

@implementation KHStoryboards

+ (UIStoryboard *)moreStoryboard {
    return [UIStoryboard storyboardWithName:@"More" bundle:nil];
}

+ (UIStoryboard *)borrowStoryboard {
    return [UIStoryboard storyboardWithName:@"Borrow" bundle:nil];
}

+ (UIStoryboard *)charitiesStoryboard {
    return [UIStoryboard storyboardWithName:@"Charities" bundle:nil];
}

+ (UIStoryboard *)dashboardStoryboard {
    return [UIStoryboard storyboardWithName:@"Dashboard" bundle:nil];
}

+ (UIStoryboard *)shareStoryboard {
    return [UIStoryboard storyboardWithName:@"Share" bundle:nil];
}

+ (UIStoryboard *)meStoryboard {
    return [UIStoryboard storyboardWithName:@"Me" bundle:nil];
}

+ (UIStoryboard *)loginStoryboard {
    return [UIStoryboard storyboardWithName:@"Login" bundle:nil];
}


@end
