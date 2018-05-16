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
#import "CreationController.h"
#import "UserDefaultsUserData.h"
#import "IPFileManager.h"
#import "GalleryTableController.h"
#import "MainControllerGalleryDelegate.h"

@interface MainController ()

@property (nonatomic, weak) NavigationController *navigationController;
@property (nonatomic, strong) id<MainControllerDelegate> creationControllerDelegate;
@property (nonatomic, strong) id<MainControllerDelegate> galleryControllerDelegate;
@property (nonatomic, strong) id<UserDataProtocol> userDataDAO;

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
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(saveCreation:) name:@"creation.saveAndExit" object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(giveUpStartDelegate) name:@"creation.exit" object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(giveUpGalleryDelegate) name:@"gallery.exit" object:nil];

    }
    return self;
}


#pragma mark - Notification actions

- (void)navigateTo:(NSNotification *)notification {
    [self.navigationController pushViewController:notification.userInfo[@"destination"] animated:YES];
}

- (void)galleryButton {
    self.galleryControllerDelegate = [[MainControllerGalleryDelegate alloc] initWithDataSource:self.userDataDAO];
    [self.galleryControllerDelegate start];
}

- (void)examplesButton {
    ExamplesPagesViewController *viewController = [[ExamplesPagesViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    viewController.title = @"Examples";
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)startButton {
    UIAlertController* alert = [NameDialogAlertController actionWithHandler:^(UIAlertController *controller) {
        NSString *inputText = controller.textFields[0].text;

        self.creationControllerDelegate = [[CreationController alloc] initWithName:inputText];
        [self.creationControllerDelegate start];
    }];
    
    [self.navigationController presentViewController:alert animated:YES completion:nil];
}

- (void)saveCreation:(NSNotification *)notification {
    NSString *name = notification.userInfo[@"name"];
    UIImage *image = notification.userInfo[@"image"];
    NSString *imagePath = [IPFileManager saveImage:image];
    UserData *userData = [[UserData alloc] initWithName:name imagePath:imagePath];
    [self.navigationController popToViewController:self.navigationController.viewControllers.firstObject animated:YES];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self.userDataDAO addUserData:userData];
    });
}

- (void)giveUpGalleryDelegate {
    self.galleryControllerDelegate = nil;
}

- (void)giveUpStartDelegate {
    self.creationControllerDelegate = nil;
}

#pragma mark - Accessors

- (id<UserDataProtocol>)userDataDAO {
    MainController *weakSelf = self;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        weakSelf.userDataDAO = [[UserDefaultsUserData alloc] init];
    });
    return _userDataDAO;
}

@end
