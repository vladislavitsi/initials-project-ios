//
//  CreationOptions.h
//  initials-project-ios
//
//  Created by Uladzislau Kleshchanka on 5/7/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pattern.h"
#import "IPColor.h"

#define CreationOptionsFirst CreationOptionsPattern

typedef NS_ENUM(NSInteger, CreationsOptionsType) {
    CreationOptionsPattern,
    CreationOptionsBacgroundColor,
    CreationOptionsFontColor,
    CreationOptionsMax
};

@interface CreationOptions : NSObject

+ (instancetype)shared;

- (NSArray *)getOptionsOfType:(CreationsOptionsType)creationOptionsType;

@end
