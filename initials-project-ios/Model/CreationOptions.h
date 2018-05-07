//
//  CreationOptions.h
//  initials-project-ios
//
//  Created by Uladzislau Kleshchanka on 5/7/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pattern.h"
#import "IPColor.h"

@interface CreationOptions : NSObject

@property (nonatomic, readonly) NSArray<Pattern *> *patterns;
@property (nonatomic, readonly) NSArray<IPColor *> *backgroundColors;
@property (nonatomic, readonly) NSArray<Pattern *> *fontColors;

+ (instancetype)shared;

@end
