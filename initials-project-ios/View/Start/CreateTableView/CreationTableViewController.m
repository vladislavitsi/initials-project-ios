//
//  CreationTableViewController.m
//  initials-project-ios
//
//  Created by Uladzislau Kleshchanka on 5/7/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import "CreationTableViewController.h"

@interface CreationTableViewController ()

@end

@implementation CreationTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [CreationOptions.shared getOptionsOfType:self.currentOption].count;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/



#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CreationsOptionsType nextOption = self.currentOption++;
    if (nextOption == CreationOptionsMax) {
        NSLog(@"Finish");
    }else {
        [self.creationConfiguration applyConfigurationChangeForOption:self.currentOption withObject:[CreationOptions.shared getOptionsOfType:self.currentOption][indexPath.row]];
        CreationTableViewController *nextTableview = [[CreationTableViewController alloc] init];
        CreationTableViewController *tableView = [[CreationTableViewController alloc] init];
        tableView.creationConfiguration = self.creationConfiguration;
        tableView.currentOption = nextOption;
        [self.navigationController pushViewController:nextTableview animated:YES];

    }

}



@end
