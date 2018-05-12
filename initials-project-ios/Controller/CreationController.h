//
//  CreationController.h
//  initials-project-ios
//
//  Created by Vladislav Kleschenko on 5/12/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IPCreationConfiguration.h"
#import "CreationTableController.h"

@interface CreationController : NSObject

@property (nonatomic, copy) NSArray<NSString *> *initials;

- (instancetype)initWithWords:(NSArray<NSString *> *)words;

- (NSInteger)countOfOptions;

- (IPCreationConfiguration *)configurationForIndex:(NSInteger)index;

- (void)start;

@end
