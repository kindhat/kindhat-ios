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
    
    KHApiKey *identifierKHApiKey = [[KHApiKey alloc]init];
    [identifierKHApiKey deserialize:[jsonData objectForKey:@"id"]];
    [self setIdentifier: identifierKHApiKey];
    
    KHApiKey *userIdKHApiKey = [[KHApiKey alloc]init];
    [userIdKHApiKey deserialize:[jsonData objectForKey:@"userId"]];
    [self setUserId:userIdKHApiKey];
    
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
    
    KHApiKey *identifierKHApiKey = [[KHApiKey alloc]init];
    [identifierKHApiKey deserialize:nil];
    
    NSDictionary *nsDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                  [identifierKHApiKey serialize], @"id",
                                  [self.userId serialize], @"userId",
                                  self.item, @"item",
                                  //self.category, @"category",
                                  //self.use, @"use",
                                  [dateFormat stringFromDate: self.borrowDate], @"borrowDate",
                                  [dateFormat stringFromDate: self.returnDate], @"returnDate",
                                  self.message, @"message",
                                  nil];
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:nsDictionary
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:nil];
    return jsonData;
}

@end