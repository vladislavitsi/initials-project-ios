//
//  GalleryTableController.h
//  initials-project-ios
//
//  Created by Vladislav Kleschenko on 5/15/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UserDataProtocol.h"

@interface GalleryTableController : NSObject <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) id<UserDataProtocol> dataSource;

@end
