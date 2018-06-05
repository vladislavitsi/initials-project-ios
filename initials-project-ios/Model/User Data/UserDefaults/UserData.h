//
//  UserData.h
//  initials-project-ios
//
//  Created by Uladzislau Kleshchanka on 5/14/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UserDataProtocol.h"

@interface UserData : NSObject <UserDataProtocol>

- (instancetype)initWithName:(NSString *)name creationDate:(NSDate *)creationDate imagePath:(NSString *)path;

- (NSData *)toJSON;

+ (instancetype)fromJSON:(NSData *)jsonData;

@end
