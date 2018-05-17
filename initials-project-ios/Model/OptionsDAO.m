//
//  OptionsDAO.m
//  initials-project-ios
//
//  Created by Uladzislau Kleshchanka on 5/7/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import "OptionsDAO.h"
#import "PatternDAO.h"
#import "IPColorDAO.h"
#import "IPFontDAO.h"

@interface OptionsDAO ()

@property (nonatomic, copy) NSArray<AbstractOptionDAO *> *optionDAOs;

@end

@implementation OptionsDAO

- (instancetype)init {
    if (self = [super init]) {
        self.optionDAOs = @[
                            [[PatternDAO alloc] init],
                            [[IPColorDAO alloc] initWithPath:@"BackgroundColors"],
                            [[IPColorDAO alloc] initWithPath:@"FontColors"],
                            [[IPFontDAO alloc] initWithPath:@"Fonts"]
                            ];
    }
    return self;
}

- (NSArray *)getOptionsOfType:(CreationsOptionsType)creationOptionsType {
    return self.optionDAOs[creationOptionsType].options;
}

@end
