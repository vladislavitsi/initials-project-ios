//
//  OptionsDAO.h
//  initials-project-ios
//
//  Created by Uladzislau Kleshchanka on 5/7/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pattern.h"
#import "IPColor.h"

#define OPTIONS_TITLES @[@"Pattern", @"Background Color", @"Font Color", @"Font Family"]

typedef NS_ENUM(NSInteger, CreationsOptionsType) {
    CreationOptionsPattern,
    CreationOptionsBackgroundColor,
    CreationOptionsFontColor,
    CreationOptionsFontFamily
};

@interface OptionsDAO : NSObject

- (NSArray *)getOptionsOfType:(CreationsOptionsType)creationOptionsType;

@end
