//
//  GalleryDetailsViewController.m
//  initials-project-ios
//
//  Created by Uladzislau Kleshchanka on 4/29/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import "GalleryDetailsViewController.h"

@interface GalleryDetailsViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@end

@implementation GalleryDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.imageV.image = self.image;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    // check if the back button was pressed
    if (self.isMovingFromParentViewController) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"creation.back" object:nil];
    }
}

@end
