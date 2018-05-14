//
//  UserDefaultsUserData.m
//  initials-project-ios
//
//  Created by Uladzislau Kleshchanka on 5/14/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import "UserDefaultsUserData.h"

#define ARRAY_KEY @"userDataArray"

@interface UserDefaultsUserData ()

@property (nonatomic, strong) NSMutableArray<UserData *> *userDataArray;
@property (nonatomic, strong) NSUserDefaults *defaults;
@property (nonatomic, strong) dispatch_queue_t serialQueue;

- (NSMutableArray<UserData *> *)loadUserData;
- (void)unsureLoading;
- (void)saveChanges;
@end

@implementation UserDefaultsUserData

#pragma mark - Public interface

- (void)addUserData:(UserData *)userData {
    [self unsureLoading];
    [self.userDataArray addObject:userData];
}

- (NSArray<UserData *> *)getAllUserData {
    [self unsureLoading];
    return [NSArray arrayWithArray:self.userDataArray];
}

- (void)removeUserData:(UserData *)userData {
    [self unsureLoading];
    [self.userDataArray removeObject:userData];
}

#pragma mark - Private inteface

- (instancetype)init {
    if (self = [super init]) {
        self.defaults = [NSUserDefaults standardUserDefaults];
        self.serialQueue = dispatch_queue_create("com.vladi.initials-project-ios.dataAccessSerial", DISPATCH_QUEUE_SERIAL);
    }
    return self;
}

- (NSMutableArray<UserData *> *)loadUserData {
    NSMutableArray *dataArray = [NSMutableArray array];
    NSMutableArray *savedArray = [[self.defaults arrayForKey:ARRAY_KEY] mutableCopy];
    if (savedArray != nil) {
        [dataArray addObjectsFromArray:savedArray];

    }
    return dataArray;
}

- (void)saveChanges {
    dispatch_async(self.serialQueue, ^{
        [self.defaults setObject:self.userDataArray forKey:ARRAY_KEY];
    });
}

- (void)unsureLoading {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (self.userDataArray == nil) {
            self.userDataArray = [self loadUserData];
        }
    });
}

@end
