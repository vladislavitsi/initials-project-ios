//
//  GalleryTableController.m
//  initials-project-ios
//
//  Created by Vladislav Kleschenko on 5/15/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import "GalleryTableController.h"
#import "GalleryTableViewCell.h"
#import "GalleryDetailsViewController.h"
#import "IPFileManager.h"

@implementation GalleryTableController

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GalleryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GalleryTableViewCell" forIndexPath:indexPath];
    UserData* userData = [self.dataSource getDataForIndex:indexPath.row];
    cell.textLabel.text = userData.name;
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    GalleryDetailsViewController *detailViewController = [[GalleryDetailsViewController alloc] initWithNibName:@"Preview" bundle:nil];
    
    UserData *userData = [self.dataSource getDataForIndex:indexPath.row];
    
    // Pass the selected object to the new view controller.
    detailViewController.name = userData.name;
    detailViewController.image = [IPFileManager getImageForPath:userData.imagePath];
    
    // Push the view controller;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"navigate.push" object:nil userInfo:@{
                                                                                         @"destination":detailViewController
                                                                                         }];
}

@end
