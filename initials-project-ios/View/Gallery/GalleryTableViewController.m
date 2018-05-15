//
//  GalleryTableViewController.m
//  initials-project-ios
//
//  Created by Uladzislau Kleshchanka on 4/29/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import "GalleryTableViewController.h"
#import "GalleryTableViewCell.h"
#import "GalleryDetailsViewController.h"

@interface GalleryTableViewController ()

@end

@implementation GalleryTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self.tableView registerNib:[UINib nibWithNibName:@"GalleryTableViewCell" bundle:nil] forCellReuseIdentifier:@"GalleryTableCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
