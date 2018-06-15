//
//  Pattern.h
//  initials-project-ios
//
//  Created by Vladislav Kleschenko on 5/2/18.
//  Copyright © 2018 Vladislav Kleschenko. All rights reserved.
//



#import <Foundation/Foundation.h>
#import "AbstractOption.h"
#import "LetterPattern.h"

@interface Pattern : AbstractOption

@property (nonatomic, readonly, nonnull) NSArray<LetterPattern *> *letterPatterns;

- (instancetype _Nonnull)initWithName:(NSString * _Nonnull)name letterPatterns:(NSArray<LetterPattern *>* _Nonnull)letterPatterns;

@end
