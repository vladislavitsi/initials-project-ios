//
//  InputProcessor.m
//  initials-project-ios
//
//  Created by Vladislav Kleschenko on 5/11/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import "InputProcessor.h"

@implementation InputProcessor

- (instancetype)initWithPattern:(NSString *)pattern {
    if (self = [super init]) {
        _pattern = pattern;
    }
    return self;
}


- (void)processInput:(NSString *)text {
    NSCharacterSet *separators = [NSCharacterSet characterSetWithCharactersInString:self.pattern];
    _words = [[text stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@" "]] componentsSeparatedByCharactersInSet:separators];
}

- (NSInteger)count {
    return self.words.count;
}
@end
