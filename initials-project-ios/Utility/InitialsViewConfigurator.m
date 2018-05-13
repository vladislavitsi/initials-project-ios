//
//  InitialsViewConfigurator.m
//  initials-project-ios
//
//  Created by Vladislav Kleschenko on 5/12/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "InitialsViewConfigurator.h"


@implementation InitialsViewConfigurator

+ (void)configurateView:(UIView *)view withConfiguration:(IPCreationConfiguration *)configuration initials:(NSArray<NSString *> *)initials{
    NSMutableArray *constraints = [NSMutableArray array];
    
    CGFloat width = view.frame.size.width;
    CGFloat segment = width/20.0;
    
    for (int i = 0; i < initials.count; i++) {
        UILabel *letterLabel = [[UILabel alloc] init];
        
        Pattern *pattern = (Pattern *) configuration.options[CreationOptionsPattern];
        IPColor *backgroundColor = (IPColor *) configuration.options[CreationOptionsBackgroundColor];
        IPColor *fontColor = (IPColor *) configuration.options[CreationOptionsFontColor];
        
        letterLabel.text = initials[i];
        letterLabel.font = [UIFont systemFontOfSize:pattern.size];
        letterLabel.textColor = fontColor.color;
        letterLabel.translatesAutoresizingMaskIntoConstraints = NO;
        
        [view addSubview:letterLabel];
        view.backgroundColor = backgroundColor.color;
        
        [constraints addObject:[letterLabel.centerXAnchor constraintEqualToAnchor:view.centerXAnchor constant:(segment * (pattern.letterPatterns[i].x))]];
        [constraints addObject:[letterLabel.centerYAnchor constraintEqualToAnchor:view.centerYAnchor constant:(segment * (pattern.letterPatterns[i].y))]];
    }
    [NSLayoutConstraint activateConstraints:constraints];
}

@end
