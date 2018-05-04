//
//  LetterPattern.m
//  initials-project-ios
//
//  Created by Vladislav Kleschenko on 5/2/18.
//  Copyright © 2018 Vladislav Kleschenko. All rights reserved.
//

#import "LetterPattern.h"

@implementation LetterPattern

- (instancetype)initWithX:(NSInteger)x y:(NSInteger)y {
    if (self = [super init]) {
        _x = x;
        _y = y;
    }
    return self;
}

+ (instancetype)fromDictionary:(NSDictionary *)dictionary {
    return [[LetterPattern alloc] initWithX:[dictionary[@"x"] integerValue]
                                          y:[dictionary[@"y"] integerValue]];
}

@end
