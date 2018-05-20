//
//  CreationTableViewController.m
//  initials-project-ios
//
//  Created by Vladislav Kleschenko on 5/12/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import "CreationTableViewController.h"
#import "Constants.h"

@interface CreationTableViewController ()

@end

@implementation CreationTableViewController


- (void)viewDidLoad {
    [self.tableView registerNib:[UINib nibWithNibName:@"PreviewCell" bundle:nil] forCellReuseIdentifier:@"PreviewCell"];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];

    // check if the back button was pressed
    if (self.isMovingFromParentViewController) {
        [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_CREATION_BACK object:nil];
    }
}

@end
