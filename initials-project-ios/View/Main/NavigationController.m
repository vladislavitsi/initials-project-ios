//
//  NavigationController.m
//  initials-project-ios
//
//  Created by Vladislav Kleschenko on 5/11/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import "NavigationController.h"
#import "Constants.h"

@interface NavigationController ()

@end

@implementation NavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_INIT_NAVIGATION_CONTROLLER object:nil userInfo:@{NOTIFICATION_USER_INFO_CONTROLLER:self}];
}

@end
