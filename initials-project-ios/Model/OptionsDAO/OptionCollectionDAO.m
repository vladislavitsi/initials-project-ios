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
                            [[OptionDAO alloc] initWithFileName:@"Resource/patterns.json" class:[Pattern class]],
                            [[OptionDAO alloc] initWithFileName:@"Resource/backgroundColors.json" class:[IPColor class]],
                            [[OptionDAO alloc] initWithFileName:@"Resource/fontColors.json" class:[IPColor class]],
                            [[OptionDAO alloc] initWithFileName:@"Resource/fonts.json" class:[IPFont class]]
                            ];
    }
    return self;
}

- (NSArray *)getOptionsOfType:(CreationsOptionsType)creationOptionsType {
    return self.optionDAOs[creationOptionsType].options;
}

@end

