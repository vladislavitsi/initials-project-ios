//
//  AbstractPreviewViewController.h
//  initials-project-ios
//
//  Created by Vladislav Kleschenko on 5/13/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AbstractPreviewViewController : UIViewController

@property (nonatomic, copy) NSString *name;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIView *preview;

@end
