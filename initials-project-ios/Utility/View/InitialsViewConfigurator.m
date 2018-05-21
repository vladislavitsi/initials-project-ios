//
//  InitialsViewConfigurator.m
//  initials-project-ios
//
//  Created by Vladislav Kleschenko on 5/12/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "InitialsViewConfigurator.h"
#import "IPFont.h"

#define SEGMENT_COUNT 20.0

@implementation InitialsViewConfigurator

+ (void)configurateView:(UIView *)view width:(CGFloat)width withConfiguration:(IPCreationConfiguration *)configuration initials:(NSArray<NSString *> *)initials{
    NSMutableArray *constraints = [NSMutableArray array];

    CGFloat segment = width/SEGMENT_COUNT;
    
    
    for (NSUInteger i = 0; i < initials.count; i++) {
        UILabel *letterLabel = [[UILabel alloc] init];
        
        Pattern *pattern = (Pattern *) configuration.options[CreationOptionsPattern];
        IPColor *backgroundColor = (IPColor *) configuration.options[CreationOptionsBackgroundColor];
        IPColor *fontColor = (IPColor *) configuration.options[CreationOptionsFontColor];
        IPFont *fontFamily = (IPFont *) configuration.options[CreationOptionsFontFamily];
        CGFloat letterSize = pattern.letterPatterns[i].size;

        letterLabel.text = initials[i];
        letterLabel.font = [UIFont fontWithName:fontFamily.fontName size:letterSize];
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
