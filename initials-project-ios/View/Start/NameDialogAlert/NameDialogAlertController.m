//
//  NameDialogAlertController.m
//  initials-project-ios
//
//  Created by Vladislav Kleschenko on 5/11/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import "NameDialogAlertController.h"

@implementation NameDialogAlertController

+ (UIAlertController *)actionWithHandler:(void (^)(UIAlertController *))handler {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Create Handkerchief" message:@"Please, enter your full name.It must consist of 2 or 3 words." preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addTextFieldWithConfigurationHandler:nil];
    
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Start" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
        handler(alert);
    }];
    
    [alert addAction:cancelAction];
    [alert addAction:defaultAction];
    return alert;
}

@end
