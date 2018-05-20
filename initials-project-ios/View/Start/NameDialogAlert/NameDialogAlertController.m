//
//  NameDialogAlertController.m
//  initials-project-ios
//
//  Created by Vladislav Kleschenko on 5/11/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import "NameDialogAlertController.h"

#define ALERT_TITLE @"Create Handkerchief"
#define MESSAGE @"Please, enter your full name.It must consist of 2 or 3 words."
#define CANCEL_TITLE @"Cancel"
#define START_TITLE @"Start"

@implementation NameDialogAlertController

+ (UIAlertController *)actionWithHandler:(void (^)(UIAlertController *))handler {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:ALERT_TITLE message:MESSAGE preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addTextFieldWithConfigurationHandler:nil];
    
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:CANCEL_TITLE style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:START_TITLE style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
        handler(alert);
    }];
    
    [alert addAction:cancelAction];
    [alert addAction:defaultAction];
    return alert;
}

@end
