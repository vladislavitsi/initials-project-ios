//
//  IPCoreDataController.h
//  initials-project-ios
//
//  Created by Uladzislau Kleshchanka on 6/4/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface IPCoreDataController : NSObject

@property (strong, nonatomic, readonly) NSPersistentContainer *persistentContainer;

- (id)init;

@end
