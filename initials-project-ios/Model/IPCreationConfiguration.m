//
//  IPCreationConfiguration.m
//  initials-project-ios
//
//  Created by Uladzislau Kleshchanka on 5/7/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import "IPCreationConfiguration.h"
#import "CreationOptions.h"

@interface IPCreationConfiguration ()

@property (nonatomic, readwrite, copy) NSArray<NSString *> *initials;

@end

@implementation IPCreationConfiguration

- (instancetype)initWithInitias:(NSArray<NSString *> *)initials {
    if (self = [super init]) {
        _initials = [initials copy];
    }
    return self;
}

+ (instancetype)defaultConfigurationWithInitials:(NSArray<NSString *> *)initials {
    IPCreationConfiguration *defaultConfiguaration = [[IPCreationConfiguration alloc] initWithInitias:initials];
    defaultConfiguaration.pattern = [[CreationOptions.shared getOptionsOfType:CreationOptionsPattern] firstObject];
    defaultConfiguaration.fontColor = [[CreationOptions.shared getOptionsOfType:CreationOptionsFontColor] firstObject];
    defaultConfiguaration.backgroundColor = [[CreationOptions.shared getOptionsOfType:CreationOptionsBacgroundColor] firstObject];
    return defaultConfiguaration;
}

- (void)applyConfigurationChangeForOption:(CreationsOptionsType)optionType withObject:(id)object {
    switch (optionType) {
        case CreationOptionsPattern:
            self.pattern = object;
            return;
        case CreationOptionsBacgroundColor:
            self.backgroundColor = object;
            break;
        case CreationOptionsFontColor:
            self.fontColor = object;
        default:
            return;
    }
}

- (id)copyWithZone:(NSZone *)zone {
    IPCreationConfiguration *copy = [[IPCreationConfiguration alloc] init];
    copy.initials = self.initials;
    copy.fontColor = self.fontColor;
    copy.backgroundColor = self.backgroundColor;
    copy.pattern = self.pattern;
    return copy;
}
@end
