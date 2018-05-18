//
//  ResultViewController.m
//  initials-project-ios
//
//  Created by Vladislav Kleschenko on 5/13/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import "ResultViewController.h"
#import "InitialsViewConfigurator.h"

#define MARGINS 2 * 35

@implementation ResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [InitialsViewConfigurator configurateView:self.preview width:[UIScreen mainScreen].bounds.size.width - MARGINS withConfiguration:self.configuration initials:self.initials];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(save)];
}

- (IBAction)save {
    NSDictionary *userInfo = @{
        @"preview":self.preview
    };
    [[NSNotificationCenter defaultCenter] postNotificationName:@"creation.save" object:nil userInfo:userInfo];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    // check if the back button was pressed
    if (self.isMovingFromParentViewController) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"creation.back" object:nil];
    }
}

@end
