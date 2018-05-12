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
#import "CreationController.h"
#import "CellConfigurator.h"

@implementation CreationTableController

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.creationController countOfOptions];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PreviewCell" forIndexPath:indexPath];
    IPCreationConfiguration *cellConfig = [self.creationController configurationForIndex:indexPath.row];
    [CellConfigurator configurateCell:cell withConfiguration:cellConfig initials:self.creationController.initials];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"creation.selectedOption"
                                                      object:nil
                                                      userInfo:@{
                                                                    @"selectedIndex":@(indexPath.row),
                                                                    @"previewView":((TableViewCell *)[tableView cellForRowAtIndexPath:indexPath]).preview
                                                                }];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 300;
}

@end
