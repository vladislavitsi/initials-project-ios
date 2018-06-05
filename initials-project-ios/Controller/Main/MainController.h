//
//  MainController.h
//  initials-project-ios
//
//  Created by Vladislav Kleschenko on 5/11/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NavigationController.h"
#import "UserDataDAOProtocol.h"

@interface MainController : NSObject

@property (nonatomic, strong) id<UserDataDAOProtocol> userDataDAO;

@end
