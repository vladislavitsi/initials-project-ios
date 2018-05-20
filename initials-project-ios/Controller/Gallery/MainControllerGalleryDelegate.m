//
//  MainControllerGalleryDelegate.m
//  initials-project-ios
//
//  Created by Vladislav Kleschenko on 5/16/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import "MainControllerGalleryDelegate.h"
#import "GalleryTableController.h"
#import "GalleryTableViewController.h"
#import "Constants.h"

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
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_NAVIGATION_PUSH object:nil userInfo:@{NOTIFICATION_USER_INFO_DESTINATION:viewController}];
}

@end
