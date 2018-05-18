//
//  InitialsViewConfigurator.h
//  initials-project-ios
//
//  Created by Vladislav Kleschenko on 5/12/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TableViewCell.h"
#import "IPCreationConfiguration.h"

@interface InitialsViewConfigurator : NSObject

+ (void)configurateView:(UIView *)view withConfiguration:(IPCreationConfiguration *)configuration initials:(NSArray<NSString *> *)initials;

@end
