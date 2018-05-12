//
//  MainController.m
//  initials-project-ios
//
//  Created by Vladislav Kleschenko on 5/11/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//


#import "MainController.h"
#import "NameDialogAlertController.h"
#import "GalleryTableViewController.h"
#import "ExamplesPagesViewController.h"
#import "InputProcessor.h"
#import "CreationTableController.h"
#import "CreationController.h"

@interface MainController ()

@property (nonatomic, strong) CreationController *creationController;

@end

@implementation MainController

- (instancetype)init {
    if (self = [super init]) {
        [[NSNotificationCenter defaultCenter] addObserverForName:@"initNavigationController" object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
            self.navigationController = note.userInfo[@"controller"];
        }];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(startButton) name:@"action.startButton" object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(galleryButton) name:@"action.galleryButton" object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(examplesButton) name:@"action.examplesButton" object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(navigateTo:) name:@"navigate.push" object:nil];
    }
    return self;
}

- (void)navigateTo:(NSNotification *)notification {
    [self.navigationController pushViewController:notification.userInfo[@"destination"] animated:YES];
}

- (void)galleryButton {
    GalleryTableViewController *viewController = [[GalleryTableViewController alloc] initWithNibName:@"GalleryTableViewController" bundle:nil];
    viewController.title = @"Gallery";
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)examplesButton {
    ExamplesPagesViewController *viewController = [[ExamplesPagesViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    viewController.title = @"Examples";
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)startButton {
    UIAlertController* alert = [NameDialogAlertController actionWithHandler:^(UIAlertController *controller) {
        NSString *inputText = controller.textFields[0].text;

        InputProcessor *inputProcessor = [[InputProcessor alloc] initWithPattern:@" -"];
        [inputProcessor processInput:inputText];
        
        if (inputProcessor.count >= 2 && inputProcessor.count <= 3) {
            self.creationController = [[CreationController alloc] initWithWords:inputProcessor.words];
            [self.creationController start];
        }
    }];
    
    [self.navigationController presentViewController:alert animated:YES completion:nil];
}

- (void)initiateCreation:(NSArray<NSString *> *)words {

    

}

@end
