//
//  CreationTableController.h
//  initials-project-ios
//
//  Created by Vladislav Kleschenko on 5/12/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "OptionsDAO.h"

@class MainControllerStartDelegate;

@interface CreationTableController : NSObject <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) MainControllerStartDelegate *mainControllerStartDelegate;
@property(nonatomic, copy) NSArray<AbstractOption *> * currentOptions;

@end
