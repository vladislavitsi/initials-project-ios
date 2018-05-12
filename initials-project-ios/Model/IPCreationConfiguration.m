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

@property (nonatomic, readwrite, copy) NSArray<NSString *> *initials;

@end

@implementation IPCreationConfiguration

- (id)copyWithZone:(NSZone *)zone {
    IPCreationConfiguration *copy = [[IPCreationConfiguration alloc] init];
    copy.initials = self.initials;
    copy.fontColor = self.fontColor;
    copy.backgroundColor = self.backgroundColor;
    copy.pattern = self.pattern;
    return copy;
}

- (id)copy {
    return [self copyWithZone:nil];
}
@end
