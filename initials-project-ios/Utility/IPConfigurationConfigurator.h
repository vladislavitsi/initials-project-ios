//
//  IPConfigurationConfigurator.h
//  initials-project-ios
//
//  Created by Vladislav Kleschenko on 5/12/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IPCreationConfiguration.h"
#import "OptionsDAO.h"
#import "AbstractOption.h"

@interface IPConfigurationConfigurator : NSObject

+ (IPCreationConfiguration *)defaultConfigurationForCreationOptionsManager:(OptionsDAO *)creationOptionsManager;

+ (IPCreationConfiguration *)newConfigurationWith:(IPCreationConfiguration *)configuration changedWithType:(CreationsOptionsType)type option:(AbstractOption *)object;
@end
