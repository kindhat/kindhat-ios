// KHRequest.m
// iosapp

// Created by Mac
// Copyright (c) 2014 Kindhat. All rights reserved.

#import "KHRequest.h"

@implementation KHRequest

@synthesize identifier;
@synthesize userId;
@synthesize item;
@synthesize category;
@synthesize use;
@synthesize borrowDate;
@synthesize returnDate;
@synthesize message;

static NSString *const _requestUrlConfigurationName = @"kh.ios.requesturl";

+ (NSString*) requestUrlConfigurationName {
    return _requestUrlConfigurationName;
}

- (void) deserialize:(NSDictionary *)jsonData{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSS"];
    
    NSNumber *nsNumberIdentifier = [jsonData objectForKey:@"id"];
    [self setIdentifier: [nsNumberIdentifier longLongValue]];
    
    NSNumber *nsNumberUserId = [jsonData objectForKey:@"userId"];
    [self setUserId: [nsNumberUserId longLongValue]];
    
    [self setItem:[[jsonData objectForKey:@"item"] stringValue]];
    [self setCategory:[[jsonData objectForKey:@"category"] stringValue]];
    
    NSString *borrowDateString = [[jsonData objectForKey:@"borrowDate"] stringValue];
    [self setBorrowDate:[dateFormat dateFromString:borrowDateString]];
    
    NSString *returnDateString = [[jsonData objectForKey:@"returnDate"] stringValue];
    [self setReturnDate:[dateFormat dateFromString:returnDateString]];
    
    [self setUse:[[jsonData objectForKey:@"use"] stringValue]];
    [self setMessage:[[jsonData objectForKey:@"message"] stringValue]];
}

- (NSData*) serialize {
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSS"];
    
    NSMutableDictionary *nsMutableDictionary = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                  [NSNumber numberWithLongLong: self.userId], @"userId",
                                  (self.item != nil) ? self.item : @"", @"item",
                                  (self.category != nil) ? self.category : @"", @"category",
                                  (self.use != nil) ? self.use : @"", @"use",
                                  (self.borrowDate != nil) ? [dateFormat stringFromDate: self.borrowDate] : @"", @"borrowDate",
                                  (self.returnDate != nil) ? [dateFormat stringFromDate: self.returnDate] : @"", @"returnDate",
                                  (self.message != nil) ? self.message : @"", @"message",
                                  nil];
    
    //we only want to serialize id if it actually exists
    //this is the case when creating a new (POST) item
    //if id is set and it is zero, the googl app engine
    //back end will throw an excpetion that id cannot = 0
    if(self.identifier != 0) {
        [nsMutableDictionary setObject:[NSNumber numberWithLongLong: self.identifier]
                                forKey:@"id"];
    }
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:nsMutableDictionary
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:nil];
    
    return jsonData;
}

@end