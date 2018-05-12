//
//  NavigationController.m
//  initials-project-ios
//
//  Created by Vladislav Kleschenko on 5/11/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import "NavigationController.h"

@interface NavigationController ()

@end

@implementation NavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter] postNotificationName:@"initNavigationController" object:nil userInfo:@{@"controller":self}];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
