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
#import "IPCreationConfiguration.h"
#import "PatternDAO.h"
#import "CreationTableViewController.h"

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
    
    [alert addTextFieldWithConfigurationHandler:nil];
    
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Start" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
//        NSLog(@"%@", PatternDAO.shared.patterns);

        NSString *inputText = alert.textFields[0].text;
        NSError *error;
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"\\w+" options:0 error:&error];
        
        if (!error) {
            NSArray *matches = [regex matchesInString:inputText options:0 range:NSMakeRange(0, inputText.length)];
            if (matches.count >= 2 && matches.count <= 3) {
                NSMutableString *initials = [NSMutableString string];
                for (NSTextCheckingResult *match in matches) {
                    [initials appendString:[[inputText substringWithRange:[match range]] substringToIndex:1]];
                }
                IPCreationConfiguration *creationConfiguration = [IPCreationConfiguration defaultConfigurationWithInitials:initials];
                CreationTableViewController *tableView = [[CreationTableViewController alloc] init];
                tableView.creationConfiguration = creationConfiguration;
                tableView.currentOption = CreationOptionsFirst;
                [self.navigationController pushViewController:tableView animated:YES];
            }
        }
        

    }];
    
    [alert addAction:cancelAction];
    [alert addAction:defaultAction];

    
    [self presentViewController:alert animated:YES completion:nil];
}
@end
