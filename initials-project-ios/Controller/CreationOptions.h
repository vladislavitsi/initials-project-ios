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

#define optionsArray @[@"Pattern", @"BackgroundColor", @"FontColor"]

typedef NS_ENUM(NSInteger, CreationsOptionsType) {
    CreationOptionsPattern,
    CreationOptionsBackgroundColor,
    CreationOptionsFontColor
};

@interface CreationOptions : NSObject

- (NSArray *)getOptionsOfType:(CreationsOptionsType)creationOptionsType;

@end
