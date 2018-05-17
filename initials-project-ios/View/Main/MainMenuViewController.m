//
//  MainMenuViewController.m
//  initials-project-ios
//
//  Created by Uladzislau Kleshchanka on 4/29/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import "MainMenuViewController.h"

@interface MainMenuViewController ()
- (IBAction)galleryAction:(UIButton *)sender;
- (IBAction)examplesAction:(UIButton *)sender;
- (IBAction)startAction:(UIButton *)sender;

@end

@implementation MainMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)galleryAction:(UIButton *)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"action.galleryButton" object:nil];
}
- (IBAction)examplesAction:(UIButton *)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"action.examplesButton" object:nil];
}

- (IBAction)startAction:(UIButton *)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"action.startButton" object:nil];
}

- (void)viewDidAppear:(BOOL)animated {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"action.mainControllerAppeared" object:nil];
}
@end
