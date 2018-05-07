//
//  CreateTableViewController.h
//  initials-project-ios
//
//  Created by Uladzislau Kleshchanka on 5/7/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IPCreationConfiguration.h"
#import "CreationOptions.h"

@interface CreationTableViewController : UITableViewController

@property (nonatomic, strong) IPCreationConfiguration *creationConfiguration;
@property (nonatomic, assign) CreationsOptionsType currentOption;

@end
