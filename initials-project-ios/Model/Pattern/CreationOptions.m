//
//  CreationOptions.m
//  initials-project-ios
//
//  Created by Uladzislau Kleshchanka on 5/7/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import "CreationOptions.h"
#import "PatternDAO.h"
#import "IPColorDAO.h"

@interface CreationOptions ()

@property (nonatomic, strong) IPColorDAO *backgroundColorDAO;
@property (nonatomic, strong) IPColorDAO *fontColorDAO;
@property (nonatomic, strong) PatternDAO *patternDAO;

@end

@implementation CreationOptions

static CreationOptions *shared;

- (instancetype)init {
    if (self = [super init]) {
        self.backgroundColorDAO = [[IPColorDAO alloc] initWithPath:@"BackgroundColors"];
        self.fontColorDAO = [[IPColorDAO alloc] initWithPath:@"FontColors"];
        self.patternDAO = [[PatternDAO alloc] init];
    }
    return self;
}

+ (instancetype)shared {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[CreationOptions alloc] init];
    });
    return shared;
}

- (NSArray *)getOptionsOfType:(CreationsOptionsType)creationOptionsType {
    switch (creationOptionsType) {
        case CreationOptionsPattern:
            return self.patternDAO.patterns;
        case CreationOptionsFontColor:
            return self.fontColorDAO.colors;
        case CreationOptionsBacgroundColor:
            return self.backgroundColorDAO.colors;
        case CreationOptionsMax:
            return nil;
    }
}

@end
