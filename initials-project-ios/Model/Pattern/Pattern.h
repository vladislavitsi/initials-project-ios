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

@property (nonatomic, readonly) NSInteger size;
@property (nonatomic, readonly) NSInteger lettersCount;
@property (nonatomic, readonly) NSArray<LetterPattern *> *letterPatterns;

- (instancetype)initWithName:(NSString *)name size:(NSInteger)size lettersCount:(NSInteger)lettersCount letterPatterns:(NSArray<LetterPattern *>*)letterPatterns;

+ (instancetype)fromJSONDictionary:(NSDictionary *)jsonDictionary;

@end
