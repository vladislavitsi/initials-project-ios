//
//  IPCreationConfiguration.m
//  initials-project-ios
//
//  Created by Uladzislau Kleshchanka on 5/7/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import "IPCreationConfiguration.h"
#import "CreationOptions.h"

@implementation IPCreationConfiguration

- (instancetype)initWithInitias:(NSString *)initials {
    if (self = [super init]) {
        _initials = [initials copy];
    }
    return self;
}

+ (instancetype)defaultConfigurationWithInitials:(NSString *)initials {
    IPCreationConfiguration *defaultConfiguaration = [[IPCreationConfiguration alloc] initWithInitias:initials];
    defaultConfiguaration.pattern = [[CreationOptions.shared getOptionsOfType:CreationOptionsPattern] firstObject];
    defaultConfiguaration.fontColor = [[CreationOptions.shared getOptionsOfType:CreationOptionsFontColor] firstObject];
    defaultConfiguaration.backgroundColor = [[CreationOptions.shared getOptionsOfType:CreationOptionsBacgroundColor] firstObject];
    return defaultConfiguaration;
}

- (void)applyConfigurationChangeForOption:(CreationsOptionsType)optionType withObject:(id)object {
//    TO BE IMPLEMENTED
}
@end
