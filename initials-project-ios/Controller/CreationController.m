//
//  CreationController.m
//  initials-project-ios
//
//  Created by Vladislav Kleschenko on 5/12/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import "CreationController.h"
#import "CreationOptions.h"
#import "IPConfigurationConfigurator.h"
#import "CreationTableViewController.h"
#import "GalleryDetailsViewController.h"

@interface CreationController ()

@property (nonatomic, assign) CreationsOptionsType currentOption;
@property (nonatomic, strong) NSMutableArray<IPCreationConfiguration *> *configurationHistory;
@property (nonatomic, strong) CreationOptions *creationOptionsManager;
@property (nonatomic, strong) CreationTableController *creationTableDataSource;

@end

@implementation CreationController

- (instancetype)initWithWords:(NSArray<NSString *> *)words {
    if (self = [super init]) {
        NSMutableArray *initials = [NSMutableArray array];
        for (NSString *word in words) {
            [initials addObject:[word substringToIndex:1]];
        }
        self.initials = initials;
        self.creationOptionsManager = [[CreationOptions alloc] init];
        self.configurationHistory = [NSMutableArray array];
        [self.configurationHistory addObject:[IPConfigurationConfigurator defaultConfigurationForCreationOptionsManager:self.creationOptionsManager]];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didSelectOption:) name:@"creation.selectedOption" object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(stepBack) name:@"creation.back" object:nil];
    }
    return self;
}

- (void)stepBack {
    if (self.configurationHistory.count > 0) {
        [self.configurationHistory removeLastObject];
    }
    self.currentOption--;
}


+ (UIImage *)imageWithView:(UIView *)view{
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return img;
}

- (void)didSelectOption:(NSNotification *)notification {
    NSInteger selectedIndex = [notification.userInfo[@"selectedIndex"] integerValue];
    
    [self.configurationHistory addObject: [IPConfigurationConfigurator
                                  applyChangesFor:[self.configurationHistory lastObject]
                                  OfType:self.currentOption
                                  withObject:[self.creationOptionsManager getOptionsOfType:self.currentOption][selectedIndex]]];
    self.currentOption++;
    
    if (self.currentOption > CreationOptionsLast) {
        GalleryDetailsViewController *vc = [[GalleryDetailsViewController alloc] initWithNibName:@"GalleryDetailsViewController" bundle:nil];
        vc.image = [CreationController imageWithView:notification.userInfo[@"previewView"]];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"navigate.push" object:nil userInfo:@{@"destination":vc}];
        return;
    }
    
    CreationTableViewController *tableViewController = [[CreationTableViewController alloc] init];
    tableViewController.tableView.dataSource = self.creationTableDataSource;
    tableViewController.tableView.delegate = self.creationTableDataSource;
    [tableViewController.tableView registerNib:[UINib nibWithNibName:@"PreviewCell" bundle:nil] forCellReuseIdentifier:@"PreviewCell"];
        
    [[NSNotificationCenter defaultCenter] postNotificationName:@"navigate.push" object:nil userInfo:@{@"destination":tableViewController}];
}

- (void)start {
    CreationTableController *tableController = [[CreationTableController alloc] init];
    self.creationTableDataSource = tableController;
    
    CreationTableViewController *tableViewController = [[CreationTableViewController alloc] init];
    tableViewController.tableView.dataSource = tableController;
    tableViewController.tableView.delegate = tableController;
    [tableViewController.tableView registerNib:[UINib nibWithNibName:@"PreviewCell" bundle:nil] forCellReuseIdentifier:@"PreviewCell"];
    
    tableController.creationController = self;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"navigate.push" object:nil userInfo:@{@"destination":tableViewController}];
}

- (NSInteger)countOfOptions {
    return [self.creationOptionsManager getOptionsOfType:self.currentOption].count;
}

- (IPCreationConfiguration *)configurationForIndex:(NSInteger)index {
    id obj = [self.creationOptionsManager getOptionsOfType:self.currentOption][index];
    return [IPConfigurationConfigurator applyChangesFor:[self.configurationHistory lastObject] OfType:self.currentOption withObject:obj];
}

@end
