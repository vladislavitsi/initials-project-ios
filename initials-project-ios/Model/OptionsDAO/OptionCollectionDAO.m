//
//  OptionCollectionDAO.m
//  initials-project-ios
//
//  Created by Uladzislau Kleshchanka on 5/7/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import "OptionCollectionDAO.h"
#import "IPFont.h"
#import "OptionDAO.h"

@interface OptionCollectionDAO ()

@property (nonatomic, copy) NSArray<OptionDAO *> *optionDAOs;

@end

@implementation OptionCollectionDAO

- (instancetype)init {
    if (self = [super init]) {
        self.optionDAOs = @[
                            [[OptionDAO alloc] initWithPath:@"Patterns" class:[Pattern class]],
                            [[OptionDAO alloc] initWithPath:@"BackgroundColors" class:[IPColor class]],
                            [[OptionDAO alloc] initWithPath:@"FontColors" class:[IPColor class]],
                            [[OptionDAO alloc] initWithPath:@"Fonts" class:[IPFont class]]
                            ];
    }
    return self;
}

- (NSArray *)getOptionsOfType:(CreationsOptionsType)creationOptionsType {
    return self.optionDAOs[creationOptionsType].options;
}

@end
