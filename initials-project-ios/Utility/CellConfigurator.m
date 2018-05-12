//
//  CellConfigurator.m
//  initials-project-ios
//
//  Created by Vladislav Kleschenko on 5/12/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "CellConfigurator.h"

@implementation CellConfigurator

+ (void)configurateCell:(TableViewCell *)cell withConfiguration:(IPCreationConfiguration *)configuration initials:(NSArray<NSString *> *)initials{
    cell.frame = CGRectMake(cell.frame.origin.x, cell.frame.origin.y, cell.frame.size.width, 300);
    cell.descr.text = configuration.pattern.name;
    
    NSMutableArray *constraints = [NSMutableArray array];
    
    CGFloat width = cell.preview.frame.size.width;
    CGFloat segment = width/20.0;
    
    for (int i = 0; i < initials.count; i++) {
        UILabel *letterLabel = [[UILabel alloc] init];
        letterLabel.text = initials[i];
        letterLabel.font = [UIFont systemFontOfSize:configuration.pattern.size];
        letterLabel.textColor = configuration.fontColor.color;
        letterLabel.translatesAutoresizingMaskIntoConstraints = NO;
        
        [cell.preview addSubview:letterLabel];
        cell.preview.backgroundColor = configuration.backgroundColor.color;
        
        [constraints addObject:[letterLabel.centerXAnchor constraintEqualToAnchor:cell.preview.centerXAnchor constant:(segment * (configuration.pattern.letterPatterns[i].x))]];
        [constraints addObject:[letterLabel.centerYAnchor constraintEqualToAnchor:cell.preview.centerYAnchor constant:(segment * (configuration.pattern.letterPatterns[i].y))]];
    }
    [NSLayoutConstraint activateConstraints:constraints];
}

@end
