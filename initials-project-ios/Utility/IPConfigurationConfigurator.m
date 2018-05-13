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
    defaultConfiguaration.options = [@[
                                      [[creationOptionsManager getOptionsOfType:CreationOptionsPattern] firstObject],
                                      [[IPColor alloc] initWithName:@"White" color:[UIColor whiteColor]],
                                      [[IPColor alloc] initWithName:@"Black" color:[UIColor blackColor]]
                                      ] mutableCopy];
    return defaultConfiguaration;
}

+ (IPCreationConfiguration *)newConfigurationWith:(IPCreationConfiguration *)configuration changedWithType:(CreationsOptionsType)type option:(AbstractOption *)object {
    IPCreationConfiguration *newConfiguration = [configuration copy];
    newConfiguration.options[type] = object;
    newConfiguration.name = object.name;
    return newConfiguration;
}

@end
