//
//  MainControllerStartDelegate.m
//  initials-project-ios
//
//  Created by Vladislav Kleschenko on 5/12/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import "MainControllerStartDelegate.h"
#import "IPConfigurationConfigurator.h"
#import "CreationTableViewController.h"
#import "ResultViewController.h"
#import "InputProcessor.h"
#import "Screenshotter.h"

@interface MainControllerStartDelegate ()

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) CreationsOptionsType currentOptionType;
@property (nonatomic, strong) NSMutableArray<IPCreationConfiguration *> *configurationHistory;
@property (nonatomic, strong) OptionsDAO *optionsDAO;
@property (nonatomic, strong) CreationTableController *creationTableController;

- (void)stepBack;
- (void)save:(NSNotification *)notification;
- (void)nextTableView;
- (void)goToResult;

@end

@implementation MainControllerStartDelegate


-(instancetype)initWithName:(NSString *)name{
    if (self = [super init]) {
        self.name = name;
    }
    return self;
}

- (void)start {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(stepBack) name:@"creation.back" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(save:) name:@"creation.save" object:nil];

    InputProcessor *inputProcessor = [[InputProcessor alloc] initWithPattern:@" -"];
    [inputProcessor processInput:self.name];
    if (inputProcessor.count >= 2 && inputProcessor.count <= 3) {
        self.initials = inputProcessor.initials;
        self.optionsDAO = [[OptionsDAO alloc] init];

        self.configurationHistory = [NSMutableArray array];
        [self.configurationHistory addObject:[IPConfigurationConfigurator defaultConfigurationForCreationOptionsManager:self.optionsDAO]];

        CreationTableController *tableController = [[CreationTableController alloc] init];
        self.creationTableController = tableController;
        tableController.mainControllerStartDelegate = self;

        [self nextTableView];
    }
}

- (void)save:(NSNotification *)notification {
    NSDictionary *userInfo = @{
        @"name":self.name,
        @"image":[Screenshotter imageWithView:notification.userInfo[@"preview"]]
    };
    [[NSNotificationCenter defaultCenter] postNotificationName:@"creation.saveAndExit" object:nil userInfo:userInfo];
}


- (void)stepBack {
    if (self.configurationHistory.count > 0) {
        [self.configurationHistory removeLastObject];
    }
    self.currentOptionType--;
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
    NSArray<AbstractOption *> *currentOptions = [self.optionsDAO getOptionsOfType:self.currentOptionType];
    if (self.currentOptionType == CreationOptionsPattern) {
        NSInteger initialsCount = self.initials.count;
        currentOptions = [currentOptions filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(Pattern *option, NSDictionary<NSString *, id> *bindings) {
            return option.letterPatterns.count == initialsCount;
        }]];
    }
    self.creationTableController.currentOptions = currentOptions;

    CreationTableViewController *newTableViewController = [[CreationTableViewController alloc] init];
    newTableViewController.tableView.dataSource = self.creationTableController;
    newTableViewController.tableView.delegate = self.creationTableController;
    newTableViewController.title = OPTIONS_TITLES[self.currentOptionType];

    [[NSNotificationCenter defaultCenter] postNotificationName:@"navigate.push" object:nil userInfo:@{@"destination":newTableViewController}];
}

#pragma mark - Public interface

- (IPCreationConfiguration *)configurationForOption:(AbstractOption *)option {
    return [IPConfigurationConfigurator newConfigurationWith:[self.configurationHistory lastObject] changedWithType:self.currentOptionType option:option];
}

- (void)didSelectOption:(AbstractOption *)option {

    [self.configurationHistory addObject: [IPConfigurationConfigurator newConfigurationWith:[self.configurationHistory lastObject]
                                                                            changedWithType:self.currentOptionType
                                                                                     option:option]];
    self.currentOptionType++;

    if (self.currentOptionType >= OPTIONS_TITLES.count) {
        [self goToResult];
    } else {
        [self nextTableView];
    }
}

@end
