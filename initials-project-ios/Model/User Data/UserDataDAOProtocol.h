//
//  UserDataDAOProtocol.h
//  initials-project-ios
//
//  Created by Uladzislau Kleshchanka on 5/14/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserDataProtocol.h"

@protocol UserDataDAOProtocol <NSObject>

- (id<UserDataProtocol>)getDataForIndex:(NSInteger)index;
- (NSInteger)count;
- (id<UserDataProtocol>)addUserDataWithName:(NSString *)name date:(NSDate *)date imagePath:(NSString *)imagePath;
- (void)removeUserDataForIndex:(NSInteger)index;

@end
