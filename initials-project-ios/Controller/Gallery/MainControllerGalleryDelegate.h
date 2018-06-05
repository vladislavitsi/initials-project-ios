//
//  MainControllerGalleryDelegate.h
//  initials-project-ios
//
//  Created by Vladislav Kleschenko on 5/16/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MainControllerDelegate.h"
#import "UserDataDAOProtocol.h"

@interface MainControllerGalleryDelegate : NSObject <MainControllerDelegate>

- (instancetype)initWithDataSource:(id<UserDataDAOProtocol>)dataSource;

- (void)start;

@end
