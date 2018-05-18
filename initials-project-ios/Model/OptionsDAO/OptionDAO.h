//
//  OptionDAO.h
//  initials-project-ios
//
//  Created by Vladislav Kleschenko on 5/13/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AbstractOption;

@interface OptionDAO : NSObject

@property (nonatomic, copy) NSArray<AbstractOption *> *options;

- (instancetype)initWithPath:(NSString *)path class:(Class)klass;

@end
