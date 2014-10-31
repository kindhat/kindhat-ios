//
//  KHBorrowUIViewController
//  iosapp
//
//  Created by Mac on 10/24/14.
//  Copyright (c) 2014 Kindhat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KHMainUITabBarController.h"
#import "KHBorrowUIViewController.h"
#import "../Models/KHUser.h"
#import "../Utility/KHExternalIdType.h"
#import "../Utility/KHRestfulUrls.h"
#import "../Utility/KHController.h"

@implementation KHBorrowUIViewController{
    NSString *_externalId;
    KHExternalIdType *_externalIdType;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //start loading animation right away
    [[self activityIndicatorView] startAnimating];

    //need to call kindhat services to see if user has registered before
    KHRestfulUrls *restfulUrls = [[KHRestfulUrls alloc]init];
    KHController *controller = [[KHController alloc]init];
    [controller
     callApi:[restfulUrls getUserByExternalId:[self externalId] withExternalIdType:[self externalIdType]]
     withMethod:@"GET"
     callHandler:^(
                   NSURLResponse *response,
                   NSData *data,
                   NSError *error){
         
         [[self activityIndicatorView] stopAnimating];
         
         if (data.length > 0 && error == nil)
         {
             KHUser *khUser = [[KHUser alloc]init];
             NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:data
                                                                    options:0
                                                                    error:NULL];
             [khUser map: jsonData];
             KHMainUITabBarController *khMainUITabBarController = (KHMainUITabBarController *)[self parentViewController];
             [khMainUITabBarController setKhUser: khUser];
             if(![[khMainUITabBarController khUser] requiredFieldsMet])
             {
                 //we want to push the user to the account profile screen
                 //in addition we want to lock down all other tabs until they've
                 //completed all required fields

                 [khMainUITabBarController setSelectedIndex:3];
                 
             }
         }
     }];
}

- (NSString *)externalId
{
    if (!_externalId) {
        _externalId = [[NSString alloc] init];
        KHMainUITabBarController *khMainUITabBarController = (KHMainUITabBarController *)[self parentViewController];
        _externalId = [khMainUITabBarController externalId];
    }
    return _externalId;
}

- (KHExternalIdType *)externalIdType
{
    if (!_externalIdType) {
        KHMainUITabBarController *khMainUITabBarController = (KHMainUITabBarController *)[self parentViewController];
        _externalIdType = (KHExternalIdType *)[khMainUITabBarController externalIdType];
    }
    return _externalIdType;
}


@end