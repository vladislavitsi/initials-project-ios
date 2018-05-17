//
//  MainControllerStartDelegate.h
//  initials-project-ios
//
//  Created by Vladislav Kleschenko on 5/12/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IPCreationConfiguration.h"
#import "CreationTableController.h"
#import "MainControllerDelegate.h"

@interface MainControllerStartDelegate : NSObject <MainControllerDelegate>

@property (nonatomic, copy) NSArray<NSString *> *initials;

- (instancetype)initWithName:(NSString *)name;

- (IPCreationConfiguration *)configurationForOption:(AbstractOption *)option;

- (void)start;
- (void)didSelectOption:(AbstractOption *)option;

@end
