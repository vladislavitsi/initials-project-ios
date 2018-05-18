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

+ (IPCreationConfiguration *)defaultConfigurationForCreationOptionsManager:(OptionCollectionDAO *)creationOptionsManager {
    IPCreationConfiguration *creationConfiguration = [[IPCreationConfiguration alloc] init];
    creationConfiguration.options = [@[
                                      [[creationOptionsManager getOptionsOfType:CreationOptionsPattern] firstObject],
                                      [[IPColor alloc] initWithName:@"White" color:[UIColor whiteColor]],
                                      [[IPColor alloc] initWithName:@"Black" color:[UIColor blackColor]],
                                      [[creationOptionsManager getOptionsOfType:CreationOptionsFontFamily] firstObject]
                                      ] mutableCopy];
    return creationConfiguration;
}

+ (IPCreationConfiguration *)newConfigurationWith:(IPCreationConfiguration *)configuration changedWithType:(CreationsOptionsType)type option:(AbstractOption *)object {
    IPCreationConfiguration *newConfiguration = [configuration copy];
    newConfiguration.options[type] = object;
    newConfiguration.name = object.name;
    return newConfiguration;
}

@end
