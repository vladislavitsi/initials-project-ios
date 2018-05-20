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
#import "Constants.h"

@interface MainController ()

@property (nonatomic, weak) NavigationController *navigationController;
@property (nonatomic, strong) id<MainControllerDelegate> delegate;
@property (nonatomic, strong) id<UserDataProtocol> userDataDAO;

@end

@implementation MainController

- (instancetype)init {
    if (self = [super init]) {
        [[NSNotificationCenter defaultCenter] addObserverForName:NOTIFICATION_INIT_NAVIGATION_CONTROLLER object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
            self.navigationController = note.userInfo[NOTIFICATION_USER_INFO_CONTROLLER];
        }];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(startButton) name:NOTIFICATION_ACTION_START_BUTTON object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(galleryButton) name:NOTIFICATION_ACTION_GALLERY_BUTTON object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(examplesButton) name:NOTIFICATION_ACTION_EXAMPLES_BUTTON object:nil];

        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(navigateTo:) name:NOTIFICATION_NAVIGATION_PUSH object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(present:) name:NOTIFICATION_NAVIGATION_PRESENT object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(saveCreation:) name:NOTIFICATION_CREATION_SAVE_AND_EXIT object:nil];

        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(giveUpDelegate) name:NOTIFICATION_ACTION_MAIN_CONTROLLER_APPEARED object:nil];

    }
    return self;
}




#pragma mark - Notification actions

- (void)present:(NSNotification *)notification {
    [self.navigationController presentViewController:notification.userInfo[NOTIFICATION_USER_INFO_DESTINATION] animated:YES completion:nil];
}

- (void)navigateTo:(NSNotification *)notification {
    [self.navigationController pushViewController:notification.userInfo[NOTIFICATION_USER_INFO_DESTINATION] animated:YES];
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
    NSString *name = notification.userInfo[NOTIFICATION_USER_INFO_NAME];
    UIImage *image = notification.userInfo[NOTIFICATION_USER_INFO_IMAGE];
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
