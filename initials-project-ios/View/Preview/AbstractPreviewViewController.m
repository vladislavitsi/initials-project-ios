//
//  AbstractPreviewViewController.m
//  initials-project-ios
//
//  Created by Vladislav Kleschenko on 5/13/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import "AbstractPreviewViewController.h"

@interface AbstractPreviewViewController ()

@end

@implementation AbstractPreviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.nameLabel.text = self.name;
//    [self makeRoundCorners];
    [self makeShadow];
}

- (void)makeShadow {
    self.preview.layer.shadowColor = [UIColor blackColor].CGColor;
    self.preview.layer.shadowOffset = CGSizeMake(0.0f, 0.0f);
    self.preview.layer.shadowOpacity = 0.25f;
    self.preview.layer.shadowRadius = 10.0f;
}

- (void)makeRoundCorners {
    self.preview.layer.cornerRadius = 5;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
