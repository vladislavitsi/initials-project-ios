//
//  CoreDataUserDataDAO.h
//  initials-project-ios
//
//  Created by Uladzislau Kleshchanka on 6/5/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserDataDAOProtocol.h"
#import <CoreData/CoreData.h>

@interface CoreDataUserDataDAO : NSObject <UserDataDAOProtocol>


- (instancetype)initWithContext:(NSManagedObjectContext *)context;

@end
