//
//  KHApiKey.m
//  iosapp
//
//  Created by Mac on 11/20/14.
//  Copyright (c) 2014 Kindhat. All rights reserved.
//

#import "KHApiKey.h"

@implementation KHApiKey

@synthesize appId;
@synthesize complete;
@synthesize identifier;
@synthesize kind;
@synthesize name;
@synthesize namespaceProperty;
@synthesize parent;

- (void) deserialize:(NSDictionary *)jsonData{
    [self setAppId: [jsonData objectForKey:@"appId"]];
    
    NSNumber *nsNumberComplete = [jsonData objectForKey:@"complete"];
    [self setComplete: [nsNumberComplete boolValue]];

    NSNumber *nsNumberIdentifier = [jsonData objectForKey:@"id"];
    [self setIdentifier: [nsNumberIdentifier longLongValue]];
    
    [self setKind: [jsonData objectForKey:@"kind"]];
    [self setName: [jsonData objectForKey:@"name"]];
    [self setNamespaceProperty: [jsonData objectForKey:@"namespace"]];
    
    //parse parent if it exists
    NSDictionary *nsDictionaryParent = [jsonData objectForKey:@"parent"];
    if(nsDictionaryParent != nil) {
        KHApiKey *khApiKey = [[KHApiKey init]alloc];
        [khApiKey deserialize: nsDictionaryParent];
        [self setParent: khApiKey];
    }
}

- (NSDictionary*) serialize {
    return [self serializeKey: self];
}

- (NSDictionary*) serializeKey:(KHApiKey*)khApiKey {
    if(khApiKey.parent != nil){
        NSDictionary *nsDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                      self.appId, @"appId",
                                      [NSNumber numberWithBool: self.complete], @"complete",
                                      [NSNumber numberWithLongLong: self.identifier], @"id",
                                      self.kind, @"kind",
                                      self.name, @"name",
                                      self.namespaceProperty, @"namespace",
                                      [self serializeKey:khApiKey.parent], @"parent",
                                      nil];
        return nsDictionary;
    }
    else {
        NSDictionary *nsDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                      self.appId, @"appId",
                                      [NSNumber numberWithBool: self.complete], @"complete",
                                      [NSNumber numberWithLongLong: self.identifier], @"id",
                                      self.kind, @"kind",
                                      self.name, @"name",
                                      self.namespaceProperty, @"namespace",
                                      nil];
        return nsDictionary;
    }
    
}
@end
