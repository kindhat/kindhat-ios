//
//  KHRequestType.h
//  iosapp
//
//  Created by Mac on 4/22/15.
//  Copyright (c) 2015 Kindhat. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef KHRequestType_h
#define KHRequestType_h


typedef enum
{
    Item,
    Service
}KHRequestType;

#endif

extern NSString * const KHRequestTypeToString[];