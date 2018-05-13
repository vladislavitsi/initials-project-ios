//
//  ResultViewController.h
//  initials-project-ios
//
//  Created by Vladislav Kleschenko on 5/13/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IPCreationConfiguration.h"
#import "AbstractPreviewViewController.h"

@interface ResultViewController : AbstractPreviewViewController

@property (nonatomic, strong) IPCreationConfiguration *configuration;
@property (nonatomic, copy) NSArray<NSString *> *initials;

@end
