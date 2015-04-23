//
//  KHLinkedStoryboard.m
//  iosapp
//
//  Created by Mac on 3/28/15.
//  Copyright (c) 2015 Kindhat. All rights reserved.
//

#import "KHLinkedStoryboard.h"
#import "../Me/Controllers/KHMeUIViewController.h"

@implementation KHLinkedStoryboard

+ (UIViewController *)sceneNamed:(NSString *)identifier
{
    NSArray *info = [identifier componentsSeparatedByString:@"@"];
    
    NSString *storyboard_name = info[1];
    NSString *scene_name = info[0];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboard_name
                                                         bundle:nil];
    UIViewController *scene = nil;
    
    if (scene_name.length == 0) {
        scene = [storyboard instantiateInitialViewController];
    }
    else {
        scene = [storyboard instantiateViewControllerWithIdentifier:scene_name];
    }
    
    return scene;
}

- (id)initWithIdentifier:(NSString *)identifier
                  source:(UIViewController *)source
             destination:(UIViewController *)destination
{
    return [super initWithIdentifier:identifier
                              source:source
                         destination:[KHLinkedStoryboard sceneNamed:identifier]];
}

- (void)perform
{
    UIViewController *source = (UIViewController *)self.sourceViewController;
    [source.navigationController presentViewController:self.destinationViewController animated:YES completion:nil];
}

@end
