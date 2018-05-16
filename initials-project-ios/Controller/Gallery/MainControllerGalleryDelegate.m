//
//  MainControllerGalleryDelegate.m
//  initials-project-ios
//
//  Created by Vladislav Kleschenko on 5/16/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import "MainControllerGalleryDelegate.h"
#import <UIKit/UIKit.h>
#import "UserDataProtocol.h"
#import "GalleryTableController.h"
#import "UserDefaultsUserData.h"
#import "GalleryTableViewController.h"

@interface MainControllerGalleryDelegate ()

@property (nonatomic, strong) id<UserDataProtocol> userDataDAO;
@property (nonatomic, strong) GalleryTableController *gtc;

@end

@implementation MainControllerGalleryDelegate

- (instancetype)initWithDataSource:(id<UserDataProtocol>)dataSource {
    if (self = [super init]) {
        // Using concrete implementation of 'UserDataProtocol'
        self.userDataDAO = dataSource;
    }
    return self;
}

- (void)start {
    GalleryTableViewController *viewController = [[GalleryTableViewController alloc] init];
    self.gtc = [[GalleryTableController alloc] init];
    self.gtc.dataSource = self.userDataDAO;
    [viewController.tableView registerNib:[UINib nibWithNibName:@"GalleryTableViewCell" bundle:nil] forCellReuseIdentifier:@"GalleryTableViewCell"];
    viewController.title = @"Gallery";
    viewController.tableView.delegate = self.gtc;
    viewController.tableView.dataSource = self.gtc;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"navigate.push" object:nil userInfo:@{@"destination":viewController}];
}

@end
