//
//  UserDefaultsUserData.m
//  initials-project-ios
//
//  Created by Uladzislau Kleshchanka on 5/14/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import "UserDefaultsUserData.h"
#import "UserData.h"
#import "IPFileManager.h"

#define ARRAY_KEY @"userDataArray"

@interface UserDefaultsUserData ()

@property (nonatomic, strong) NSMutableArray<NSData *> *array;
@property (nonatomic, strong) NSUserDefaults *defaults;

- (NSMutableArray<NSData *> *)loadUserData;
@end

@implementation UserDefaultsUserData

#pragma mark - Public interface

- (id<UserDataProtocol>)addUserDataWithName:(NSString *)name date:(NSDate *)date imagePath:(NSString *)imagePath {
    UserData *userData = [[UserData alloc] initWithName:name creationDate:date imagePath:imagePath];
    [self.array addObject:[userData toJSON]];
    return userData;
}

- (void)removeUserDataForIndex:(NSInteger)index {
    [IPFileManager removeImageAtPath:[self getDataForIndex:index].imagePath];
    [self.array removeObjectAtIndex:index];
}

- (NSInteger)count {
    return self.array.count;
}

- (id<UserDataProtocol>)getDataForIndex:(NSInteger)index {
    return [UserData fromJSON:self.array[index]];
}

#pragma mark - Private inteface

- (instancetype)init {
    if (self = [super init]) {
        self.defaults = [NSUserDefaults standardUserDefaults];
    }
    return self;
}

- (NSMutableArray<NSData *> *)array {
    UserDefaultsUserData *weakSelf = self;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        weakSelf.array = [self loadUserData];
    });
    return _array;
}

- (NSMutableArray<NSData *> *)loadUserData {
    NSMutableArray<NSData *> *array = [self.defaults mutableArrayValueForKey:ARRAY_KEY];
    if (array == nil) {
        array = [NSMutableArray array];
        [self.defaults setObject:array forKey:ARRAY_KEY];
    }
    return array;
}


@end
