// KHRequest.m
// iosapp

// Created by Mac
// Copyright (c) 2014 Kindhat. All rights reserved.

#import "KHRequest.h"

@implementation KHRequest

@synthesize identifier;
@synthesize userId;
@synthesize item;
@synthesize requestType;
@synthesize category;
@synthesize borrowDate;
@synthesize returnDate;
@synthesize message;

static NSString *const _requestUrlConfigurationName = @"kh.requesturl";

+ (NSString*) requestUrlConfigurationName {
    return _requestUrlConfigurationName;
}

- (void) deserialize:(NSDictionary *)jsonData{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSS"];
    
    NSNumber *nsNumberIdentifier = [jsonData objectForKey:@"id"];
    [self setIdentifier: [nsNumberIdentifier longLongValue]];
    
    [self setItem:[[jsonData objectForKey:@"item"] stringValue]];
    [self setCategory:[[jsonData objectForKey:@"category"] stringValue]];
        
    NSNumber *nsRequestType = [jsonData objectForKey:@"requestType"];
    [self setRequestType: [nsRequestType intValue]];
    
    NSString *borrowDateString = [[jsonData objectForKey:@"borrowDate"] stringValue];
    [self setBorrowDate:[dateFormat dateFromString:borrowDateString]];
    
    NSString *returnDateString = [[jsonData objectForKey:@"returnDate"] stringValue];
    [self setReturnDate:[dateFormat dateFromString:returnDateString]];

    [self setMessage:[[jsonData objectForKey:@"message"] stringValue]];
    
    NSNumber *nsNumberUserId = [jsonData objectForKey:@"userId"];
    [self setUserId: [nsNumberUserId longLongValue]];
}

- (NSData*) serialize {
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSS"];
    
    NSMutableDictionary *nsMutableDictionary = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                  [NSNumber numberWithLongLong: self.userId], @"userId",
                                  (self.item != nil) ? self.item : @"", @"item",
                                  (self.category != nil) ? self.category : @"", @"category",
                                  [NSNumber numberWithInt: self.requestType], @"requestType",
                                  (self.borrowDate != nil) ? [dateFormat stringFromDate: self.borrowDate] : @"9999-12-31", @"borrowDate",
                                  (self.returnDate != nil) ? [dateFormat stringFromDate: self.returnDate] : @"9999-12-31", @"returnDate",
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