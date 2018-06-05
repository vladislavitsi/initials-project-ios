//
//  ModelUserData+CoreDataProperties.h
//  initials-project-ios
//
//  Created by Uladzislau Kleshchanka on 6/4/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//
//

#import "ModelUserData+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface ModelUserData (CoreDataProperties)

+ (NSFetchRequest<ModelUserData *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSDate *creationDate;
@property (nullable, nonatomic, copy) NSString *imagePath;

@end

NS_ASSUME_NONNULL_END
