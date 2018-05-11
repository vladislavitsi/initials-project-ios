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
#import "CreationOptions.h"

@interface IPCreationConfiguration : NSObject <NSCopying>

@property (nonatomic, readonly) NSArray<NSString *> *initials;
@property (nonatomic, strong) Pattern *pattern;
@property (nonatomic, strong) IPColor *fontColor;
@property (nonatomic, strong) IPColor *backgroundColor;

+ (instancetype)defaultConfigurationWithInitials:(NSArray<NSString *> *)initials;

- (void)applyConfigurationChangeForOption:(CreationsOptionsType)optionType withObject:(id)object;
@end
