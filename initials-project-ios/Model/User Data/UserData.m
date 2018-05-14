//
//  UserData.m
//  initials-project-ios
//
//  Created by Uladzislau Kleshchanka on 5/14/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import "UserData.h"

@implementation UserData

- (instancetype)initWithName:(NSString *)name imagePath:(NSString *)path {
    if (self = [super init]) {
        self.name = name;
        self.imagePath = path;
    }
    return self;
}

@end
