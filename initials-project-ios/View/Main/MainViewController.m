//
//  MainViewController.m
//  initials-project-ios
//
//  Created by Uladzislau Kleshchanka on 4/29/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import "MainViewController.h"
#import "GalleryTableViewController.h"
#import "ExamplesPagesViewController.h"

#import "PatternDAO.h"

@interface MainViewController ()
- (IBAction)galleryAction:(UIButton *)sender;
- (IBAction)examplesAction:(UIButton *)sender;
- (IBAction)startAction:(UIButton *)sender;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)galleryAction:(UIButton *)sender {
    GalleryTableViewController *viewController = [[GalleryTableViewController alloc] initWithNibName:@"GalleryTableViewController" bundle:nil];
    viewController.title = @"Gallery";
    [self.navigationController pushViewController:viewController animated:YES];
}
- (IBAction)examplesAction:(UIButton *)sender {
    ExamplesPagesViewController *viewController = [[ExamplesPagesViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    viewController.title = @"Examples";
    [self.navigationController pushViewController:viewController animated:YES];
}


- (IBAction)startAction:(UIButton *)sender {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Create Handkerchief" message:@"Please, enter your full name.It must consist of 2 or 3 words." preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Start" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
        NSLog(@"%@", PatternDAO.shared.patterns);
    }];
    
    [alert addAction:cancelAction];
    [alert addAction:defaultAction];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        NSLog(@"%@", textField.text);
    }];
    
    [self presentViewController:alert animated:YES completion:nil];
}
@end
