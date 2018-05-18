//
//  Pattern.m
//  initials-project-ios
//
//  Created by Vladislav Kleschenko on 5/2/18.
//  Copyright © 2018 Vladislav Kleschenko. All rights reserved.
//

#import "Pattern.h"
#import "LetterPattern.h"

@implementation Pattern

- (instancetype)initWithName:(NSString *)name letterPatterns:(NSArray<LetterPattern *> *)letterPatterns {
    if (self = [super init]) {
        self.name = [name copy];
        _letterPatterns = [letterPatterns copy];
    }
    return self;
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)jsonDictionary {
    NSMutableArray *letters = [NSMutableArray array];
    for (NSDictionary *letterDictionary in jsonDictionary[@"letters"]) {
        [letters addObject:[LetterPattern fromDictionary:letterDictionary]];
    }
    return [[Pattern alloc] initWithName:jsonDictionary[@"name"]
                letterPatterns:letters];
}

@end
