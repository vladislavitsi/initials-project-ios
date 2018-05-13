//
//  CreationOptions.m
//  initials-project-ios
//
//  Created by Uladzislau Kleshchanka on 5/7/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import "CreationOptions.h"
#import "PatternDAO.h"
#import "IPColorDAO.h"

@interface CreationOptions ()

@property (nonatomic, copy) NSArray<AbstractOptionDAO *> *optionDAOs;

@end

@implementation CreationOptions

- (instancetype)init {
    if (self = [super init]) {
        self.optionDAOs = @[
                            [[PatternDAO alloc] init],
                            [[IPColorDAO alloc] initWithPath:@"BackgroundColors"],
                            [[IPColorDAO alloc] initWithPath:@"FontColors"]
                            ];
    }
    return self;
}

- (NSArray *)getOptionsOfType:(CreationsOptionsType)creationOptionsType {
    return self.optionDAOs[creationOptionsType].options;
}

@end
