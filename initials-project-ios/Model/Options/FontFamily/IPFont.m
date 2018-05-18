//
//  IPFont.m
//  initials-project-ios
//
//  Created by Uladzislau Kleshchanka on 5/14/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import "IPFont.h"

@implementation IPFont

- (instancetype)initWithName:(NSString *)name fontName:(NSString *)fontName {
    if (self = [super init]) {
        self.name = name;
        self.fontName = fontName;
    }
    return self;
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)jsonDictionary {
    return [[IPFont alloc]
            initWithName:jsonDictionary[@"name"]
            fontName:jsonDictionary[@"fontName"]];
}

@end
