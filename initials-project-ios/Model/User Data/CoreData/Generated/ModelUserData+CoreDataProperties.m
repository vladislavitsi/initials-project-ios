//
//  ModelUserData+CoreDataProperties.m
//  initials-project-ios
//
//  Created by Uladzislau Kleshchanka on 6/4/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//
//

#import "ModelUserData+CoreDataProperties.h"

@implementation ModelUserData (CoreDataProperties)

+ (NSFetchRequest<ModelUserData *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"ModelUserData"];
}

@dynamic name;
@dynamic creationDate;
@dynamic imagePath;

@end
