//
//  CreationTableController.m
//  initials-project-ios
//
//  Created by Vladislav Kleschenko on 5/12/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import "CreationTableController.h"
#import "TableViewCell.h"
#import "IPCreationConfiguration.h"
#import "MainControllerStartDelegate.h"
#import "initials_project_ios-Swift.h"

@implementation CreationTableController

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.currentOptions.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PreviewCell" forIndexPath:indexPath];


    return cell;
}


#pragma mark - Table View delegate
#define MARGINS 2 * 20

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.mainControllerStartDelegate didSelectOption:self.currentOptions[indexPath.row]];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *tCell = (TableViewCell *)cell;
    IPCreationConfiguration *cellConfig = [self.mainControllerStartDelegate configurationForOption:self.currentOptions[indexPath.row]];
    tCell.descr.text = cellConfig.name;
    [InitialsViewConfigurator configurateView:tCell.preview width:tableView.frame.size.width - MARGINS withConfiguration:cellConfig initials:self.mainControllerStartDelegate.initials];
}

- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {

}

@end
