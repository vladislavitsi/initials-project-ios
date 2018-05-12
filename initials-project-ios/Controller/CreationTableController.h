//
//  CreationTableController.h
//  initials-project-ios
//
//  Created by Vladislav Kleschenko on 5/12/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class CreationController;

@interface CreationTableController : NSObject <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) CreationController *creationController;

@end
