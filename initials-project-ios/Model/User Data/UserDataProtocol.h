//
//  UserDataProtocol.h
//  initials-project-ios
//
//  Created by Uladzislau Kleshchanka on 5/14/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserData.h"

@protocol UserDataProtocol <NSObject>

- (NSArray<UserData *> *)getAllUserData;
- (void)addUserData:(UserData *)userData;
- (void)removeUserData:(UserData *)userData;

@end
