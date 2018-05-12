//
//  IPConfigurationConfigurator.m
//  initials-project-ios
//
//  Created by Vladislav Kleschenko on 5/12/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import "IPConfigurationConfigurator.h"
#import "IPCreationConfiguration.h"

@implementation IPConfigurationConfigurator

+ (IPCreationConfiguration *)defaultConfigurationForCreationOptionsManager:(CreationOptions *)creationOptionsManager {
    IPCreationConfiguration *defaultConfiguaration = [[IPCreationConfiguration alloc] init];
    defaultConfiguaration.pattern = [[creationOptionsManager getOptionsOfType:CreationOptionsPattern] firstObject];
    defaultConfiguaration.fontColor = [[creationOptionsManager getOptionsOfType:CreationOptionsFontColor] firstObject];
    defaultConfiguaration.backgroundColor = [[creationOptionsManager getOptionsOfType:CreationOptionsBackgroundColor] firstObject];
    return defaultConfiguaration;
}

+ (IPCreationConfiguration *)applyChangesFor:(IPCreationConfiguration *)configuration OfType:(CreationsOptionsType)type withObject:(id)object {
    IPCreationConfiguration *newConfiguration = [configuration copy];
    switch (type) {
        case CreationOptionsPattern:
            newConfiguration.pattern = object;
            break;
        case CreationOptionsBackgroundColor:
            newConfiguration.backgroundColor = object;
            break;
        case CreationOptionsFontColor:
            newConfiguration.fontColor = object;
            break;
    }
    return newConfiguration;
}

@end
