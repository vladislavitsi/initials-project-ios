//
//  MainController.m
//  initials-project-ios
//
//  Created by Vladislav Kleschenko on 5/11/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//


#import "MainController.h"
#import "NameDialogAlertController.h"
#import "MainControllerStartDelegate.h"
#import "UserDefaultsUserData.h"
#import "IPFileManager.h"
#import "MainControllerGalleryDelegate.h"
#import "MainControllerExamplesDelegate.h"

@interface MainController ()

@property (nonatomic, weak) NavigationController *navigationController;
@property (nonatomic, strong) id<MainControllerDelegate> delegate;
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
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(present:) name:@"navigate.present" object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(saveCreation:) name:@"creation.saveAndExit" object:nil];

        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(giveUpDelegate) name:@"action.mainControllerAppeared" object:nil];

    }
    return self;
}




#pragma mark - Notification actions

- (void)present:(NSNotification *)notification {
    [self.navigationController presentViewController:notification.userInfo[@"destination"] animated:YES completion:nil];
}

- (void)navigateTo:(NSNotification *)notification {
    [self.navigationController pushViewController:notification.userInfo[@"destination"] animated:YES];
}

- (void)galleryButton {
    self.delegate = [[MainControllerGalleryDelegate alloc] initWithDataSource:self.userDataDAO];
    [self.delegate start];
}

- (void)examplesButton {
    self.delegate = [[MainControllerExamplesDelegate alloc] init];
    [self.delegate start];
}

- (void)startButton {
    __weak MainController *weakSelf = self;
    UIAlertController* alert = [NameDialogAlertController actionWithHandler:^(UIAlertController *controller) {
        NSString *inputText = controller.textFields[0].text;
        weakSelf.delegate = [[MainControllerStartDelegate alloc] initWithName:inputText];
        [weakSelf.delegate start];
    }];
    
    [self.navigationController presentViewController:alert animated:YES completion:nil];
}

- (void)saveCreation:(NSNotification *)notification {
    NSString *name = notification.userInfo[@"name"];
    UIImage *image = notification.userInfo[@"image"];
    NSString *imagePath = [IPFileManager saveImage:image];
    UserData *userData = [[UserData alloc] initWithName:name creationDate:[NSDate date] imagePath:imagePath];
    [self.navigationController popToViewController:self.navigationController.viewControllers.firstObject animated:YES];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self.userDataDAO addUserData:userData];
    });
}

- (void)giveUpDelegate {
    self.delegate = nil;
}

#pragma mark - Accessors

- (id<UserDataProtocol>)userDataDAO {
    __weak MainController *weakSelf = self;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        weakSelf.userDataDAO = [[UserDefaultsUserData alloc] init];
    });
    return _userDataDAO;
}

@end
