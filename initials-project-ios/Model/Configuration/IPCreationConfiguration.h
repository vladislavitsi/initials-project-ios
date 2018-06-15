//
//  IPCreationConfiguration.h
//  initials-project-ios
//
//  Created by Uladzislau Kleshchanka on 5/7/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pattern.h"
#import "IPColor.h"
#import "OptionCollectionDAO.h"

@interface IPCreationConfiguration : NSObject

@property (nonatomic, copy, nullable) NSString *name;

@property (nonatomic, copy, nonnull) NSMutableArray<AbstractOption *> *options;


- (instancetype _Nonnull )copy;
@end
