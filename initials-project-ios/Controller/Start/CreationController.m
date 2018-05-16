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
#import "ResultViewController.h"
#import "InputProcessor.h"
#import "Screenshotter.h"

@interface CreationController ()

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) CreationsOptionsType currentOption;
@property (nonatomic, strong) NSMutableArray<IPCreationConfiguration *> *configurationHistory;
@property (nonatomic, strong) CreationOptions *creationOptionsManager;
@property (nonatomic, strong) CreationTableController *creationTableDataSource;

@end

@implementation CreationController


-(instancetype)initWithName:(NSString *)name{
    if (self = [super init]) {
        self.name = name;
    }
    return self;
}

- (void)start {
    InputProcessor *inputProcessor = [[InputProcessor alloc] initWithPattern:@" -"];
    [inputProcessor processInput:self.name];
    if (inputProcessor.count >= 2 && inputProcessor.count <= 3) {
        self.initials = inputProcessor.initials;
        self.creationOptionsManager = [[CreationOptions alloc] init];
        self.configurationHistory = [NSMutableArray array];
        [self.configurationHistory addObject:[IPConfigurationConfigurator defaultConfigurationForCreationOptionsManager:self.creationOptionsManager]];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didSelectOption:) name:@"creation.selectedOption" object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(stepBack) name:@"creation.back" object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(saveImage:) name:@"creation.save" object:nil];
        [self run];
    }
}

- (void)saveImage:(NSNotification *)notification {
    UIImage *image = [Screenshotter imageWithView:notification.userInfo[@"preview"]];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"creation.saveAndExit" object:nil userInfo:@{
                                                                                                             @"name":self.name,
                                                                                                             @"image":image
                                                                                                             }];
}

- (void)run {
    CreationTableController *tableController = [[CreationTableController alloc] init];
    self.creationTableDataSource = tableController;
    tableController.creationController = self;
    [self nextTableView];
}


- (void)stepBack {
    if (self.configurationHistory.count > 0) {
        [self.configurationHistory removeLastObject];
    }
    self.currentOption--;
}


- (void)didSelectOption:(NSNotification *)notification {
    NSInteger selectedIndex = [notification.userInfo[@"selectedIndex"] integerValue];
    
    [self.configurationHistory addObject: [IPConfigurationConfigurator newConfigurationWith:[self.configurationHistory lastObject]
                                                                            changedWithType:self.currentOption
                                                                                     option:[self.creationOptionsManager getOptionsOfType:self.currentOption][selectedIndex]]];
    self.currentOption++;
    
    if (self.currentOption >= optionsArray.count) {
        [self goToResult];
    } else {
         [self nextTableView];
    }
}

- (void)goToResult {
    ResultViewController *vc = [[ResultViewController alloc] initWithNibName:@"Preview" bundle:nil];
    vc.initials = self.initials;
    vc.configuration = [self.configurationHistory lastObject];
    vc.name = self.name;
    vc.title = @"Preview";
    [[NSNotificationCenter defaultCenter] postNotificationName:@"navigate.push" object:nil userInfo:@{@"destination":vc}];
}

- (void)nextTableView {
    CreationTableViewController *tableViewController = [[CreationTableViewController alloc] init];
    tableViewController.tableView.dataSource = self.creationTableDataSource;
    tableViewController.tableView.delegate = self.creationTableDataSource;
    tableViewController.title = optionsArray[self.currentOption];
    [tableViewController.tableView registerNib:[UINib nibWithNibName:@"PreviewCell" bundle:nil] forCellReuseIdentifier:@"PreviewCell"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"navigate.push" object:nil userInfo:@{@"destination":tableViewController}];
}


#pragma mark - Public interface

- (NSInteger)countOfOptions {
    return [self.creationOptionsManager getOptionsOfType:self.currentOption].count;
}

- (IPCreationConfiguration *)configurationForIndex:(NSInteger)index {
    id obj = [self.creationOptionsManager getOptionsOfType:self.currentOption][index];
    return [IPConfigurationConfigurator newConfigurationWith:[self.configurationHistory lastObject] changedWithType:self.currentOption option:obj];
}




@end
