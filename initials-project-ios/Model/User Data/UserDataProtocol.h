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

- (UserData *)getDataForIndex:(NSInteger)index;
- (NSInteger)count;
- (void)addUserData:(UserData *)userData;
- (void)removeUserDataForIndex:(NSInteger)index;

@end
