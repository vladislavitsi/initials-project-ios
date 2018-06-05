//
//  CoreDataUserDataDAO.m
//  initials-project-ios
//
//  Created by Uladzislau Kleshchanka on 6/5/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import "CoreDataUserDataDAO.h"
#import "ModelUserData+CoreDataClass.h"
#import "IPFileManager.h"

#define MODEL_NAME @"ModelUserData"

@interface CoreDataUserDataDAO ()

@property (nonatomic, strong) NSFetchRequest *fetchRequest;
@property (nonatomic, strong) NSManagedObjectContext *context;
@property (nonatomic, strong) NSArray<UserDataProtocol> *dataArray;

- (void)saveContext;

@end

@implementation CoreDataUserDataDAO

- (instancetype)initWithContext:(NSManagedObjectContext *)context {
    if (self = [super init]) {
        self.context = context;
        self.fetchRequest = [NSFetchRequest fetchRequestWithEntityName:MODEL_NAME];
        NSSortDescriptor *dateSort = [NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:NO];
        [self.fetchRequest setSortDescriptors:@[dateSort]];
        [self updateDataArray];
    }
    return self;
}

- (id<UserDataProtocol>)addUserDataWithName:(NSString *)name date:(NSDate *)date imagePath:(NSString *)imagePath {
    ModelUserData *userData = [NSEntityDescription insertNewObjectForEntityForName:MODEL_NAME inManagedObjectContext:self.context];
    userData.name = name;
    userData.creationDate = date;
    userData.imagePath = imagePath;
    [self saveContext];
    [self updateDataArray];
    return (id<UserDataProtocol>)userData;
}

- (void)updateDataArray {
    NSError *error;
    self.dataArray = (NSArray<UserDataProtocol> *)[[self.context executeRequest:self.fetchRequest error:&error] finalResult];
    if (error) {
        NSLog(@"%@", error);
    }
}

- (void)saveContext {
    NSError *error = nil;
    if ([self.context save:&error] == NO) {
        NSAssert(NO, @"Error saving context: %@\n%@", [error localizedDescription], [error userInfo]);
    }
}

- (NSInteger)count {
    NSError *error;
    NSInteger count = [self.context countForFetchRequest:self.fetchRequest error:&error];
    if (error) {
        NSLog(@"%@", error);
        return 0;
    }
    return count;
}

- (id<UserDataProtocol>)getDataForIndex:(NSInteger)index {
    return self.dataArray[index];
}

- (void)removeUserDataForIndex:(NSInteger)index {
    id<UserDataProtocol> userData = [self getDataForIndex:index];
    NSString *imagePath = userData.imagePath;
    [self.context deleteObject:(NSManagedObject *)userData];
    [self saveContext];
    [IPFileManager removeImageAtPath:imagePath];
    [self updateDataArray];
}

@end
