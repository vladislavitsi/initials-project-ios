//
//  NameDialogAlertController.h
//  initials-project-ios
//
//  Created by Vladislav Kleschenko on 5/11/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NameDialogAlertController : UIAlertController

+ (UIAlertController *)actionWithHandler:(void (^)(UIAlertController *controller))handler;

@end
