//
//  IPCoreDataController.m
//  initials-project-ios
//
//  Created by Uladzislau Kleshchanka on 6/4/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import "IPCoreDataController.h"

@implementation IPCoreDataController


- (id)init {
    self = [super init];
    if (!self) return nil;
    
    _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"Model"];
    [self.persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *description, NSError *error) {
        if (error != nil) {
            NSLog(@"Failed to load Core Data stack: %@", error);
            abort();
        }
    }];
    
    return self;
}

@end
