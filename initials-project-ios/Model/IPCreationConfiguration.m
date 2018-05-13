//
//  IPCreationConfiguration.m
//  initials-project-ios
//
//  Created by Uladzislau Kleshchanka on 5/7/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import "IPCreationConfiguration.h"
#import "CreationOptions.h"

@interface IPCreationConfiguration ()

@end

@implementation IPCreationConfiguration

- (instancetype)init {
    if (self = [super init]) {
        _options = [NSMutableArray array];
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
    IPCreationConfiguration *copy = [[IPCreationConfiguration alloc] init];
    for (int i = 0; i < self.options.count; i++) {
        copy.options[i] = self.options[i];
    }
    return copy;
}

- (id)copy {
    return [self copyWithZone:nil];
}
@end
