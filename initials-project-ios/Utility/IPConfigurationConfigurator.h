//
//  IPConfigurationConfigurator.h
//  initials-project-ios
//
//  Created by Vladislav Kleschenko on 5/12/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IPCreationConfiguration.h"
#import "CreationOptions.h"

@interface IPConfigurationConfigurator : NSObject

+ (IPCreationConfiguration *)defaultConfigurationForCreationOptionsManager:(CreationOptions *)creationOptionsManager;

+ (IPCreationConfiguration *)applyChangesFor:(IPCreationConfiguration *)configuration OfType:(CreationsOptionsType)type withObject:(id)object;
@end
